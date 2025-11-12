package com.kh.spring.controller;

import com.kh.spring.model.dao.ChannelDAO;
import com.kh.spring.model.dao.WorkspaceDao;
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

@Controller
@RequestMapping("/workspace")
public class WorkspaceController {

    private static final Logger log = LoggerFactory.getLogger(WorkspaceController.class);

    @Autowired
    private WorkspaceDao workspaceDao;

    @Autowired
    private ChannelDAO channelDao;

    @GetMapping("")
    public String workspaceList(Model model) {
        List<WorkspaceVo> workspaceList = workspaceDao.getAllWorkspaces();
        List<ChannelVo> channelList = channelDao.getAllChannels();
        model.addAttribute("workspaces", workspaceList);
        model.addAttribute("channels", channelList);
        return "workspace";
    }

    @GetMapping("/new")
    public String newWorkspaceForm(Model model) {
        List<ChannelVo> channelList = channelDao.getAllChannels();
        model.addAttribute("channels", channelList);
        return "new_workspace";
    }

    @PostMapping("/create")
    public String createWorkspace(@RequestParam("channelId") int channelId,
                                  @RequestParam("workspaceName") String workspaceName,
                                  @RequestParam("workspaceExplain") String workspaceExplain) {
        log.info("POST /workspace/create - channelId: {}", channelId);
        WorkspaceVo workspace = new WorkspaceVo();
        workspace.setChannelId(channelId);
        workspace.setWorkspaceName(workspaceName);
        workspace.setWorkspaceExplain(workspaceExplain);
        workspaceDao.insertWorkspace(workspace);
        return "redirect:/workspace";
    }

    @GetMapping("/set")
    public String getWorkspaceSettingsPage(@RequestParam("workspaceId") int workspaceId,
                                           @RequestParam(value = "projectId", required = false) String projectId,
                                           Model model) {
        log.info("GET /workspace/set - workspaceId: {}", workspaceId);
        WorkspaceVo workspace = workspaceDao.getWorkspaceById(workspaceId);
        model.addAttribute("workspace", workspace);
        model.addAttribute("returnTo", projectId);
        return "set_workspace";
    }

    @PostMapping("/update")
    public String updateWorkspace(@RequestParam("workspaceId") int workspaceId,
                                  @RequestParam("workspaceName") String workspaceName,
                                  @RequestParam("workspaceExplain") String workspaceExplain,
                                  @RequestParam(value = "returnTo", required = false) String returnTo) {
        log.info("POST /workspace/update - workspaceId: {}", workspaceId);

        WorkspaceVo workspace = new WorkspaceVo();
        workspace.setWorkspaceId(workspaceId);
        workspace.setWorkspaceName(workspaceName);
        workspace.setWorkspaceExplain(workspaceExplain);

        workspaceDao.updateWorkspace(workspace);

        if (returnTo != null && !returnTo.isEmpty()) {
            // 수정된 리다이렉트 경로
            return "redirect:/project/detail?projectId=" + returnTo;
        }

        return "redirect:/project?workspaceId=" + workspaceId;
    }
}
