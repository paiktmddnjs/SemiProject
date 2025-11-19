package com.kh.spring.Controller;

import com.kh.spring.model.service.ProjectService;
import com.kh.spring.model.vo.Member;
import com.kh.spring.model.vo.ProjectVo;
import com.kh.spring.model.vo.WorkspaceMemberVo;
import jakarta.servlet.http.HttpSession;
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
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/project")
public class ProjectController {

    private static final Logger log = LoggerFactory.getLogger(ProjectController.class);

    @Autowired
    private ProjectService projectService; // 오직 Service만 의존

    @GetMapping
    public String getProjectList(@RequestParam("workspaceId") int workspaceId,
                                 @RequestParam(value = "successMessage", required = false) String successMessage,
                                 @RequestParam(value = "errorMessage", required = false) String errorMessage,
                                 Model model, HttpSession session) {
        log.info("GET /project - 수신된 workspaceId: {}", workspaceId);

        Member loginUser = (Member) session.getAttribute("loginMember");
        if (loginUser == null) {
            return "redirect:/loginForm.me";
        }

        Map<String, Object> pageData = projectService.getProjectPageData(workspaceId);
        model.addAllAttributes(pageData);

        // 현재 사용자의 역할 찾기
        List<WorkspaceMemberVo> members = (List<WorkspaceMemberVo>) pageData.get("workspaceMembers");
        Optional<WorkspaceMemberVo> currentUserMemberInfo = members.stream()
                .filter(m -> m.getMemberId() == loginUser.getMemberId())
                .findFirst();
        String currentUserRole = currentUserMemberInfo.map(WorkspaceMemberVo::getWorkspaceMemberRole).orElse("NONE");
        model.addAttribute("currentUserRole", currentUserRole);


        // URL 파라미터로 받은 메시지를 모델에 추가
        if (successMessage != null) {
            model.addAttribute("successMessage", successMessage);
        }
        if (errorMessage != null) {
            model.addAttribute("errorMessage", errorMessage);
        }
        model.addAttribute("contentPage", "project"); // layout.jsp에서 이 값으로 include
        model.addAttribute("pageTitle", "프로젝트");

        return "/components/layout";
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
                                @RequestParam(value = "projectDeadline", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date projectDeadline,
                                @RequestParam(value = "projectType", required = false) String projectType) {
        ProjectVo project = new ProjectVo();
        project.setWorkspaceId(workspaceId);
        project.setProjectName(projectName);
        project.setProjectMemo(projectMemo);
        project.setProjectDeadline(projectDeadline);
        project.setProjectType(projectType); // projectType 설정
        projectService.createProject(project);
        return "redirect:/project?workspaceId=" + workspaceId;
    }

    @GetMapping("/detail")
    public String getProjectDetail(@RequestParam("projectId") int projectId, Model model, HttpSession session) {
        log.info("GET /project/detail - 수신된 projectId: {}", projectId);

        Member loginUser = (Member) session.getAttribute("loginMember");
        if (loginUser == null) {
            log.warn("로그인되지 않은 사용자가 프로젝트 상세 페이지에 접근 시도. projectId: {}", projectId);
            return "redirect:/loginForm.me";
        }

        Map<String, Object> projectData = projectService.getProjectDetailData(projectId);
        if (projectData == null) {
            log.warn("projectId {}에 해당하는 프로젝트를 찾을 수 없습니다.", projectId);
            return "redirect:/workspace"; // 워크스페이스 목록으로 리다이렉트
        }
        model.addAllAttributes(projectData);

        // 현재 사용자의 역할 찾기
        List<WorkspaceMemberVo> members = (List<WorkspaceMemberVo>) projectData.get("workspaceMembers");
        Optional<WorkspaceMemberVo> currentUserMemberInfo = members.stream()
                .filter(m -> m.getMemberId() == loginUser.getMemberId())
                .findFirst();
        String currentUserRole = currentUserMemberInfo.map(WorkspaceMemberVo::getWorkspaceMemberRole).orElse("NONE");
        model.addAttribute("currentUserRole", currentUserRole);

        // 로그 추가: projectId와 currentUserRole 값 확인
        log.debug("프로젝트 상세 페이지 로드: projectId = {}, currentUserRole = {}", projectId, currentUserRole);
        model.addAttribute("contentPage", "projectdetail"); // layout.jsp에서 이 값으로 include
        model.addAttribute("pageTitle", "프로젝트디테일");

        return "/components/layout";
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

    @PostMapping("/delete")
    public String softDeleteProject(@RequestParam("projectId") int projectId,
                                    @RequestParam("workspaceId") int workspaceId) {
        projectService.softDeleteProject(projectId);
        return "redirect:/project?workspaceId=" + workspaceId;
    }
}
