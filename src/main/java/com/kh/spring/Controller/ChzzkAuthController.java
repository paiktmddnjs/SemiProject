package com.kh.spring.Controller;

import com.kh.spring.Service.ChzzkAuthService;
import com.kh.spring.Service.ChzzkDataService;
import com.kh.spring.dto.ChzzkApiResponse;
import com.kh.spring.dto.ChzzkChanelDto;
import com.kh.spring.dto.ChzzkChannelDto;
import com.kh.spring.dto.ChzzkChannelListContentDto;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/chzzk")
public class ChzzkAuthController {

    private static final Logger log = LoggerFactory.getLogger(ChzzkAuthController.class);

    @Autowired
    private ChzzkAuthService authService;

    @Autowired
    private ChzzkDataService chzzkDataService;

    /**
     * 치지직 로그인 시작 - 인증 URL로 리다이렉트
     */
    @GetMapping("/login")
    public void login(HttpSession session, HttpServletResponse response) throws IOException {
        // CSRF 방어를 위한 state 생성
        String state = java.util.UUID.randomUUID().toString();
        session.setAttribute("chzzk_oauth_state", state);

        // 인증 URL 생성
        String authUrl = authService.buildAuthUrl(state);

        log.info("치지직 로그인 시작 - 인증 URL로 리다이렉트: {}", authUrl);

        // 치지직 인증 페이지로 리다이렉트
        response.sendRedirect(authUrl);
    }

    // ChzzkAuthController.java -> callback 메소드 내부

