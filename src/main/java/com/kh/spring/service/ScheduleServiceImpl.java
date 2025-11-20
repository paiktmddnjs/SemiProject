package com.kh.spring.service;

import com.kh.spring.model.mapper.ScheduleMapper;
import com.kh.spring.model.vo.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ScheduleServiceImpl implements ScheduleService{

    private final ScheduleMapper scheduleMapper;

    @Autowired
    public ScheduleServiceImpl(ScheduleMapper scheduleMapper){
        this.scheduleMapper = scheduleMapper;
    }

    @Override
    public List<Workspace> scheduleWorkspaceSelect(int memberId) {
        return scheduleMapper.scheduleWorkspaceSelect(memberId);
    }

    @Override
    public List<Project> scheduleProjectSelect(int workspaceId){
        return scheduleMapper.scheduleProjectSelect(workspaceId);
    }

    @Override
    public List<Project> scheduleProjectWholeSelect(){
        return scheduleMapper.scheduleProjectWholeSelect();
    }

    @Override
    public int statusTodoSelect(int memberId, int workspaceId){
        return scheduleMapper.statusTodoSelect(memberId, workspaceId);
    }

    @Override
    public int statusTodoWholeSelect(int memberId){
        return scheduleMapper.statusTodoWholeSelect(memberId);
    }

    @Override
    public int statusProgressSelect(int memberId, int workspaceId){
        return scheduleMapper.statusProgressSelect(memberId, workspaceId);
    }

    @Override
    public int statusProgressWholeSelect(int memberId){
        return scheduleMapper.statusProgressWholeSelect(memberId);
    }

    @Override
    public int statusCompleteSelect(int memberId, int workspaceId){
        return scheduleMapper.statusCompleteSelect(memberId, workspaceId);
    }

    @Override
    public int statusCompleteWholeSelect(int memberId){
        return scheduleMapper.statusCompleteWholeSelect(memberId);
    }

    @Override
    public List<Task> calendarSelect(int memberId, int projectId){
        return scheduleMapper.calendarSelect(memberId, projectId);
    }

    @Override
    public List<Task> calendarWorkspaceSelect(int memberId, int workspaceId){
        return scheduleMapper.calendarWorkspaceSelect(memberId, workspaceId);
    }

    @Override
    public List<Task> calendarWholeSelect(int memberId){
        return scheduleMapper.calendarWholeSelect(memberId);
    }

    @Override
    public List<Task> dailyTaskSelect(String selectedDate){
        return scheduleMapper.dailyTaskSelect(selectedDate);
    }

    @Override
    public List<Task> dailyTaskMemberNoSelect(int memberId, String selectedDate){
        return scheduleMapper.dailyTaskMemberNoSelect(memberId, selectedDate);
    }

    @Override
    public List<Task> dailyTaskWorkspaceSelect(int memberId, int workspaceId, String selectedDate){
        return scheduleMapper.dailyTaskWorkspaceSelect(memberId, workspaceId, selectedDate);
    }

    @Override
    public List<Task> dailyTaskProjectSelect(int memberId, int projectId, String selectedDate){
        return scheduleMapper.dailyTaskProjectSelect(memberId, projectId, selectedDate);
    }

    @Override
    public List<StatusContainer> workspaceStatusSelect(){
        return scheduleMapper.workspaceStatusSelect();
    }

    @Override
    public List<StatusContainer> projectStatusSelect(){
        return scheduleMapper.projectStatusSelect();
    }
}
