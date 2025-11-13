package com.kh.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/member")
public class MemberController {

    private static final Logger log = LoggerFactory.getLogger(MemberController.class);

    /**
     * 멤버 초대 폼을 모달에 로드하기 위한 요청을 처리합니다.
     * @param workspaceId 초대가 이루어질 워크스페이스의 ID
     * @param model View에 데이터를 전달하기 위한 모델
     * @return 멤버 초대 폼을 담은 JSP 뷰 이름
     */
    @GetMapping("/invite")
    public String inviteMemberForm(@RequestParam("workspaceId") int workspaceId, Model model) {
        log.info("GET /member/new - workspaceId: {}", workspaceId);
        model.addAttribute("workspaceId", workspaceId);
        return "invite_member"; // 뷰 리졸버가 /WEB-INF/views/invite_member.jsp를 찾음
    }

    // TODO: 실제 멤버를 초대하는 POST 방식의 메소드 추가 필요
    // @PostMapping("/invite")
    // public String inviteMember(...) { ... }
}
