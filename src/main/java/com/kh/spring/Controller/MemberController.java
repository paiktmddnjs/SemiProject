package com.kh.spring.Controller;

import com.kh.spring.Service.MemberService;
import com.kh.spring.model.vo.Member;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
            return "common/error";
        }
    }

    @GetMapping("enrollForm.me")
    public String enrollForm() {
        return "Sign_Up";
    }

    @GetMapping("loginForm.me")
    public  String login() {return "Login";}
}
