package com.kh.spring.controller;

import com.kh.spring.model.dao.ProjectDao;
import com.kh.spring.model.vo.ProjectVo;
// Logger 관련 import 추가
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ProjectController {

    // Logger 객체 생성 코드 추가
    private static final Logger log = LoggerFactory.getLogger(ProjectController.class);

    @Autowired
    private ProjectDao projectDao;

    @GetMapping("/project")
    public String getProjectList(@RequestParam("workspaceId") int workspaceId, Model model) {
        log.info("GET /project - 수신된 workspaceId: {}", workspaceId);

        List<ProjectVo> projectList = projectDao.getProjectsByWorkspaceId(workspaceId);
        model.addAttribute("projects", projectList);
        model.addAttribute("workspaceId", workspaceId);
        return "project";
    }

    @GetMapping("/project/new")
    public String getNewProjectForm(@RequestParam("workspaceId") int workspaceId, Model model) {
        log.info("GET /project/new - 수신된 workspaceId: {}", workspaceId);

        model.addAttribute("workspaceId", workspaceId);
        return "new_project";
    }

    @PostMapping("/project/create")
    public String createProject(@RequestParam("workspaceId") int workspaceId,
                                @RequestParam("projectName") String projectName,
                                @RequestParam("projectExplain") String projectExplain) {
        log.info("POST /project/create - 수신된 workspaceId: {}", workspaceId);
        log.info("Project Name: {}, Project Explain: {}", projectName, projectExplain);

        ProjectVo project = new ProjectVo();
        project.setWorkspaceId(workspaceId);
        project.setProjectName(projectName);
        project.setProjectExplain(projectExplain);

        projectDao.insertProject(project);

        return "redirect:/project?workspaceId=" + workspaceId;
    }
}
