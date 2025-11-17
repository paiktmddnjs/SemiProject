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
    public int statusTodoSelect(int workspaceId){
        return scheduleMapper.statusTodoSelect(workspaceId);
    }

    @Override
    public int statusTodoWholeSelect(){
        return scheduleMapper.statusTodoWholeSelect();
    }

    @Override
    public int statusProgressSelect(int workspaceId){
        return scheduleMapper.statusProgressSelect(workspaceId);
    }

    @Override
    public int statusProgressWholeSelect(){
        return scheduleMapper.statusProgressWholeSelect();
    }

    @Override
    public int statusCompleteSelect(int workspaceId){
        return scheduleMapper.statusCompleteSelect(workspaceId);
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
    public List<StatusContainer> workspaceStatusSelect(){
        return scheduleMapper.workspaceStatusSelect();
    }

    @Override
    public List<StatusContainer> projectStatusSelect(){
        return scheduleMapper.projectStatusSelect();
    }
}
