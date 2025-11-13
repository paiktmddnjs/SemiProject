package com.kh.spring.model.mapper;

import com.kh.spring.controlloer.board.ScheduleController;
import com.kh.spring.model.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ScheduleMapper {
    List<Workspace> scheduleWorkspaceSelect(@Param("memberId") int memberId);
    List<Project> scheduleProjectSelect(@Param("projectId") int projectId);
    List<Project> scheduleProjectWholeSelect();
    int statusTodoSelect(@Param("projectId") int projectId);
    int statusTodoWholeSelect();
    int statusProgressSelect(@Param("projectId") int projectId);
    int statusProgressWholeSelect();
    int statusCompleteSelect(@Param("projectId") int projectId);
    int statusCompleteWholeSelect();
    List<Task> calendarSelect(@Param("projectId") int projectId);
    List<Task> calendarWholeSelect();
    List<Task> dailyTaskSelect(@Param("selectedDate") String selectedDate);
    List<StatusContainer> workspaceStatusSelect(@Param("workspaceId") int workspaceId);
    List<StatusContainer> workspaceStatusWholeSelect();
    List<StatusContainer> projectStatusSelect(@Param("projectId") int projectId);
    List<StatusContainer> projectStatusWholeSelect();
}
