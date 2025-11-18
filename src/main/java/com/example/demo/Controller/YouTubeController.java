package com.example.demo.Controller;

import com.example.demo.Service.ChanelService;
import com.example.demo.Service.ChanelService;
import com.example.demo.Service.YouTubeService;
import com.example.demo.dto.ChannelDto;
import com.example.demo.dto.YoutubeChannelDto;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class YouTubeController {

    private final YouTubeService youtubeService;
    private final ChanelService chanelService;

    public YouTubeController(YouTubeService youtubeService, ChanelService chanelService) {
        this.youtubeService = youtubeService;
        this.chanelService = chanelService;
    }

    // 로그인 페이지
    @GetMapping("/login2")
    public String loginPage() {
        return "login2";
    }

    // YouTube 로그인 → Google OAuth 페이지
    @GetMapping("/youtube/login2")
    public String youtubeLogin() {
        String authorizationUrl = youtubeService.getAuthorizationUrl();
        return "redirect:" + authorizationUrl;
    }

    // OAuth2 Callback
    @GetMapping("/oauth2callback")
    public String oauth2callback(@RequestParam String code, Model model) {
        // 1. Access Token 발급
        String accessToken = youtubeService.getAccessToken(code);

        // 2. 채널 정보 가져오기
        JSONObject statsJson = youtubeService.getMyChannelStats(accessToken);

        // 3. DTO 변환 (YoutubeChannelDto 구조에 맞게)
        YoutubeChannelDto channel = new YoutubeChannelDto();
        channel.setMemberId(5L); // 실제 로그인 회원 ID로 변경
        channel.setName(statsJson.optString("name"));
        channel.setHandle(statsJson.optString("handle"));
        channel.setSubs(statsJson.optLong("subs", 0));
        channel.setViews(statsJson.optLong("totalViews", 0));
        channel.setVideos(statsJson.optLong("videoCount", 0));
        channel.setChanelUrl(statsJson.optString("url"));
        channel.setPlatformType("YOUTUBE");
        channel.setChanelStatus("Y");

        // DB 저장
        chanelService.saveChannel(channel, channel.getMemberId(), "YOUTUBE");

        // JSP에 전달 (대시보드에서 ${channel.yt.name} 등으로 사용 가능)
        model.addAttribute("channel", Map.of("yt", channel));

        return "redirect:/dashboard";
    }
}

/*
@GetMapping("/oauth2callback")
public String oauth2callback(@RequestParam String code, Model model, HttpSession session) {

    // 0. 세션에서 memberId 가져오기
    Long memberId = (Long) session.getAttribute("memberId");
    if (memberId == null) {
        // 로그인 정보 없으면 로그인 페이지로 이동
        return "redirect:/login2";
    }

    // 1. Access Token 발급
    String accessToken = youtubeService.getAccessToken(code);

    // 2. 채널 정보 가져오기
    JSONObject statsJson = youtubeService.getMyChannelStats(accessToken);

    // 3. DTO 변환
    YoutubeChannelDto channel = new YoutubeChannelDto();
    channel.setMemberId(memberId);  // 세션에서 가져온 memberId 사용
    channel.setName(statsJson.optString("name"));
    channel.setHandle(statsJson.optString("handle"));
    channel.setSubs(statsJson.optLong("subs", 0));
    channel.setViews(statsJson.optLong("totalViews", 0));
    channel.setVideos(statsJson.optLong("videoCount", 0));
    channel.setChanelUrl(statsJson.optString("url"));
    channel.setPlatformType("YOUTUBE");
    channel.setChanelStatus("Y");

    // DB 저장
    chanelService.saveChannel(channel, memberId, "YOUTUBE");

    // JSP에 전달
    model.addAttribute("channel", Map.of("yt", channel));

    return "dashboard";
}
 */