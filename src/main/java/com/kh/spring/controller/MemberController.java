package com.kh.spring.controller;

import com.kh.spring.service.MemberService;
import com.kh.spring.model.vo.Member;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequiredArgsConstructor
@Controller
public class MemberController {
    private final MemberService memberService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @PostMapping("insert.me")
    public String joinMember(Member member, HttpSession httpSession, Model model) {
        String pwd = bCryptPasswordEncoder.encode(member.getMemberPwd());
        member.setMemberPwd(pwd);

        int result = memberService.addMember(member);
        if(result > 0){
            httpSession.setAttribute("alertMsg", "회원가입에 성공하였습니다.");
            return "redirect:/";
        } else {
            model.addAttribute("errorMsg", "회원가입에 실패하였습니다.");
            return "SignUp";
        }
    }

    @GetMapping("enrollForm.me")
    public String enrollForm() {
        return "SignUp";
    }

    @GetMapping("loginForm.me")
    public  String login() {return "Login";}

    @GetMapping("emailDuplicateCheck.me")
    @ResponseBody
    public String emailDuplicateCheck(@RequestParam String checkEmail) {
        int count = memberService.getMemberCountByEmail(checkEmail);

        return count > 0 ? "NNNNN" : "NNNNY";
    }

    @PostMapping("login.me")
    public ModelAndView login(String email,
                              String memberPwd,
                              HttpSession session,
                              ModelAndView mv) {

        Member loginMember = memberService.getMemberByEmail(email);
        if (loginMember == null) {
            mv.addObject("errorMsg", "아이디를 찾을 수 없습니다.");
            mv.setViewName("Login");

        }else if (!bCryptPasswordEncoder.matches(memberPwd, loginMember.getMemberPwd())) {
            mv.addObject("errorMsg", "비밀번호를 확인해 주세요.");
            mv.setViewName("Login");

        }else{
            session.setAttribute("loginMember", loginMember);
            mv.setViewName("redirect:/");

        }
        return mv;
    }
    @GetMapping("/logout.me")
    public String logout(HttpSession httpSession) {
        httpSession.removeAttribute("loginMember");
        return "redirect:/";
    }
}
