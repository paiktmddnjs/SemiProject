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
    public List<Project> scheduleProjectSelect(int projectId){
        return scheduleMapper.scheduleProjectSelect(projectId);
    }

    @Override
    public List<Project> scheduleProjectWholeSelect(){
        return scheduleMapper.scheduleProjectWholeSelect();
    }

    @Override
    public int statusTodoSelect(int projectId){
        return scheduleMapper.statusTodoSelect(projectId);
    }

    @Override
    public int statusTodoWholeSelect(){
        return scheduleMapper.statusTodoWholeSelect();
    }

    @Override
    public int statusProgressSelect(int projectId){
        return scheduleMapper.statusProgressSelect(projectId);
    }

    @Override
    public int statusProgressWholeSelect(){
        return scheduleMapper.statusProgressWholeSelect();
    }

    @Override
    public int statusCompleteSelect(int projectId){
        return scheduleMapper.statusCompleteSelect(projectId);
    }

    @Override
    public int statusCompleteWholeSelect(){
        return scheduleMapper.statusCompleteWholeSelect();
    }

    @Override
    public List<Task> calendarSelect(int projectId){
        return scheduleMapper.calendarSelect(projectId);
    }

    @Override
    public List<Task> calendarWholeSelect(){
        return scheduleMapper.calendarWholeSelect();
    }

    @Override
    public List<Task> dailyTaskSelect(String selectedDate){
        return scheduleMapper.dailyTaskSelect(selectedDate);
    }

    @Override
    public List<StatusContainer> workspaceStatusSelect(int workspaceId){
        return scheduleMapper.workspaceStatusSelect(workspaceId);
    }

    @Override
    public List<StatusContainer> workspaceStatusWholeSelect(){
        return scheduleMapper.workspaceStatusWholeSelect();
    }

    @Override
    public List<StatusContainer> projectStatusSelect(int projectId){
        return scheduleMapper.projectStatusSelect(projectId);
    }

    @Override
    public List<StatusContainer> projectStatusWholeSelect(){
        return scheduleMapper.projectStatusWholeSelect();
    }
}
