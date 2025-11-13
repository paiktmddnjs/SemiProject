package com.kh.spring.controlloer.board;

import org.springframework.ui.Model;
import com.kh.spring.model.vo.*;
import com.kh.spring.service.ScheduleServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jdk.jshell.Snippet;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;


@Controller
public class ScheduleController {

    private final ScheduleServiceImpl scheduleServiceImpl;

    public ScheduleController(ScheduleServiceImpl scheduleServiceImpl) {
        this.scheduleServiceImpl = scheduleServiceImpl;
    }

    // GET 요청 처리
    @GetMapping("/schedule.bo")
    public String showSchedule(Model model) {
        int memberId = 1;
        LocalDate today = LocalDate.now(); // 오늘 날짜
        String todayStr = java.time.LocalDate.now().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        List<Workspace> workspace = scheduleServiceImpl.scheduleWorkspaceSelect(memberId);
        List<Project> project = scheduleServiceImpl.scheduleProjectWholeSelect();
        int statusTodo = scheduleServiceImpl.statusTodoWholeSelect();
        int statusProgress = scheduleServiceImpl.statusProgressWholeSelect();
        int statusComplete = scheduleServiceImpl.statusCompleteWholeSelect();
        List<Task> calendar = scheduleServiceImpl.calendarWholeSelect();
        List<Task> dailyTask = scheduleServiceImpl.dailyTaskSelect(todayStr);
        List<StatusContainer> workspaceStatus = scheduleServiceImpl.workspaceStatusWholeSelect();
        List<StatusContainer> projectStatus = scheduleServiceImpl.projectStatusWholeSelect();

        for (Workspace w : workspace){
            String w_name = w.getWorkspaceName();
            int w_id = w.getWorkspaceId();
            System.out.println("워크스페이스 정보 : " + w_name + ", " + w_id);
        }

        for (Project p : project){
            String p_name = p.getProjectName();
            int p_id = p.getProjectId();
            System.out.println("프로젝트 정보 : " + p_name + ", " + p_id);
        }

        System.out.println("할일 갯수 : " + statusTodo);
        System.out.println("진행중 갯수 : " + statusProgress);
        System.out.println("완료된 일 갯수 : " + statusComplete);

        for (Task c : calendar){
            String c_name = c.getTaskName();
            int c_id = c.getTaskId();
            String c_start = c.getTaskStart();
            String c_deadline = c.getTaskDeadline();
            System.out.println("달력 정보 : " + c_name + ", " + c_id + ", " + c_start + ", " + c_deadline);
        }

        for (Task d : dailyTask){
            String d_workspace = d.getWorkspaceName();
            String d_project = d.getProjectName();
            String d_status = d.getTaskStatus();
            String d_name = d.getTaskName();
            String d_assign = d.getTaskAssign();
            System.out.println("할일 목록 : " + d_workspace + ", " + d_project + ", " + d_status + ", " + d_name + ", " + d_assign);
        }

        for (StatusContainer ws : workspaceStatus){
            String ws_status = ws.getStatus();
            int ws_count = ws.getStatusCount();
            System.out.println("워크스페이스 정보 : " + ws_status + ", " + ws_count);
        }

        for (StatusContainer ps : projectStatus){
            String ps_status = ps.getStatus();
            int ps_count = ps.getStatusCount();
            System.out.println("프로젝트 정보 : " + ps_status + ", " + ps_count);
        }

        model.addAttribute("workspaces", workspace);

        return "board/schedule";
    }

    // POST 요청 처리
    @PostMapping("/schedule.bo")
    public String handleSchedulePost() {
        return "board/schedule";
    }
}
