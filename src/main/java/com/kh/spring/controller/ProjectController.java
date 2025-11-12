package com.kh.spring.controller;

import com.kh.spring.model.dao.ProjectDao;
import com.kh.spring.model.dao.WorkspaceDao;
import com.kh.spring.model.vo.ProjectVo;
import com.kh.spring.model.vo.WorkspaceMemberVo;
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
@RequestMapping("/project") // 클래스 레벨 매핑 추가
public class ProjectController {

    private static final Logger log = LoggerFactory.getLogger(ProjectController.class);

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private WorkspaceDao workspaceDao;

    // GET /project
    @GetMapping("")
    public String getProjectList(@RequestParam("workspaceId") int workspaceId, Model model) {
        log.info("GET /project - 수신된 workspaceId: {}", workspaceId);

        WorkspaceVo workspace = workspaceDao.getWorkspaceById(workspaceId);
        List<ProjectVo> projectList = projectDao.getProjectsByWorkspaceId(workspaceId);
        List<WorkspaceMemberVo> memberList = workspaceDao.getWorkspaceMembersByWorkspaceId(workspaceId);

        model.addAttribute("workspace", workspace);
        model.addAttribute("projects", projectList);
        model.addAttribute("workspaceMembers", memberList);

        return "project";
    }

    // GET /project/new
    @GetMapping("/new")
    public String getNewProjectForm(@RequestParam("workspaceId") int workspaceId, Model model) {
        log.info("GET /project/new - 수신된 workspaceId: {}", workspaceId);
        model.addAttribute("workspaceId", workspaceId);
        return "new_project";
    }

    // POST /project/create
    @PostMapping("/create")
    public String createProject(@RequestParam("workspaceId") int workspaceId,
                                @RequestParam("projectName") String projectName,
                                @RequestParam("projectExplain") String projectExplain) {
        log.info("POST /project/create - workspaceId: {}", workspaceId);

        ProjectVo project = new ProjectVo();
        project.setWorkspaceId(workspaceId);
        project.setProjectName(projectName);
        project.setProjectExplain(projectExplain);

        projectDao.insertProject(project);

        // 수정된 리다이렉트 경로
        return "redirect:/project?workspaceId=" + workspaceId;
    }

    // GET /project/detail
    @GetMapping("/detail")
    public String getProjectDetail(@RequestParam("projectId") int projectId, Model model) {
        log.info("GET /project/detail - 수신된 projectId: {}", projectId);
        ProjectVo project = projectDao.getProjectById(projectId);
        model.addAttribute("project", project);
        return "projectdetail";
    }

    // POST /project/update
    @PostMapping("/update")
    public String updateProject(@RequestParam("projectId") int projectId,
                                @RequestParam("projectName") String projectName,
                                @RequestParam("projectExplain") String projectExplain) {
        log.info("POST /project/update - projectId: {}", projectId);

        ProjectVo project = new ProjectVo();
        project.setProjectId(projectId);
        project.setProjectName(projectName);
        project.setProjectExplain(projectExplain);

        projectDao.updateProject(project);

        // 수정된 리다이렉트 경로
        return "redirect:/project/detail?projectId=" + projectId;
    }

    // GET /project/settings
    @GetMapping("/settings")
    public String getProjectSettingsPage(@RequestParam("projectId") int projectId, Model model) {
        log.info("GET /project/settings - projectId: {}", projectId);
        ProjectVo project = projectDao.getProjectById(projectId);
        model.addAttribute("project", project);
        return "set_project";
    }
}
