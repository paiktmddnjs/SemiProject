package com.kh.spring.model.service;

import com.kh.spring.model.dao.ProjectDao;
import com.kh.spring.model.dao.TaskDao;
import com.kh.spring.model.dao.WorkspaceDao;
import com.kh.spring.model.vo.ProjectVo;
import com.kh.spring.model.vo.TaskVo;
import com.kh.spring.model.vo.WorkspaceMemberVo;
import com.kh.spring.model.vo.WorkspaceVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; // import 추가

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProjectService {

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private TaskDao taskDao;

    @Autowired
    private WorkspaceDao workspaceDao;

    public Map<String, Object> getProjectPageData(int workspaceId) {
        Map<String, Object> result = new HashMap<>();
        WorkspaceVo workspace = workspaceDao.getWorkspaceById(workspaceId);
        List<ProjectVo> projectList = projectDao.getProjectsByWorkspaceId(workspaceId);
        List<WorkspaceMemberVo> memberList = workspaceDao.getWorkspaceMembersByWorkspaceId(workspaceId);

        result.put("workspace", workspace);
        result.put("projects", projectList);
        result.put("workspaceMembers", memberList);
        return result;
    }

    public Map<String, Object> getProjectDetailData(int projectId) {
        Map<String, Object> result = new HashMap<>();
        ProjectVo project = projectDao.getProjectById(projectId);
        if (project == null) return null;

        List<TaskVo> taskList = taskDao.getTasksByProjectId(projectId);
        List<WorkspaceMemberVo> memberList = workspaceDao.getWorkspaceMembersByWorkspaceId(project.getWorkspaceId());

        int calculatedProgress = 0;
        if (taskList != null && !taskList.isEmpty()) {
            long completeCount = taskList.stream().filter(t -> "complete".equals(t.getTaskStatus())).count();
            calculatedProgress = (int) Math.round(((double) completeCount / taskList.size()) * 100);
        }

        result.put("project", project);
        result.put("taskList", taskList);
        result.put("workspaceMembers", memberList);
        result.put("calculatedProgress", calculatedProgress);
        return result;
    }

    @Transactional
    public int createProject(ProjectVo project) {
        return projectDao.insertProject(project);
    }

    @Transactional
    public int updateProject(ProjectVo project) {
        return projectDao.updateProject(project);
    }

    public ProjectVo getProjectById(int projectId) {
        return projectDao.getProjectById(projectId);
    }
}
