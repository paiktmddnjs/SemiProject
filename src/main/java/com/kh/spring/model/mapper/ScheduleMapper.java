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
    List<Project> scheduleProjectWholeSelect(@Param("memberId") int memberId);
    int statusTodoSelect(@Param("memberId") int memberId, @Param("workspaceId") int workspaceId);
    int statusTodoWholeSelect(@Param("memberId") int memberId);
    int statusProgressSelect(@Param("memberId") int memberId, @Param("workspaceId") int workspaceId);
    int statusProgressWholeSelect(@Param("memberId") int memberId);
    int statusCompleteSelect(@Param("memberId") int memberId, @Param("workspaceId") int workspaceId);
    int statusCompleteWholeSelect(@Param("memberId") int memberId);
    List<Task> calendarSelect(@Param("memberId") int memberId, @Param("projectId") int projectId);
    List<Task> calendarWorkspaceSelect(@Param("memberId") int memberId, @Param("workspaceId") int workspaceId);
    List<Task> calendarWholeSelect(@Param("memberId") int memberId);
    List<Task> dailyTaskSelect(@Param("selectedDate") String selectedDate);
    List<Task> dailyTaskMemberNoSelect(@Param("memberId") int memberId, @Param("selectedDate") String selectedDate);
    List<Task> dailyTaskWorkspaceSelect(@Param("memberId") int memberId, @Param("workspaceId") int workspaceId, @Param("selectedDate") String selectedDate);
    List<Task> dailyTaskProjectSelect(@Param("memberId") int memberId, @Param("projectId") int projectId, @Param("selectedDate") String selectedDate);
    List<StatusContainer> workspaceStatusSelect(@Param("memberId") int memberId);
    List<StatusContainer> projectStatusSelect(@Param("memberId") int memberId);
}
