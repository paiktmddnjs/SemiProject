package com.kh.spring.model.mapper;

import com.kh.spring.controlloer.board.ScheduleController;
import com.kh.spring.model.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ScheduleMapper {
    List<Workspace> scheduleWorkspaceSelect(@Param("memberId") int memberId);
    List<Project> scheduleProjectSelect(@Param("workspaceId") int workspaceId);
    List<Project> scheduleProjectWholeSelect();
    int statusTodoSelect(@Param("workspaceId") int workspaceId);
    int statusTodoWholeSelect();
    int statusProgressSelect(@Param("workspaceId") int workspaceId);
    int statusProgressWholeSelect();
    int statusCompleteSelect(@Param("workspaceId") int workspaceId);
    int statusCompleteWholeSelect();
    List<Task> calendarSelect(@Param("projectId") int projectId);
    List<Task> calendarWholeSelect();
    List<Task> dailyTaskSelect(@Param("selectedDate") String selectedDate);
    List<Task> dailyTaskMemberNoSelect(@Param("memberId") int memberId, @Param("selectedDate") String selectedDate);
    List<Task> dailyTaskWorkspaceSelect(@Param("workspaceId") int workspaceId, @Param("selectedDate") String selectedDate);
    List<Task> dailyTaskProjectSelect(@Param("projectId") int projectId, @Param("selectedDate") String selectedDate);
    List<StatusContainer> workspaceStatusSelect();
    List<StatusContainer> projectStatusSelect();
}
