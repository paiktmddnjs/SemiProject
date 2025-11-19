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
        List<Project> project = scheduleServiceImpl.scheduleProjectWholeSelect(memberId);
        int statusTodo = scheduleServiceImpl.statusTodoWholeSelect(memberId);
        int statusProgress = scheduleServiceImpl.statusProgressWholeSelect(memberId);
        int statusComplete = scheduleServiceImpl.statusCompleteWholeSelect(memberId);
        List<Task> calendar = scheduleServiceImpl.calendarWholeSelect(memberId);
        List<Task> dailyTask = scheduleServiceImpl.dailyTaskMemberNoSelect(memberId, todayStr);
        int taskMany = dailyTask.size();
        List<StatusContainer> workspaceStatus = scheduleServiceImpl.workspaceStatusSelect();
        List<StatusContainer> projectStatus = scheduleServiceImpl.projectStatusSelect();

        System.out.println(todayStr);

        model.addAttribute("memberId", memberId);
        model.addAttribute("W_id", 0);
        model.addAttribute("P_id", 0);
        model.addAttribute("today", todayStr);
        model.addAttribute("taskMany", taskMany);
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
    public Map<String, Object> scheduleWorkspaceId(@RequestParam("memberId") int memberId, @RequestParam("workspaceSelect") int workspaceId) {

        List<Project> project;
        int statusTodo;
        int statusProgress;
        int statusComplete;
        List<Task> calendar;

        if(workspaceId==0){
            project = scheduleServiceImpl.scheduleProjectWholeSelect(memberId);
            statusTodo = scheduleServiceImpl.statusTodoWholeSelect(memberId);
            statusProgress = scheduleServiceImpl.statusProgressWholeSelect(memberId);
            statusComplete = scheduleServiceImpl.statusCompleteWholeSelect(memberId);
            calendar = scheduleServiceImpl.calendarWholeSelect(memberId);
        } else{
            project = scheduleServiceImpl.scheduleProjectSelect(workspaceId);
            statusTodo = scheduleServiceImpl.statusTodoSelect(memberId, workspaceId);
            statusProgress = scheduleServiceImpl.statusProgressSelect(memberId, workspaceId);
            statusComplete = scheduleServiceImpl.statusCompleteSelect(memberId, workspaceId);
            calendar = scheduleServiceImpl.calendarWorkspaceSelect(memberId, workspaceId);
        }

        System.out.println(project);
        System.out.println(statusTodo);
        System.out.println(statusProgress);
        System.out.println(statusComplete);

        Map<String, Object> result = new HashMap<>();
        result.put("scheduleProjects", project);
        result.put("statusTodo", statusTodo);
        result.put("statusProgress", statusProgress);
        result.put("statusComplete", statusComplete);
        result.put("scheduleCalendar", calendar);
        result.put("W_id", workspaceId);
        result.put("P_id", 0);

        return result;
    }

    @PostMapping("/scheduleProject")
    @ResponseBody
    public Map<String, Object> scheduleProjectId(@RequestParam("memberId") int memberId, @RequestParam("workspaceId") int W_id, @RequestParam("projectSelect") int projectId) {

        List<Task> calendarSelect;

        if(projectId!=0){
            calendarSelect = scheduleServiceImpl.calendarSelect(memberId, projectId);
        } else if(W_id!=0){
            calendarSelect = scheduleServiceImpl.calendarWorkspaceSelect(memberId, W_id);
        } else{
            calendarSelect = scheduleServiceImpl.calendarWholeSelect(memberId);
        }

        Map<String, Object> result = new HashMap<>();
        result.put("scheduleCalendar", calendarSelect);
        result.put("P_id", projectId);

        return result;
    }

    @PostMapping("/scheduleMemberNoDate")
    @ResponseBody
    public Map<String, Object> scheduleMemberDate(@RequestParam("memberId") int memberId, @RequestParam("dateSelect") String dateStr) {

        List<Task> dailyTaskSelect = scheduleServiceImpl.dailyTaskMemberNoSelect(memberId, dateStr);

        System.out.println(dailyTaskSelect);
        Map<String, Object> result = new HashMap<>();
        result.put("dailyTask", dailyTaskSelect);

        System.out.println("멤버Id : " + memberId);

        return result;
    }

    @PostMapping("/scheduleWorkspaceDate")
    @ResponseBody
    public Map<String, Object> scheduleWorkspaceDate(@RequestParam("memberId") int memberId, @RequestParam("workspaceId") int workspaceId, @RequestParam("dateSelect") String dateStr) {

        List<Task> dailyTaskSelect = scheduleServiceImpl.dailyTaskWorkspaceSelect(memberId, workspaceId, dateStr);

        System.out.println(dailyTaskSelect);
        Map<String, Object> result = new HashMap<>();
        result.put("dailyTask", dailyTaskSelect);

        System.out.println("워크스페이스Id : " + workspaceId);

        return result;
    }

    @PostMapping("/scheduleProjectDate")
    @ResponseBody
    public Map<String, Object> scheduleProjectDate(@RequestParam("memberId") int memberId, @RequestParam("projectId") int projectId, @RequestParam("dateSelect") String dateStr) {

        List<Task> dailyTaskSelect = scheduleServiceImpl.dailyTaskProjectSelect(memberId, projectId, dateStr);

        System.out.println(dailyTaskSelect);
        Map<String, Object> result = new HashMap<>();
        result.put("dailyTask", dailyTaskSelect);

        System.out.println("프로젝트Id : " + projectId);

        return result;
    }
}
