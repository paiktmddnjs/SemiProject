package com.kh.spring.controller;


import com.kh.spring.dto.MemberDto;
import com.kh.spring.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;

    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @PostMapping("/signup")
    public String signup(@ModelAttribute MemberDto member, RedirectAttributes ra) {
        try {
            // 입력값 검증
            if (member.getEmail() == null || member.getEmail().trim().isEmpty()) {
                ra.addFlashAttribute("msg", "이메일을 입력해주세요.");
                return "redirect:/signup";
            }
            
            if (member.getMemberPwd() == null || member.getMemberPwd().trim().isEmpty()) {
                ra.addFlashAttribute("msg", "비밀번호를 입력해주세요.");
                return "redirect:/signup";
            }
            
            if (member.getMemberName() == null || member.getMemberName().trim().isEmpty()) {
                ra.addFlashAttribute("msg", "이름을 입력해주세요.");
                return "redirect:/signup";
            }
            
            // 이메일 중복 체크
            if (memberService.isEmailExists(member.getEmail().trim())) {
                ra.addFlashAttribute("msg", "이미 사용 중인 이메일입니다.");
                return "redirect:/signup";
            }
            
            // 회원가입 처리
            member.setEmail(member.getEmail().trim());
            memberService.registerMember(member);
            
            ra.addFlashAttribute("msg", "회원가입이 완료되었습니다. 로그인해주세요.");
            return "redirect:/login"; // 회원가입 완료 후 로그인 페이지로 이동
            
        } catch (Exception e) {
            e.printStackTrace();
            ra.addFlashAttribute("msg", "회원가입에 실패했습니다. 다시 시도해주세요.");
            return "redirect:/signup";
        }
    }
}
