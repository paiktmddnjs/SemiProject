package com.kh.spring.controller;

import com.kh.spring.model.service.WorkspaceService;
import com.kh.spring.model.vo.ChannelVo;
import com.kh.spring.model.vo.WorkspaceVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/workspace")
public class WorkspaceController {

    private static final Logger log = LoggerFactory.getLogger(WorkspaceController.class);

    @Autowired
    private WorkspaceService workspaceService;

    @GetMapping("")
    public String workspaceList(Model model) {
        Map<String, Object> workspaceData = workspaceService.getWorkspacePageData();
        model.addAllAttributes(workspaceData);
        return "workspace";
    }

    // '새 워크스페이스' 폼 요청 메소드 복구
    @GetMapping("/new")
    public String newWorkspaceForm(Model model) {
        List<ChannelVo> channelList = workspaceService.getAllChannels();
        model.addAttribute("channels", channelList);
        return "new_workspace";
    }

    // '새 워크스페이스' 생성 메소드 복구
    @PostMapping("/create")
    public String createWorkspace(@RequestParam("channelId") int channelId,
                                  @RequestParam("workspaceName") String workspaceName,
                                  @RequestParam("workspaceExplain") String workspaceExplain) {
        WorkspaceVo workspace = new WorkspaceVo();
        workspace.setChannelId(channelId);
        workspace.setWorkspaceName(workspaceName);
        workspace.setWorkspaceExplain(workspaceExplain);
        workspaceService.createWorkspace(workspace);
        return "redirect:/workspace";
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
}
