package com.kh.spring.controller;

import com.kh.spring.model.vo.Member;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {

    @GetMapping("/myPage.me")
    public String myPage(HttpSession session, Model model) {

        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            // 로그인 안 되어 있으면 로그인 폼으로 리다이렉트
            return "redirect:/loginForm.me";
        }

        // layout.jsp가 어떤 내용을 include 할지 구분하는 용도
        model.addAttribute("contentPage", "mypage");

        // /WEB-INF/views/components/layout.jsp
        // 내부에서 <jsp:include page="${contentPage}.jsp" /> 같은 구조라고 가정
        return "components/layout";
    }
}
