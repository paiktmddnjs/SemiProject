package com.kh.spring.Service;

import com.kh.spring.dto.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;
import org.springframework.web.util.UriUtils;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

@Service
public class ChzzkAuthService {
    private static final Logger log = LoggerFactory.getLogger(ChzzkAuthService.class);

    @Value("${chzzk.client-id}")
    private String clientId;

    @Value("${chzzk.client-secret}")
    private String clientSecret;

    @Value("${chzzk.redirect-uri}")
    private String redirectUri;

    private final String NAVER_AUTH_URL = "https://chzzk.naver.com/account-interlock";
    private final String NAVER_TOKEN_URL = "https://openapi.chzzk.naver.com/auth/v1/token";
    private final String CHZZK_CHANNEL_INFO_URL = "https://openapi.chzzk.naver.com/open/v1/channels";

    private final WebClient webClient;

    public ChzzkAuthService(WebClient.Builder webClientBuilder) {
        this.webClient = webClientBuilder.build();
    }

    public String buildAuthUrl(String state) {
        String encodedRedirect = UriUtils.encode(redirectUri, StandardCharsets.UTF_8);
        return NAVER_AUTH_URL
                + "?response_type=code"
                + "&clientId=" + clientId
                + "&redirectUri=" + encodedRedirect
                + "&state=" + state;
    }

    /**
     * JSON 형식으로 Access Token 요청
     */
    public Map<String, Object> getAccessToken(String code, String state) {
        Map<String, String> requestBody = new HashMap<>();
        requestBody.put("grantType", "authorization_code");
        requestBody.put("clientId", clientId);
        requestBody.put("clientSecret", clientSecret);
        requestBody.put("code", code);
        requestBody.put("state", state);
        requestBody.put("redirectUri", redirectUri);

        log.info("===== 치지직 토큰 발급 요청 =====");
        log.info("요청 URL: {}", NAVER_TOKEN_URL);
        log.info("=================================");

        try {
            Map<String, Object> response = webClient.post()
                    .uri(NAVER_TOKEN_URL)
                    .contentType(MediaType.APPLICATION_JSON)
                    .bodyValue(requestBody)
                    .retrieve()
                    .bodyToMono(Map.class)
                    .block();

            log.info("✅ 토큰 발급 성공!");
            log.info("===== 전체 응답 내용 =====");
            log.info("응답 전체: {}", response);
            log.info("응답 키: {}", response.keySet());
            response.forEach((key, value) -> {
                log.info("{}={}", key, value);
            });
            log.info("=========================");
            return response;
        } catch (WebClientResponseException e) {
            log.error("❌ 토큰 발급 에러");
            log.error("HTTP Status: {}", e.getStatusCode());
            log.error("Error Body: {}", e.getResponseBodyAsString());
            throw e;
        }
    }

    /**
     * Access Token으로 유저 정보(채널 정보) 조회 (DTO 버전)
     * @param accessToken 사용자 Access Token
     * @return 유저 정보 DTO
     */
    public ChzzkApiResponse<ChzzkUserInfoDto> getUserInfoDto(String accessToken) {
        String userInfoUrl = "https://openapi.chzzk.naver.com/open/v1/users/me";

        log.info("===== 유저 정보 조회 요청 (DTO) =====");
        log.info("요청 URL: {}", userInfoUrl);

        try {
            ChzzkApiResponse<ChzzkUserInfoDto> response = webClient.get()
                    .uri(userInfoUrl)
                    .header(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken)
                    .retrieve()
                    .bodyToMono(new ParameterizedTypeReference<ChzzkApiResponse<ChzzkUserInfoDto>>() {})
                    .block();

            log.info("✅ 유저 정보 조회 성공 (DTO)!");
            if (response != null && response.getContent() != null) {
                log.info("channelId: {}, channelName: {}", 
                    response.getContent().getChannelId(), 
                    response.getContent().getChannelName());
            }
            return response;
        } catch (WebClientResponseException e) {
            log.error("❌ 유저 정보 조회 에러");
            log.error("HTTP Status: {}", e.getStatusCode());
            log.error("Error Body: {}", e.getResponseBodyAsString());
            throw e;
        } catch (Exception e) {
            log.error("❌ 유저 정보 조회 중 예외 발생: {}", e.getMessage());
            throw e;
        }
    }

    /**
     * Access Token으로 유저 정보(채널 정보) 조회 (기존 Map 버전 - 호환성 유지)
     * @param accessToken 사용자 Access Token
     */
    public Map<String, Object> getUserInfo(String accessToken) {
        String userInfoUrl = "https://openapi.chzzk.naver.com/open/v1/users/me";

        log.info("===== 유저 정보 조회 요청 =====");
        log.info("요청 URL: {}", userInfoUrl);
        log.info("accessToken 길이: {}", accessToken.length());
        log.info("accessToken (처음 30자): {}", accessToken.substring(0, 30));
        log.info("accessToken (마지막 30자): {}", accessToken.substring(accessToken.length() - 30));
        log.info("Authorization 헤더 값: Bearer {}", accessToken);

        try {
            Map<String, Object> response = webClient.get()
                    .uri(userInfoUrl)
                    .header(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken)
                    .retrieve()
                    .bodyToMono(Map.class)
                    .block();

            log.info("✅ 유저 정보 조회 성공!");
            log.info("===== 전체 응답 내용 =====");
            log.info("응답 전체: {}", response);
            log.info("응답 키: {}", response.keySet());
            log.info("=========================");
            return response;
        } catch (WebClientResponseException e) {
            log.error("❌ 유저 정보 조회 에러");
            log.error("HTTP Status: {}", e.getStatusCode());
            log.error("Error Body: {}", e.getResponseBodyAsString());
            log.error("요청한 Authorization: Bearer {}", accessToken);
            throw e;
        }
    }

