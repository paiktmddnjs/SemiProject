package com.kh.spring.controller;

import com.kh.spring.model.vo.Member;
import com.kh.spring.service.MemberService;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequiredArgsConstructor
@Controller
public class MemberController {

    private final MemberService memberService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    /* =========================
       회원가입 / 로그인 / 로그아웃
       ========================= */

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
    public  String loginForm() {
        return "Login";
    }

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

        } else if (!bCryptPasswordEncoder.matches(memberPwd, loginMember.getMemberPwd())) {
            mv.addObject("errorMsg", "비밀번호를 확인해 주세요.");
            mv.setViewName("Login");

        } else {
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

    /* =========================
       마이페이지 관련 기능들
       (뷰는 MyPageController에서 담당)
       ========================= */

    // 1. 프로필 수정 (이름 / 전화번호)
    @PostMapping("updateProfile.me")
    public String updateProfile(Member formMember,
                                HttpSession session,
                                RedirectAttributes ra) {

        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            ra.addFlashAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
            return "redirect:/loginForm.me";
        }

        // 보안상 세션 기준으로 memberId 강제
        formMember.setMemberId(loginMember.getMemberId());  // int 타입

        int result = memberService.updateProfile(formMember);

        if (result > 0) {
            // 이메일은 그대로이므로 이메일 기준 재조회
            Member updated = memberService.getMemberByEmail(loginMember.getEmail());
            session.setAttribute("loginMember", updated);
            ra.addFlashAttribute("alertMsg", "프로필 정보가 수정되었습니다.");
        } else {
            ra.addFlashAttribute("alertMsg", "프로필 정보 수정에 실패했습니다.");
        }

        // 화면은 항상 /myPage.me (MyPageController로 이동)
        return "redirect:/myPage.me";
    }

    // 2. 이메일 변경
    @PostMapping("updateEmail.me")
    public String updateEmail(String newEmail,
                              String memberPwd,
                              HttpSession session,
                              RedirectAttributes ra) {

        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            ra.addFlashAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
            return "redirect:/loginForm.me";
        }

        // 비밀번호 확인
        if (!bCryptPasswordEncoder.matches(memberPwd, loginMember.getMemberPwd())) {
            ra.addFlashAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
            return "redirect:/myPage.me";
        }

        int memberId = loginMember.getMemberId(); // int

        int result = memberService.updateEmail(memberId, newEmail);

        if (result > 0) {
            // 변경된 이메일 기준으로 다시 조회
            Member updated = memberService.getMemberByEmail(newEmail);
            session.setAttribute("loginMember", updated);
            ra.addFlashAttribute("alertMsg", "이메일이 변경되었습니다.");
        } else {
            ra.addFlashAttribute("alertMsg", "이메일 변경에 실패했습니다.");
        }

        return "redirect:/myPage.me";
    }

    // 3. 비밀번호 변경
    @PostMapping("updatePwd.me")
    public String updatePwd(String currentPwd,
                            String newPwd,
                            String newPwdConfirm,
                            HttpSession session,
                            RedirectAttributes ra) {

        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            ra.addFlashAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
            return "redirect:/loginForm.me";
        }

        // 새 비밀번호 일치 체크
        if (!newPwd.equals(newPwdConfirm)) {
            ra.addFlashAttribute("alertMsg", "새 비밀번호가 서로 일치하지 않습니다.");
            return "redirect:/myPage.me";
        }

        // 현재 비밀번호 확인
        if (!bCryptPasswordEncoder.matches(currentPwd, loginMember.getMemberPwd())) {
            ra.addFlashAttribute("alertMsg", "현재 비밀번호가 일치하지 않습니다.");
            return "redirect:/myPage.me";
        }

        String encPwd = bCryptPasswordEncoder.encode(newPwd);
        int memberId = loginMember.getMemberId();

        int result = memberService.updatePwd(memberId, encPwd);

        if (result > 0) {
            // 세션 객체 비밀번호도 갱신
            loginMember.setMemberPwd(encPwd);
            session.setAttribute("loginMember", loginMember);
            ra.addFlashAttribute("alertMsg", "비밀번호가 변경되었습니다.");
        } else {
            ra.addFlashAttribute("alertMsg", "비밀번호 변경에 실패했습니다.");
        }

        return "redirect:/myPage.me";
    }

    // 4. 회원 탈퇴
    @PostMapping("deleteMember.me")
    public String deleteMember(String memberPwd,
                               HttpSession session,
                               RedirectAttributes ra) {

        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            ra.addFlashAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
            return "redirect:/loginForm.me";
        }

        // 비밀번호 확인
        if (!bCryptPasswordEncoder.matches(memberPwd, loginMember.getMemberPwd())) {
            ra.addFlashAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
            return "redirect:/myPage.me";
        }

        int memberId = loginMember.getMemberId();

        int result = memberService.deleteMember(memberId); // STATUS = 'N' 같은 soft delete 기준

        if (result > 0) {
            session.invalidate();
            ra.addFlashAttribute("alertMsg", "계정이 삭제되었습니다. 그동안 이용해주셔서 감사합니다.");
            return "redirect:/";
        } else {
            ra.addFlashAttribute("alertMsg", "회원 탈퇴에 실패했습니다.");
            return "redirect:/myPage.me";
        }
    }
}
