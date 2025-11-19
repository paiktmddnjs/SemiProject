package com.kh.spring.controller;

import com.kh.spring.model.service.ProjectService;
import com.kh.spring.model.service.WorkspaceService;
import com.kh.spring.model.vo.ChannelVo;
import com.kh.spring.model.vo.Member;
import com.kh.spring.model.vo.WorkspaceMemberVo;
import com.kh.spring.model.vo.WorkspaceVo;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/workspace")
public class WorkspaceController {

    private static final Logger log = LoggerFactory.getLogger(WorkspaceController.class);

    @Autowired
    private WorkspaceService workspaceService;

    @Autowired
    private ProjectService projectService; // 멤버 목록 조회를 위해 추가 (기존 코드 유지)

    @GetMapping
    public String workspaceList(Model model, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginMember");
        if (loginUser == null) {
            return "redirect:/loginForm.me";
        }

        Map<String, Object> workspaceData = workspaceService.getWorkspacePageData(loginUser.getMemberId());
        model.addAllAttributes(workspaceData);
        // 레이아웃용 공통 설정
        model.addAttribute("contentPage", "workspace"); // layout.jsp에서 이 값으로 include
        model.addAttribute("pageTitle", "워크스페이스");

        return "/components/layout";
    }

    @GetMapping("/new")
    public String newWorkspaceForm(Model model) {
        List<ChannelVo> channelList = workspaceService.getAllChannels();
        model.addAttribute("channels", channelList);
        return "new_workspace";
    }

    @PostMapping("/create")
    public String createWorkspace(@RequestParam("channelId") int channelId,
                                  @RequestParam("workspaceName") String workspaceName,
                                  @RequestParam("workspaceExplain") String workspaceExplain,
                                  HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginMember");
        if (loginUser == null) {
            return "redirect:/loginForm.me";
        }
        WorkspaceVo workspace = new WorkspaceVo();
        workspace.setChannelId(channelId);
        workspace.setWorkspaceName(workspaceName);
        workspace.setWorkspaceExplain(workspaceExplain);
        workspaceService.createWorkspaceAndAddMember(workspace, loginUser.getMemberId());
        return "redirect:/workspace";
    }

    @GetMapping("/set")
    public String getWorkspaceSettingsPage(@RequestParam("workspaceId") int workspaceId, Model model) {
        WorkspaceVo workspace = workspaceService.getWorkspaceById(workspaceId);
        model.addAttribute("workspace", workspace);
        return "set_workspace";
    }

    @PostMapping("/update")
    public String updateWorkspace(@RequestParam("workspaceId") int workspaceId,
                                  @RequestParam("workspaceName") String workspaceName,
                                  @RequestParam("workspaceExplain") String workspaceExplain) {
        WorkspaceVo workspace = new WorkspaceVo();
        workspace.setWorkspaceId(workspaceId);
        workspace.setWorkspaceName(workspaceName);
        workspace.setWorkspaceExplain(workspaceExplain);
        workspaceService.updateWorkspace(workspace);
        return "redirect:/project?workspaceId=" + workspaceId;
    }

    @PostMapping("/delete")
    public String softDeleteWorkspace(@RequestParam("workspaceId") int workspaceId) {
        workspaceService.updateWorkspaceStatus(workspaceId);
        return "redirect:/workspace";
    }

    @PostMapping("/member/remove")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> removeMemberAjax(@RequestParam("workspaceId") int workspaceId,
                                                                @RequestParam("memberId") int memberId,
                                                                HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginMember");
        if (loginUser == null) {
            return ResponseEntity.status(401).body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }

        try {
            workspaceService.removeMember(workspaceId, memberId, loginUser.getMemberId());
            return ResponseEntity.ok(Map.of("success", true, "message", "멤버를 추방했습니다."));
        } catch (IllegalStateException e) {
            return ResponseEntity.badRequest().body(Map.of("success", false, "message", e.getMessage()));
        } catch (Exception e) {
            log.error("멤버 추방 중 오류 발생", e);
            return ResponseEntity.internalServerError().body(Map.of("success", false, "message", "서버 오류가 발생했습니다."));
        }
    }

    @PostMapping("/member/updateRole")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateMemberRoleAjax(@RequestParam("workspaceId") int workspaceId,
                                                                    @RequestParam("memberId") int memberId,
                                                                    @RequestParam("role") String role,
                                                                    HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginMember");
        if (loginUser == null) {
            return ResponseEntity.status(401).body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }

        try {
            workspaceService.updateMemberRole(workspaceId, memberId, role, loginUser.getMemberId());
            return ResponseEntity.ok(Map.of("success", true, "message", "역할을 변경했습니다."));
        } catch (IllegalStateException e) {
            return ResponseEntity.badRequest().body(Map.of("success", false, "message", e.getMessage()));
        } catch (Exception e) {
            log.error("역할 변경 중 오류 발생", e);
            return ResponseEntity.internalServerError().body(Map.of("success", false, "message", "서버 오류가 발생했습니다."));
        }
    }

    @GetMapping("/members")
    public String getTeamMemberList(@RequestParam("workspaceId") int workspaceId,
                                    @RequestParam(value = "searchQuery", required = false) String searchQuery,
                                    Model model, HttpSession session) {

        List<WorkspaceMemberVo> workspaceMembers = workspaceService.getWorkspaceMembers(workspaceId, searchQuery);
        model.addAttribute("workspaceMembers", workspaceMembers);

        Member loginUser = (Member) session.getAttribute("loginMember");
        if (loginUser != null) {
            Optional<WorkspaceMemberVo> currentUserMemberInfo = workspaceMembers.stream()
                    .filter(m -> m.getMemberId() == loginUser.getMemberId())
                    .findFirst();
            String currentUserRole = currentUserMemberInfo.map(WorkspaceMemberVo::getWorkspaceMemberRole).orElse("NONE");
            model.addAttribute("currentUserRole", currentUserRole);
        }

        return "components/_teamMemberList";
    }
}
