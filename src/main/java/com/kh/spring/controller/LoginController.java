package com.kh.spring.controller;

import com.kh.spring.dto.MemberDto;
import com.kh.spring.service.MemberService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

    private final MemberService memberService;

    @Autowired
    public LoginController(MemberService memberService) {
        this.memberService = memberService;
    }

    @GetMapping("/login") // URL 매핑
    public String loginPage(HttpSession session) {
        // 이미 로그인되어 있으면 메인 페이지로 리다이렉트
        if (session.getAttribute("loginMember") != null) {
            return "redirect:/";
        }
        return "Login"; // /WEB-INF/views/Login.jsp 를 찾아서 렌더링
    }
    
    @PostMapping("/login") // 로그인 처리
    public String login(@RequestParam(required = false) String email, 
                       @RequestParam(required = false) String memberPwd,
                       HttpSession session,
                       RedirectAttributes ra) {
        try {
            // 입력값 검증
            if (email == null || email.trim().isEmpty()) {
                ra.addFlashAttribute("msg", "이메일을 입력해주세요.");
                return "redirect:/login";
            }
            
            if (memberPwd == null || memberPwd.trim().isEmpty()) {
                ra.addFlashAttribute("msg", "비밀번호를 입력해주세요.");
                return "redirect:/login";
            }
            
            // 로그인 처리
            MemberDto member = memberService.login(email.trim(), memberPwd);
            
            if (member != null) {
                // 세션에 로그인 정보 저장
                session.setAttribute("loginMember", member);
                session.setAttribute("memberId", member.getMemberId());
                session.setAttribute("memberName", member.getMemberName());
                session.setAttribute("memberEmail", member.getEmail());
                
                ra.addFlashAttribute("msg", member.getMemberName() + "님 환영합니다!");
                
                // 레이아웃 페이지로 이동 (대시보드)
                return "redirect:/"; // HomeController에서 로그인 여부 확인 후 레이아웃 페이지로 이동
            } else {
                ra.addFlashAttribute("msg", "이메일 또는 비밀번호가 올바르지 않습니다.");
                return "redirect:/login";
            }
        } catch (Exception e) {
            e.printStackTrace();
            ra.addFlashAttribute("msg", "로그인 중 오류가 발생했습니다. 다시 시도해주세요.");
            return "redirect:/login";
        }
    }
    
    @GetMapping("/signup")
    public String signUpPage() {
        return "Sign_Up"; // /WEB-INF/views/Sign_Up.jsp
    }

    @GetMapping("/landing")
    public String landingPage() {
        return "Landing_Page"; // /WEB-INF/views/Landing_Page.jsp
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/"; // 랜딩 페이지로 이동
    }

}