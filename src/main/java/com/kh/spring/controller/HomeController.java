package com.kh.spring.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(HttpSession session, Model model){
        // 로그인 여부 확인
        Object loginMember = session.getAttribute("loginMember");
        
        if (loginMember != null) {
            // 로그인되어 있으면 대시보드로
            model.addAttribute("contentPage", "dashboard");
            model.addAttribute("pageTitle", "대시보드");
            return "components/layout";
        } else {
            // 로그인되지 않았으면 랜딩 페이지로
            return "Landing_Page";
        }
    }
}