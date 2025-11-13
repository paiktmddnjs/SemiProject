package com.kh.spring.controller;

import com.kh.spring.model.dao.ProjectDao;
import com.kh.spring.model.dao.TaskDao; // TaskDao import 추가
import com.kh.spring.model.dao.WorkspaceDao;
import com.kh.spring.model.vo.ProjectVo;
import com.kh.spring.model.vo.TaskVo; // TaskVo import 추가
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
@RequestMapping("/project")
public class ProjectController {

    private static final Logger log = LoggerFactory.getLogger(ProjectController.class);

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private WorkspaceDao workspaceDao;

    @Autowired
    private TaskDao taskDao; // TaskDao 주입

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

    @GetMapping("/new")
    public String getNewProjectForm(@RequestParam("workspaceId") int workspaceId, Model model) {
        log.info("GET /project/new - 수신된 workspaceId: {}", workspaceId);
        model.addAttribute("workspaceId", workspaceId);
        return "new_project";
    }

    @PostMapping("/create")
    public String createProject(@RequestParam("workspaceId") int workspaceId,
                                @RequestParam("projectName") String projectName,
                                @RequestParam("projectMemo") String projectMemo) {
        log.info("POST /project/create - workspaceId: {}", workspaceId);

        ProjectVo project = new ProjectVo();
        project.setWorkspaceId(workspaceId);
        project.setProjectName(projectName);
        project.setProjectMemo(projectMemo);

        projectDao.insertProject(project);

        return "redirect:/project?workspaceId=" + workspaceId;
    }

    @GetMapping("/detail")
    public String getProjectDetail(@RequestParam("projectId") int projectId, Model model) {
        log.info("GET /project/detail - 수신된 projectId: {}", projectId);
        ProjectVo project = projectDao.getProjectById(projectId);
        List<TaskVo> taskList = taskDao.getTasksByProjectId(projectId); // 작업 목록 조회

        if (project != null) {
            log.info("조회된 프로젝트 이름: {}", project.getProjectName());
        } else {
            log.warn("projectId {}에 해당하는 프로젝트를 찾을 수 없습니다.", projectId);
        }

        model.addAttribute("project", project);
        model.addAttribute("taskList", taskList); // 모델에 작업 목록 추가
        return "projectdetail";
    }

    @PostMapping("/update")
    public String updateProject(@RequestParam("projectId") int projectId,
                                @RequestParam("projectName") String projectName,
                                @RequestParam("projectMemo") String projectMemo) {
        log.info("POST /project/update - projectId: {}", projectId);

        ProjectVo project = new ProjectVo();
        project.setProjectId(projectId);
        project.setProjectName(projectName);
        project.setProjectMemo(projectMemo);

        projectDao.updateProject(project);

        return "redirect:/project/detail?projectId=" + projectId;
    }

    @GetMapping("/settings")
    public String getProjectSettingsPage(@RequestParam("projectId") int projectId, Model model) {
        log.info("GET /project/settings - projectId: {}", projectId);
        ProjectVo project = projectDao.getProjectById(projectId);
        model.addAttribute("project", project);
        return "set_project";
    }
}
