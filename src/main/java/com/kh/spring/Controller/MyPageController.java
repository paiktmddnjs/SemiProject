package com.kh.spring.Controller;

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
            return "loginForm.me";
        }

        // layout.jsp가 어떤 내용을 include 할지 구분하는 용도
        model.addAttribute("contentPage", "mypage");

        return "components/layout";   // ★ layout.jsp에서 /WEB-INF/views/mypage.jsp를 include
    }
}
