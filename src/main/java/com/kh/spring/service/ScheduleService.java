package com.kh.spring.service;

import com.kh.spring.model.vo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScheduleService {
    List<Workspace> scheduleWorkspaceSelect(int memberId);
    List<Project> scheduleProjectSelect(int projectId);
    List<Project> scheduleProjectWholeSelect();
    int statusTodoSelect(int memberId, int workspaceId);
    int statusTodoWholeSelect(int memberId);
    int statusProgressSelect(int memberId, int workspaceId);
    int statusProgressWholeSelect(int memberId);
    int statusCompleteSelect(int memberId, int workspaceId);
    int statusCompleteWholeSelect(int memberId);
    List<Task> calendarSelect(int memberId, int projectId);
    List<Task> calendarWorkspaceSelect(int memberId, int workspaceId);
    List<Task> calendarWholeSelect(int memberId);
    List<Task> dailyTaskSelect(String selectedDate);
    List<Task> dailyTaskMemberNoSelect(int memberId, String selectedDate);
    List<Task> dailyTaskWorkspaceSelect(int memberId, int workspaceId, String selectedDate);
    List<Task> dailyTaskProjectSelect(int memberId, int projectId, String selectedDate);
    List<StatusContainer> workspaceStatusSelect();
    List<StatusContainer> projectStatusSelect();
}
