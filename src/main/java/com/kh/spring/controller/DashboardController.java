package com.kh.spring.controller;

import com.kh.spring.service.InstagramService;
import com.kh.spring.service.YouTubeService;
import com.kh.spring.dto.*;
import com.kh.spring.mapper.ChzzkChanelMapper;
import com.kh.spring.mapper.InstagramChannelMapper;
import com.kh.spring.mapper.YoutubeChannelMapper;
import com.kh.spring.model.vo.Member;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

    @Autowired
    private ChzzkChanelMapper chzzkChanelMapper;
    private final YouTubeService youTubeService;

    public DashboardController(YouTubeService youTubeService) {
        this.youTubeService = youTubeService; // DI
    }


    @Autowired
    private YoutubeChannelMapper youtubeChannelMapper;
    @Autowired
    private InstagramChannelMapper instagramChannelMapper;
    @Autowired
    private InstagramService instagramService;


    /** -------------------------------
     *  대시보드 메인 페이지
     * ------------------------------- */
    @GetMapping
    public String dashboard(Model model, HttpSession session) {
        Map<String, Object> channelData = new HashMap<>();
        try {
            Member loginMember = (Member) session.getAttribute("loginMember");
            if (loginMember == null) {
                return "redirect:/login";
            }
            int memberId = loginMember.getMemberId();
            // 치지직 채널
            List<ChzzkChanelDto> chzzkChanels = chzzkChanelMapper.findByPlatformTypeAndStatus("CHZZK", "Y");
            model.addAttribute("chzzkChanels", chzzkChanels);

            List<YoutubedashboardDto> ytChannels = youTubeService.getChannelByMemberId(memberId);

            // Instagram 채널
            List<InstagramdashboardDto> igAccounts = instagramService.getInstagramAccounts(memberId);

            // 두 채널을 하나의 Map에 담기

            channelData.put("yt", ytChannels);
            channelData.put("ig", igAccounts);

            model.addAttribute("channel", channelData); // 한 번만 추가
            model.addAttribute("contentPage", "dashboard");
            return "components/layout";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "대시보드 데이터를 불러오는 중 오류가 발생했습니다.");
            return "error";
        }
    }


}

