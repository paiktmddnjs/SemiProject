package com.kh.spring.model.service;

import com.kh.spring.model.dao.ProjectDao;
import com.kh.spring.model.dao.TaskDao;
import com.kh.spring.model.dao.WorkspaceDao;
import com.kh.spring.model.vo.ProjectVo;
import com.kh.spring.model.vo.TaskVo;
import com.kh.spring.model.vo.WorkspaceMemberVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; // import 추가

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TaskService {

    @Autowired
    private TaskDao taskDao;

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private WorkspaceDao workspaceDao;

    public Map<String, Object> getNewTaskFormData(int projectId) {
        Map<String, Object> result = new HashMap<>();
        ProjectVo project = projectDao.getProjectById(projectId);
        if (project != null) {
            List<WorkspaceMemberVo> memberList = workspaceDao.getWorkspaceMembersByWorkspaceId(project.getWorkspaceId());
            result.put("workspaceMembers", memberList);
        }
        result.put("projectId", projectId);
        return result;
    }

    @Transactional
    public int createTask(TaskVo task) {
        task.setTaskStatus("worktodo");
        return taskDao.insertTask(task);
    }

    @Transactional
    public int updateTaskStatus(int taskId, String status) {
        return taskDao.updateTaskStatus(taskId, status);
    }

    @Transactional
    public int updateTaskAssignee(int taskId, Integer workspaceMemberId) {
        return taskDao.updateTaskAssignee(taskId, workspaceMemberId);
    }
}
