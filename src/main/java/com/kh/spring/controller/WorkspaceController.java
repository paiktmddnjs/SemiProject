package com.kh.spring.controller;

import com.kh.spring.dto.MemberDto;
import com.kh.spring.model.service.WorkspaceService;
import com.kh.spring.model.vo.ChannelVo;
import com.kh.spring.model.vo.WorkspaceVo;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/workspace")
public class WorkspaceController {

    private static final Logger log = LoggerFactory.getLogger(WorkspaceController.class);

    @Autowired
    private WorkspaceService workspaceService;

    @GetMapping("")
    public String workspaceList(Model model, HttpSession session) {
        MemberDto loginUser = (MemberDto) session.getAttribute("loginMember");
        if (loginUser == null) {
            return "redirect:/login";
        }

        Map<String, Object> workspaceData = workspaceService.getWorkspacePageData(loginUser.getMemberId().intValue());
        model.addAllAttributes(workspaceData);
        return "workspace";
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
                                  HttpSession session,
                                  RedirectAttributes redirectAttributes) {
        // 세션 키를 'loginMember'로, 타입을 MemberDto로 수정
        MemberDto loginUser = (MemberDto) session.getAttribute("loginMember");
        if (loginUser == null) {
            log.warn("로그인되지 않은 사용자의 워크스페이스 생성 시도.");
            return "redirect:/login";
        }

        try {
            WorkspaceVo workspace = new WorkspaceVo();
            workspace.setChannelId(channelId);
            workspace.setWorkspaceName(workspaceName);
            workspace.setWorkspaceExplain(workspaceExplain);

            log.info("워크스페이스 생성 요청. 사용자: {}", loginUser.getEmail());
            // MemberDto의 memberId를 intValue()를 사용하여 int로 변환
            workspaceService.createWorkspaceAndAddMember(workspace, loginUser.getMemberId().intValue());
            log.info("워크스페이스 생성 성공. 리다이렉트: /workspace");

            return "redirect:/workspace";

        } catch (Exception e) {
            log.error("워크스페이스 생성 중 심각한 오류 발생", e);
            redirectAttributes.addFlashAttribute("errorMessage", "워크스페이스 생성에 실패했습니다. 문제가 지속되면 관리자에게 문의하세요.");
            return "redirect:/"; // 오류 발생 시 루트로 리다이렉트
        }
    }

    @GetMapping("/set")
    public String getWorkspaceSettingsPage(@RequestParam("workspaceId") int workspaceId,
                                           @RequestParam(value = "projectId", required = false) String projectId,
                                           Model model) {
        WorkspaceVo workspace = workspaceService.getWorkspaceById(workspaceId);
        model.addAttribute("workspace", workspace);
        model.addAttribute("returnTo", projectId);
        return "set_workspace";
    }

    @PostMapping("/update")
    public String updateWorkspace(@RequestParam("workspaceId") int workspaceId,
                                  @RequestParam("workspaceName") String workspaceName,
                                  @RequestParam("workspaceExplain") String workspaceExplain,
                                  @RequestParam(value = "returnTo", required = false) String returnTo) {
        WorkspaceVo workspace = new WorkspaceVo();
        workspace.setWorkspaceId(workspaceId);
        workspace.setWorkspaceName(workspaceName);
        workspace.setWorkspaceExplain(workspaceExplain);
        workspaceService.updateWorkspace(workspace);

        if (returnTo != null && !returnTo.isEmpty()) {
            return "redirect:/project/detail?projectId=" + returnTo;
        }

        return "redirect:/project?workspaceId=" + workspaceId;
    }

    @PostMapping("/delete")
    public String softDeleteWorkspace(@RequestParam("workspaceId") int workspaceId) {
        workspaceService.updateWorkspaceStatus(workspaceId);
        return "redirect:/workspace";
    }
}
