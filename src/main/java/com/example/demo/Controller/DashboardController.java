package com.example.demo.Controller;

import com.example.demo.Service.ChanelService;
import com.example.demo.Service.InstagramService;
import com.example.demo.Service.YouTubeService;
import com.example.demo.dto.*;
import com.example.demo.mapper.ChzzkChanelMapper;
import com.example.demo.mapper.InstagramChannelMapper;
import com.example.demo.mapper.YoutubeChannelMapper;

import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
    public String dashboard(Model model) {
        Map<String, Object> channelData = new HashMap<>();
        try {
            Long memberId = 6L;
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
            return "dashboard";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "대시보드 데이터를 불러오는 중 오류가 발생했습니다.");
            return "error";
        }
    }


}

