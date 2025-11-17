package com.kh.spring.controller;

import com.kh.spring.model.service.ProjectService;
import com.kh.spring.model.vo.ProjectVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/project")
public class ProjectController {

    private static final Logger log = LoggerFactory.getLogger(ProjectController.class);

    @Autowired
    private ProjectService projectService; // 오직 Service만 의존

    @GetMapping("")
    public String getProjectList(@RequestParam("workspaceId") int workspaceId, Model model) {
        log.info("GET /project - 수신된 workspaceId: {}", workspaceId);
        Map<String, Object> pageData = projectService.getProjectPageData(workspaceId);
        model.addAllAttributes(pageData);
        return "project";
    }

    @GetMapping("/new")
    public String getNewProjectForm(@RequestParam("workspaceId") int workspaceId, Model model) {
        model.addAttribute("workspaceId", workspaceId);
        return "new_project";
    }

    @PostMapping("/create")
    public String createProject(@RequestParam("workspaceId") int workspaceId,
                                @RequestParam("projectName") String projectName,
                                @RequestParam("projectMemo") String projectMemo,
                                @RequestParam(value = "projectDeadline", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date projectDeadline) {
        ProjectVo project = new ProjectVo();
        project.setWorkspaceId(workspaceId);
        project.setProjectName(projectName);
        project.setProjectMemo(projectMemo);
        project.setProjectDeadline(projectDeadline);
        projectService.createProject(project);
        return "redirect:/project?workspaceId=" + workspaceId;
    }

    @GetMapping("/detail")
    public String getProjectDetail(@RequestParam("projectId") int projectId, Model model) {
        log.info("GET /project/detail - 수신된 projectId: {}", projectId);
        Map<String, Object> projectData = projectService.getProjectDetailData(projectId);
        if (projectData == null) {
            log.warn("projectId {}에 해당하는 프로젝트를 찾을 수 없습니다.", projectId);
            return "redirect:/workspace"; // 워크스페이스 목록으로 리다이렉트
        }
        model.addAllAttributes(projectData);
        return "projectdetail";
    }

    @PostMapping("/update")
    public String updateProject(@RequestParam("projectId") int projectId,
                                @RequestParam("projectName") String projectName,
                                @RequestParam("projectMemo") String projectMemo,
                                @RequestParam(value = "projectDeadline", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date projectDeadline,
                                @RequestParam("projectType") String projectType,
                                @RequestParam("projectStatus") String projectStatus) {
        ProjectVo project = new ProjectVo();
        project.setProjectId(projectId);
        project.setProjectName(projectName);
        project.setProjectMemo(projectMemo);
        project.setProjectDeadline(projectDeadline);
        project.setProjectType(projectType);
        project.setProjectStatus(projectStatus);
        projectService.updateProject(project);
        return "redirect:/project/detail?projectId=" + projectId;
    }

    @GetMapping("/settings")
    public String getProjectSettingsPage(@RequestParam("projectId") int projectId, Model model) {
        log.info("GET /project/settings - projectId: {}", projectId);
        ProjectVo project = projectService.getProjectById(projectId);
        model.addAttribute("project", project);
        return "set_project";
    }
}
