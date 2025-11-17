package com.kh.spring.controller;

import com.kh.spring.model.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/member")
public class MemberController {

    private static final Logger log = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    private MemberService memberService;

    @GetMapping("/new")
    public String inviteMemberForm(@RequestParam("workspaceId") int workspaceId, Model model) {
        log.info("GET /member/new - workspaceId: {}", workspaceId);
        model.addAttribute("workspaceId", workspaceId);
        return "invite_member";
    }

    @PostMapping("/invite")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> inviteMember(@RequestParam("workspaceId") int workspaceId,
                                                            @RequestParam("email") String email,
                                                            @RequestParam("role") String role) {
        log.info("POST /member/invite - workspaceId: {}, email: {}, role: {}", workspaceId, email, role);
        try {
            String successMessage = memberService.inviteMemberToWorkspace(workspaceId, email, role);
            return ResponseEntity.ok(Map.of("success", true, "message", successMessage));
        } catch (Exception e) {
            log.error("멤버 초대 오류: {}", e.getMessage());
            return ResponseEntity.badRequest().body(Map.of("success", false, "message", e.getMessage()));
        }
    }
}