    /**
     * Client 인증으로 채널 정보 조회 (DTO 버전)
     * @param channelId 조회할 채널 ID
     * @return 채널 정보 응답 DTO (content는 {data: [...]} 형태)
     */
    public ChzzkApiResponse<ChzzkChannelListContentDto> getChannelInfoDto(String channelId) {
        String urlWithParams = CHZZK_CHANNEL_INFO_URL + "?channelIds=" + UriUtils.encode(channelId, StandardCharsets.UTF_8);

        log.info("===== 채널 정보 조회 요청 (DTO) =====");
        log.info("요청 URL: {}", urlWithParams);
        log.info("channelId: {}", channelId);

        try {
            ChzzkApiResponse<ChzzkChannelListContentDto> response = webClient.get()
                    .uri(urlWithParams)
                    .header("Client-Id", clientId)
                    .header("Client-Secret", clientSecret)
                    .retrieve()
                    .bodyToMono(new ParameterizedTypeReference<ChzzkApiResponse<ChzzkChannelListContentDto>>() {})
                    .block();

            log.info("✅ 채널 정보 조회 성공 (DTO)!");
            if (response != null && response.getContent() != null && 
                response.getContent().getData() != null && !response.getContent().getData().isEmpty()) {
                ChzzkChannelDto channel = response.getContent().getData().get(0);
                log.info("channelName: {}, followerCount: {}", 
                    channel.getChannelName(), channel.getFollowerCount());
            }
            return response;
        } catch (WebClientResponseException e) {
            log.error("❌ 채널 정보 조회 에러");
            log.error("HTTP Status: {}", e.getStatusCode());
            log.error("Error Body: {}", e.getResponseBodyAsString());
            throw e;
        } catch (Exception e) {
            log.error("❌ 채널 정보 조회 중 예외 발생: {}", e.getMessage());
            throw e;
        }
    }

    /**
     * Client 인증으로 채널 정보 조회 (기존 Map 버전 - 호환성 유지)
     * @param channelId 조회할 채널 ID
     */
    public Map<String, Object> getChannelInfo(String channelId) {
        // Query parameter를 포함한 전체 URL 생성
        String urlWithParams = CHZZK_CHANNEL_INFO_URL + "?channelIds=" + UriUtils.encode(channelId, StandardCharsets.UTF_8);

        log.info("===== 채널 정보 조회 요청 =====");
        log.info("요청 URL: {}", urlWithParams);
        log.info("channelId: {}", channelId);

        try {
            Map<String, Object> response = webClient.get()
                    .uri(urlWithParams)
                    .header("Client-Id", clientId)  // Client 인증: Client-Id 헤더
                    .header("Client-Secret", clientSecret)  // Client 인증: Client-Secret 헤더
                    .retrieve()
                    .bodyToMono(Map.class)
                    .block();

            log.info("✅ 채널 정보 조회 성공!");
            log.info("응답: {}", response);
            return response;
        } catch (WebClientResponseException e) {
            log.error("❌ 채널 정보 조회 에러");
            log.error("HTTP Status: {}", e.getStatusCode());
            log.error("Error Body: {}", e.getResponseBodyAsString());
            throw e;
        }
    }

    /**
     * Access Token으로 채널 구독자 목록 조회
     *
     * @param accessToken 사용자 Access Token
     * @param channelId   조회할 채널 ID
     * @param page        페이지 (optional)
     * @param size        페이지 크기 (optional)
     * @param sort        정렬 (RECENT, LONGER) optional
     */
    public Map<String, Object> getChannelSubscribers(String accessToken,
                                                     String channelId,
                                                     Integer page,
                                                     Integer size,
                                                     String sort) {
        String baseUrl = "https://openapi.chzzk.naver.com/open/v1/channels/subscribers";

        log.info("===== 채널 구독자 조회 요청 =====");
        log.info("요청 URL: {}", baseUrl);
        log.info("channelId: {}", channelId);

        try {
            Map<String, Object> response = webClient.get()
                    // 1. .uri()에 baseUrl을 첫 번째 인자로 전달합니다.
                    .uri(baseUrl, uriBuilder -> {
                        // 2. .path(baseUrl) 코드를 삭제하고,
                        //    바로 uriBuilder에서 파라미터 설정을 시작합니다.
                        var builder = uriBuilder.queryParam("channelId", channelId);
                        if (page != null) {
                            builder.queryParam("page", page);
                        }
                        if (size != null) {
                            builder.queryParam("size", size);
                        }
                        if (sort != null && !sort.isBlank()) {
                            builder.queryParam("sort", sort);
                        }
                        return builder.build();
                    })
                    .header(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken)
                    .retrieve()
                    .bodyToMono(Map.class)
                    .block();

            log.info("✅ 채널 구독자 조회 성공!");
            log.info("응답: {}", response);
            return response;
        } catch (WebClientResponseException e) {
            log.error("❌ 채널 구독자 조회 에러");
            log.error("HTTP Status: {}", e.getStatusCode());
            log.error("Error Body: {}", e.getResponseBodyAsString());
            throw e;
        }
        // 3. (중요) Controller의 catch (Exception e) 블록이
        //    IllegalArgumentException (Host is not specified)을 잡지 않도록
        //    catch 블록을 추가합니다.
        catch (IllegalArgumentException e) {
            log.error("❌ URI 생성 실패 (IllegalArgumentException): {}", e.getMessage());
            throw e; // 예외를 다시 던져서 컨트롤러가 알 수 있게 함
        }
    }

}