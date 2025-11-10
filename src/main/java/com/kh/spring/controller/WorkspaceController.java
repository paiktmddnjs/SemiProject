package com.kh.spring.controller;

import com.kh.spring.model.dao.ChannelDAO;
import com.kh.spring.model.dao.WorkspaceDao;
import com.kh.spring.model.vo.ChannelVo;
import com.kh.spring.model.vo.WorkspaceVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class WorkspaceController {

    @Autowired
    private ChannelDAO channelDAO;

    @Autowired
    private WorkspaceDao workspaceDao;

    @GetMapping("/workspace/new")
    public String getNewWorkspaceForm(Model model) {
        List<ChannelVo> channelList = channelDAO.getAllChannels();
        model.addAttribute("channels", channelList);
        return "new_workspace";
    }

    @PostMapping("/workspace/create") // POST 요청을 처리할 메소드
    public String createWorkspace(@RequestParam("channelId") int channelId,
                                  @RequestParam("workspaceName") String workspaceName,
                                  @RequestParam("workspaceExplain") String workspaceExplain) {
        
        WorkspaceVo workspace = new WorkspaceVo();
        workspace.setChannelId(channelId);
        workspace.setWorkspaceName(workspaceName);
        workspace.setWorkspaceExplain(workspaceExplain);

        int result = workspaceDao.insertWorkspace(workspace);

        if (result > 0) {
            return "redirect:/"; // 성공 시 루트 URL로 리디렉션
        } else {
            return "redirect:/error"; // 실패 시 에러 페이지로 리디렉션 (에러 페이지 URL은 실제에 맞게 수정)
        }
    }

    @GetMapping({"/", "/workspace"})
    public String getWorkspaceList(Model model) {
        List<WorkspaceVo> workspaceList = workspaceDao.getAllWorkspaces();
        model.addAttribute("workspaces", workspaceList);
        return "workspace";
    }

    // ... (이하 생략)
    @GetMapping("/layout")
    public String getLayoutForm() {
        return "layout";
    }

    @GetMapping("/project/new")
    public String getNewProjectForm() {
        return "new_project";
    }

    @GetMapping("/member/new")
    public String getNewMemberForm() {
        return "new_member";
    }

    @GetMapping("/project")
    public String getProjectForm() {
        return "project";
    }

    @GetMapping("/projectdetail")
    public String getProjectdetailForm() {
        return "projectdetail";
    }

    @GetMapping("/workspace/set")
    public String getSetWorkspaceForm() {
        return "set_workspace";
    }
}
