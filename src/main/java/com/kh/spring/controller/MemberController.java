package com.kh.spring.controller;

import com.kh.spring.model.dao.WorkspaceDao;
import com.kh.spring.model.vo.MemberVo;
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
    private WorkspaceDao workspaceDao; // WorkspaceDao 주입

    /**
     * 멤버 초대 폼을 모달에 로드하기 위한 요청을 처리합니다.
     * @param workspaceId 초대가 이루어질 워크스페이스의 ID
     * @param model View에 데이터를 전달하기 위한 모델
     * @return 멤버 초대 폼을 담은 JSP 뷰 이름
     */
    @GetMapping("/new")
    public String inviteMemberForm(@RequestParam("workspaceId") int workspaceId, Model model) {
        log.info("GET /member/new - workspaceId: {}", workspaceId);
        model.addAttribute("workspaceId", workspaceId);
        return "invite_member"; // 뷰 리졸버가 /WEB-INF/views/invite_member.jsp를 찾음
    }

    /**
     * 멤버 초대 폼 제출을 처리하고 워크스페이스에 멤버를 추가합니다.
     * @param workspaceId 워크스페이스 ID
     * @param email 초대할 멤버의 이메일
     * @param role 멤버 역할
     * @return JSON 응답 (성공/실패 메시지)
     */
    @PostMapping("/invite")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> inviteMember(@RequestParam("workspaceId") int workspaceId,
                                                            @RequestParam("email") String email,
                                                            @RequestParam("role") String role) {
        log.info("POST /member/invite - workspaceId: {}, email: {}, role: {}", workspaceId, email, role);

        try {
            // 1. 이메일로 멤버 조회
            MemberVo member = workspaceDao.getMemberByEmail(email);
            if (member == null) {
                return ResponseEntity.badRequest().body(Map.of("success", false, "message", "해당 이메일의 멤버를 찾을 수 없습니다."));
            }

            // 2. 이미 워크스페이스에 존재하는지 확인
            if (workspaceDao.isMemberInWorkspace(workspaceId, member.getMemberId())) {
                return ResponseEntity.badRequest().body(Map.of("success", false, "message", "이미 워크스페이스에 추가된 멤버입니다."));
            }

            // 3. 워크스페이스에 멤버 추가
            int result = workspaceDao.addWorkspaceMember(workspaceId, member.getMemberId(), role);

            if (result > 0) {
                return ResponseEntity.ok(Map.of("success", true, "message", member.getMemberName() + "님을 워크스페이스에 초대했습니다."));
            } else {
                return ResponseEntity.internalServerError().body(Map.of("success", false, "message", "멤버 초대 중 알 수 없는 오류가 발생했습니다."));
            }

        } catch (Exception e) {
            log.error("멤버 초대 오류", e);
            return ResponseEntity.internalServerError().body(Map.of("success", false, "message", "서버 오류가 발생했습니다."));
        }
    }
}
