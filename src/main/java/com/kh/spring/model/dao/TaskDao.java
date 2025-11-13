package com.kh.spring.model.dao;

import com.kh.spring.model.vo.MemberVo;
import com.kh.spring.model.vo.TaskVo;
import com.kh.spring.model.vo.WorkspaceMemberVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TaskDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<TaskVo> getTasksByProjectId(int projectId) {
        String sql = "SELECT " +
                     "    t.TASK_ID, t.PROJECT_ID, t.WORKSPACE_MEMBER_ID, t.TASK_NAME, t.TASK_ASSIGN, " +
                     "    t.TASK_STATUS, t.TASK_START, t.TASK_DEADLINE, " +
                     "    wm.MEMBER_ID, " +
                     "    m.MEMBER_NAME, m.EMAIL " +
                     "FROM TASK t " +
                     "LEFT JOIN WORKSPACE_MEMBER wm ON t.WORKSPACE_MEMBER_ID = wm.WORKSPACE_MEMBER_ID " +
                     "LEFT JOIN MEMBER m ON wm.MEMBER_ID = m.MEMBER_ID " +
                     "WHERE t.PROJECT_ID = ? " +
                     "ORDER BY t.TASK_START DESC";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            TaskVo task = new TaskVo();
            task.setTaskId(rs.getInt("TASK_ID"));
            task.setProjectId(rs.getInt("PROJECT_ID"));
            task.setWorkspaceMemberId(rs.getInt("WORKSPACE_MEMBER_ID"));
            task.setTaskName(rs.getString("TASK_NAME"));
            task.setTaskAssign(rs.getString("TASK_ASSIGN"));
            task.setTaskStatus(rs.getString("TASK_STATUS"));
            task.setTaskStart(rs.getDate("TASK_START"));
            task.setTaskDeadline(rs.getDate("TASK_DEADLINE"));

            // 담당자가 지정된 경우에만 멤버 정보 매핑
            if (rs.getObject("WORKSPACE_MEMBER_ID") != null) {
                WorkspaceMemberVo workspaceMember = new WorkspaceMemberVo();
                workspaceMember.setWorkspaceMemberId(rs.getInt("WORKSPACE_MEMBER_ID"));
                workspaceMember.setMemberId(rs.getInt("MEMBER_ID"));

                MemberVo member = new MemberVo();
                member.setMemberId(rs.getInt("MEMBER_ID"));
                member.setMemberName(rs.getString("MEMBER_NAME"));
                member.setEmail(rs.getString("EMAIL"));

                workspaceMember.setMemberVo(member);
                task.setWorkspaceMember(workspaceMember);
            }

            return task;
        }, projectId);
    }
}
