package com.kh.spring.controller;


import com.kh.spring.service.ChanelService;
import com.kh.spring.service.InstagramService;
import com.kh.spring.dto.InstagramChannelDto;
import com.kh.spring.model.vo.Member;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class InstagramAuthController {
    private final InstagramService instagramService;
    private final ChanelService chanelService;

    public InstagramAuthController(InstagramService instagramService, ChanelService chanelService) {
        this.instagramService = instagramService;
        this.chanelService = chanelService;
    }
    @GetMapping("/instagram/login")
    public String instagramLogin() {
        return "redirect:/instagram/dashboard"; // JSP 파일 찾지 않게 함
    }



    @GetMapping("/instagram/dashboard")
    public String instagramDashboard(Model model, HttpSession session) {
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/login";
        }
        int memberId = loginMember.getMemberId();
        // 1. Instagram API에서 계정 정보 가져오기
        InstagramChannelDto igChannel = instagramService.getAccountStats();

        // 2. DB에 저장 (중복이면 업데이트)
        chanelService.saveChannel(igChannel, memberId, "INSTAGRAM");

        // 3. JSP에 전달
        model.addAttribute("channel", Map.of("ig", List.of(igChannel)));

        return "redirect:/dashboard";
    }
}
/*
  @GetMapping("/instagram/dashboard")
    public String instagramDashboard(Model model, HttpSession session) {
        // 세션에서 memberId 가져오기
        Long memberId = (Long) session.getAttribute("memberId");
        if (memberId == null) {
            // 로그인 정보 없으면 로그인 페이지로 이동
            return "redirect:/login";
        }

        // 1. Instagram API에서 계정 정보 가져오기
        InstagramChannelDto igChannel = instagramService.getAccountStats();

        // 2. DB에 저장 (중복이면 업데이트)
        chanelService.saveChannel(igChannel, memberId, "INSTAGRAM");

        // 3. JSP에 전달
        model.addAttribute("channel", Map.of("ig", List.of(igChannel)));

        return "dashboard";
    }


 @GetMapping("/instagram/dashboard")
    public String instagramDashboard(Model model) {
        InstagramChannelDto igChannel = instagramService.getAccountStats();

        model.addAttribute("channel", Map.of("ig", List.of(igChannel)));

        return "dashboard";
    }
 */