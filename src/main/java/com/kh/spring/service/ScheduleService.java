package com.kh.spring.service;

import com.kh.spring.model.vo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScheduleService {
    List<Workspace> scheduleWorkspaceSelect(int memberId);
    List<Project> scheduleProjectSelect(int projectId);
    List<Project> scheduleProjectWholeSelect();
    int statusTodoSelect(int workspaceId);
    int statusTodoWholeSelect();
    int statusProgressSelect(int workspaceId);
    int statusProgressWholeSelect();
    int statusCompleteSelect(int workspaceId);
    int statusCompleteWholeSelect();
    List<Task> calendarSelect(int projectId);
    List<Task> calendarWholeSelect();
    List<Task> dailyTaskSelect(String selectedDate);
    List<StatusContainer> workspaceStatusSelect();
    List<StatusContainer> projectStatusSelect();
}
