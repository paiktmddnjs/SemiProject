package com.kh.spring.service;

import com.kh.spring.model.vo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScheduleService {
    List<Workspace> scheduleWorkspaceSelect(int memberId);
    List<Project> scheduleProjectSelect(int projectId);
    List<Project> scheduleProjectWholeSelect();
    int statusTodoSelect(int projectId);
    int statusTodoWholeSelect();
    int statusProgressSelect(int projectId);
    int statusProgressWholeSelect();
    int statusCompleteSelect(int projectId);
    int statusCompleteWholeSelect();
    List<Task> calendarSelect(int projectId);
    List<Task> calendarWholeSelect();
    List<Task> dailyTaskSelect(String selectedDate);
    List<StatusContainer> workspaceStatusSelect(int projectId);
    List<StatusContainer> workspaceStatusWholeSelect();
    List<StatusContainer> projectStatusSelect(int projectId);
    List<StatusContainer> projectStatusWholeSelect();
}
