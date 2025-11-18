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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.Console;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
        List<StatusContainer> workspaceStatus = scheduleServiceImpl.workspaceStatusSelect();
        List<StatusContainer> projectStatus = scheduleServiceImpl.projectStatusSelect();


        model.addAttribute("scheduleWorkspaces", workspace);
        model.addAttribute("scheduleProjects", project);
        model.addAttribute("todo", statusTodo);
        model.addAttribute("progress", statusProgress);
        model.addAttribute("complete", statusComplete);
        model.addAttribute("calendar", calendar);
        model.addAttribute("dailyTask", dailyTask);
        model.addAttribute("workspaceStatus", workspaceStatus);
        model.addAttribute("projectStatus", projectStatus);
        return "board/schedule";
    }

    // POST 요청 처리
    @PostMapping("/schedule.bo")
    public String handleSchedulePost() {
        return "board/schedule";
    }

    @PostMapping("/scheduleWorkspace")
    @ResponseBody
    public Map<String, Object> scheduleWorkspaceId(@RequestParam("workspaceSelect") int workspaceId) {

        List<Project> project = scheduleServiceImpl.scheduleProjectSelect(workspaceId);
        int statusTodo = scheduleServiceImpl.statusTodoSelect(workspaceId);
        int statusProgress = scheduleServiceImpl.statusProgressSelect(workspaceId);
        int statusComplete = scheduleServiceImpl.statusCompleteSelect(workspaceId);

        Map<String, Object> result = new HashMap<>();
        result.put("scheduleProjects", project);
        result.put("statusTodo", statusTodo);
        result.put("statusProgress", statusProgress);
        result.put("statusComplete", statusComplete);

        return result;
    }

    @PostMapping("/scheduleProject")
    @ResponseBody
    public Map<String, Object> scheduleProjectId(@RequestParam("projectSelect") int projectId) {

        List<Task> calendarSelect = scheduleServiceImpl.calendarSelect(projectId);

        Map<String, Object> result = new HashMap<>();
        result.put("scheduleCalendar", calendarSelect);

        return result;
    }

    @PostMapping("/scheduleDate")
    @ResponseBody
    public Map<String, Object> scheduleDate(@RequestParam("dateSelect") String dateStr) {

        List<Task> dailyTaskSelect = scheduleServiceImpl.dailyTaskSelect(dateStr);

        System.out.println(dailyTaskSelect);
        Map<String, Object> result = new HashMap<>();
        result.put("dailyTask", dailyTaskSelect);

        return result;
    }
}
