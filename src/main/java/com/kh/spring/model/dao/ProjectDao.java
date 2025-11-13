package com.kh.spring.model.dao;

import com.kh.spring.model.vo.ProjectVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProjectDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private ProjectVo mapRowToProject(java.sql.ResultSet rs, int rowNum) throws java.sql.SQLException {
        ProjectVo project = new ProjectVo();
        project.setProjectId(rs.getInt("PROJECT_ID"));
        project.setWorkspaceId(rs.getInt("WORKSPACE_ID"));
        project.setProjectName(rs.getString("PROJECT_NAME"));
        project.setProjectStatus(rs.getString("PROJECT_STATUS"));
        project.setProjectStart(rs.getDate("PROJECT_START"));
        project.setProjectDeadline(rs.getDate("PROJECT_DEADLINE"));
        project.setProjectTime(rs.getString("PROJECT_TIME"));
        project.setProjectType(rs.getString("PROJECT_TYPE"));
        project.setProjectMemo(rs.getString("PROJECT_MEMO"));
        project.setProjectProgress(rs.getDouble("PROJECT_PROGRESS"));
        return project;
    }

    public List<ProjectVo> getProjectsByWorkspaceId(int workspaceId) {
        String sql = "SELECT * FROM PROJECT WHERE WORKSPACE_ID = ?";
        return jdbcTemplate.query(sql, this::mapRowToProject, workspaceId);
    }

    public int insertProject(ProjectVo project) {
        // PROJECT_EXPLAIN이 PROJECT_MEMO로 변경되었고, 다른 컬럼은 기본값 사용
        String sql = "INSERT INTO PROJECT (PROJECT_ID, WORKSPACE_ID, PROJECT_NAME, PROJECT_MEMO) VALUES (SEQ_PROJECT_ID.NEXTVAL, ?, ?, ?)";
        return jdbcTemplate.update(sql,
                project.getWorkspaceId(),
                project.getProjectName(),
                project.getProjectMemo());
    }

    public ProjectVo getProjectById(int projectId) {
        String sql = "SELECT * FROM PROJECT WHERE PROJECT_ID = ?";
        try {
            return jdbcTemplate.queryForObject(sql, this::mapRowToProject, projectId);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public int updateProject(ProjectVo project) {
        // PROJECT_EXPLAIN -> PROJECT_MEMO
        String sql = "UPDATE PROJECT SET PROJECT_NAME = ?, PROJECT_MEMO = ? WHERE PROJECT_ID = ?";
        return jdbcTemplate.update(sql,
                project.getProjectName(),
                project.getProjectMemo(),
                project.getProjectId());
    }
}
