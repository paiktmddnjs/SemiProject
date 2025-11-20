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
        
        // JOIN된 컬럼이 있을 경우에만 매핑
        if (hasColumn(rs, "PLATFORM_TYPE")) {
            project.setChannelPlatformType(rs.getString("PLATFORM_TYPE"));
        }
        
        return project;
    }

    // ResultSet에 특정 컬럼이 있는지 확인하는 헬퍼 메소드
    private boolean hasColumn(java.sql.ResultSet rs, String columnName) throws java.sql.SQLException {
        java.sql.ResultSetMetaData metaData = rs.getMetaData();
        int columns = metaData.getColumnCount();
        for (int x = 1; x <= columns; x++) {
            if (columnName.equals(metaData.getColumnName(x))) {
                return true;
            }
        }
        return false;
    }

    public List<ProjectVo> getProjectsByWorkspaceId(int workspaceId) {
        String sql = "SELECT p.*, c.PLATFORM_TYPE " +
                     "FROM PROJECT p " +
                     "JOIN WORKSPACE w ON p.WORKSPACE_ID = w.WORKSPACE_ID " +
                     "JOIN CHANEL c ON w.CHANEL_ID = c.CHANEL_ID " +
                     "WHERE p.WORKSPACE_ID = ? AND p.PROJECT_STATUS = 'Y'";
        return jdbcTemplate.query(sql, this::mapRowToProject, workspaceId);
    }

    public int insertProject(ProjectVo project) {
        String sql = "INSERT INTO PROJECT (PROJECT_ID, WORKSPACE_ID, PROJECT_NAME, PROJECT_MEMO, PROJECT_DEADLINE, PROJECT_STATUS, PROJECT_TYPE) " +
                     "VALUES (SEQ_PROJECT_ID.NEXTVAL, ?, ?, ?, ?, 'Y', ?)";
        return jdbcTemplate.update(sql,
                project.getWorkspaceId(),
                project.getProjectName(),
                project.getProjectMemo(),
                project.getProjectDeadline(),
                project.getProjectType());
    }

    public ProjectVo getProjectById(int projectId) {
        String sql = "SELECT p.*, c.PLATFORM_TYPE " +
                     "FROM PROJECT p " +
                     "JOIN WORKSPACE w ON p.WORKSPACE_ID = w.WORKSPACE_ID " +
                     "JOIN CHANEL c ON w.CHANEL_ID = c.CHANEL_ID " +
                     "WHERE p.PROJECT_ID = ? AND p.PROJECT_STATUS = 'Y'";
        try {
            return jdbcTemplate.queryForObject(sql, this::mapRowToProject, projectId);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public int updateProject(ProjectVo project) {
        String sql = "UPDATE PROJECT SET " +
                     "PROJECT_NAME = ?, " +
                     "PROJECT_MEMO = ?, " +
                     "PROJECT_DEADLINE = ?, " +
                     "PROJECT_TYPE = ?, " +
                     "PROJECT_STATUS = ? " +
                     "WHERE PROJECT_ID = ?";
        return jdbcTemplate.update(sql,
                project.getProjectName(),
                project.getProjectMemo(),
                project.getProjectDeadline(),
                project.getProjectType(),
                project.getProjectStatus(),
                project.getProjectId());
    }

    public int updateProjectStatus(int projectId) {
        String sql = "UPDATE PROJECT SET PROJECT_STATUS = 'N' WHERE PROJECT_ID = ?";
        return jdbcTemplate.update(sql, projectId);
    }
}