    @GetMapping("/callback")
    public String callback(@RequestParam("code") String code,
                           @RequestParam("state") String state,
                           HttpSession session, // (이전 제안대로) 세션도 받는 것이 좋습니다.
                           Model model) {

        // CSRF 방어 로직
        String storedState = (String) session.getAttribute("chzzk_oauth_state");
        if (storedState == null || !storedState.equals(state)) {
            log.error("CSRF 검증 실패: 세션의 state와 일치하지 않습니다. stored={}, received={}", storedState, state);
            model.addAttribute("error", "CSRF 검증 실패: 인증 요청이 유효하지 않습니다.");
            return "error";
        }
        session.removeAttribute("chzzk_oauth_state");

        try {
            // 1. code로 Access Token 발급
            Map<String, Object> tokenResponse = authService.getAccessToken(code, state);

            // 2. 응답 구조: {code=200, message=null, content={accessToken=..., ...}}
            Object contentObj = tokenResponse.get("content");
            if (!(contentObj instanceof Map<?, ?> content)) {
                log.error("!!! 'content' 객체를 찾을 수 없습니다 !!!");
                log.error("getAccessToken으로부터 받은 전체 응답: {}", tokenResponse);
                model.addAttribute("error", "토큰 응답에서 'content' 객체를 찾을 수 없습니다.");
                return "error";
            }

            // content에서 accessToken 추출 (camelCase)
            String accessToken = (String) content.get("accessToken");

            // 3. (필수) 토큰이 null인지 방어 코드 추가
            if (accessToken == null) {
                log.error("!!! 'accessToken' 키를 찾을 수 없습니다 !!!");
                log.error("content 객체: {}", content);
                model.addAttribute("error", "토큰을 받아왔으나 'accessToken' 키를 찾을 수 없습니다.");
                return "error";
            }

            // 4. Access Token으로 유저 정보 조회 (정상 진행)
            Map<String, Object> userInfoResponse = authService.getUserInfo(accessToken);

            Object userContentObj = userInfoResponse.get("content");
            if (!(userContentObj instanceof Map<?, ?> userContent)) {
                log.error("!!! 유저 정보 응답에서 'content' 객체를 찾을 수 없습니다 !!!");
                log.error("getUserInfo로부터 받은 전체 응답: {}", userInfoResponse);
                model.addAttribute("error", "유저 정보 응답에서 'content' 객체를 찾을 수 없습니다.");
                return "error";
            }

            // 5. 유저 정보에서 channelId와 channelName 추출
            String channelId = (String) userContent.get("channelId");
            String channelName = (String) userContent.get("channelName");
            if (channelName == null) {
                channelName = (String) userContent.get("channel_name");
            }

            if (channelId == null) {
                log.error("!!! 유저 정보에 'channelId' 키가 없습니다 !!!");
                log.error("getUserInfo로부터 받은 전체 응답: {}", userInfoResponse);
                // 일단 snake_case로 다시 시도
                channelId = (String) userContent.get("channel_id");
                if (channelId == null) {
                    model.addAttribute("error", "유저 정보는 받아왔으나 'channelId' 키를 찾을 수 없습니다.");
                    return "error";
                }
            }

            // 6. channelId로 채널 상세 정보 조회 (DTO 버전)
            ChzzkApiResponse<ChzzkChannelListContentDto> channelInfoResponse =
                authService.getChannelInfoDto(channelId);

            ChzzkChannelDto channelDto = null;
            if (channelInfoResponse != null && channelInfoResponse.isSuccess() &&
                channelInfoResponse.getContent() != null &&
                channelInfoResponse.getContent().getData() != null &&
                !channelInfoResponse.getContent().getData().isEmpty()) {
                channelDto = channelInfoResponse.getContent().getData().get(0);
            }

            if (channelDto == null) {
                log.warn("채널 상세 정보에서 유효한 데이터가 없습니다.");
            }

            // 8. 채널 구독자 목록 조회 (최대 10명, 최근 순) - 실패해도 흐름 유지
            java.util.List<Map<String, Object>> subscriberList = java.util.Collections.emptyList();
            try {
                Map<String, Object> subscriberResponse = authService.getChannelSubscribers(accessToken, channelId, 0, 10, "RECENT");
                Object subscriberContentObj = subscriberResponse.get("content");
                if (subscriberContentObj instanceof Map<?, ?> subscriberContent) {
                    Object dataObj = subscriberContent.get("data");
                    if (dataObj instanceof java.util.List<?> dataList) {
                        //noinspection unchecked
                        subscriberList = (java.util.List<Map<String, Object>>) dataList;
                    }
                } else if (subscriberResponse.get("data") instanceof java.util.List<?> dataList) {
                    // 혹시 content가 없이 data 배열을 직접 반환하는 경우 대비
                    //noinspection unchecked
                    subscriberList = (java.util.List<Map<String, Object>>) dataList;
                }
                log.info("✅ 채널 구독자 파싱 성공: {}명", subscriberList.size());
            } catch (Exception e) {
                log.warn("채널 구독자 조회 실패 (무시): {}", e.getMessage());
            }

            // 9. DB에 채널 정보 저장 (DTO 버전)
            Long savedChanelId = null;
            try {
                log.info("===== DB 저장 시작 =====");
                // TODO: 실제 로그인한 사용자의 memberId를 세션에서 가져오기
                // 현재는 null로 전달하여 Service에서 기본 회원을 자동으로 찾거나 생성
                Long memberId = null;
                if (channelDto != null) {
                    log.info("채널 저장 시작 - channelName: {}", channelDto.getChannelName());
                    ChzzkChanelDto savedChanel = chzzkDataService.saveChanel(channelDto, memberId);
                    if (savedChanel != null) {
                        savedChanelId = savedChanel.getChanelId();
                        log.info("✅ 채널 정보 DB 저장 완료: {}", savedChanelId);
                        model.addAttribute("savedChanelId", savedChanelId);
                    } else {
                        log.warn("채널 저장 결과가 null입니다.");
                    }
                } else {
                    log.warn("channelDto가 null이어서 저장하지 않습니다.");
                }

                // 구독자 정보 저장 (선택적)
                if (!subscriberList.isEmpty() && savedChanelId != null) {
                    try {
                        log.info("구독자 정보 저장 시작 - {}명", subscriberList.size());
                        chzzkDataService.saveSubscriberData(savedChanelId, subscriberList);
                    } catch (Exception e) {
                        log.error("❌ 구독자 데이터 저장 중 오류 발생 (계속 진행): {}", e.getMessage());
                    }
                } else {
                    log.info("구독자 정보 저장 건너뜀 (구독자 수: {}, savedChanelId: {})", subscriberList.size(), savedChanelId);
                }
                log.info("===== DB 저장 완료 =====");
            } catch (Exception e) {
                log.error("❌ DB 저장 중 오류 발생 (계속 진행)", e);
                e.printStackTrace(); // 스택 트레이스 출력
                // DB 저장 실패해도 화면은 표시
            }

            // 10. 연동 완료 후 대시보드로 리다이렉트
            log.info("✅ 치지직 채널 연동 완료 - 대시보드로 리다이렉트");
            return "redirect:/dashboard";

        } catch (WebClientResponseException e) { // API 통신 자체 실패 시
            log.error("❌ API 호출 실패 (Controller): {}", e.getMessage());
            model.addAttribute("error", "API 호출 실패: " + e.getResponseBodyAsString());
            return "error";
        } catch (Exception e) { // 그 외 모든 예외 (NPE 등)
            log.error("❌ 처리 중 알 수 없는 예외 발생 (Controller)", e); // <-- NPE 스택 트레이스가 여기에 찍힙니다.
            model.addAttribute("error", "인증 처리 중 오류가 발생했습니다: " + e.getMessage());
            return "error";
        }
    }


}