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

    /**
     * 특정 워크스페이스에 속한 모든 프로젝트를 조회하는 메소드
     * @param workspaceId 조회할 워크스페이스의 ID
     * @return 프로젝트 목록
     */
    public List<ProjectVo> getProjectsByWorkspaceId(int workspaceId) {
        String sql = "SELECT PROJECT_ID, WORKSPACE_ID, PROJECT_NAME, PROJECT_EXPLAIN FROM PROJECT WHERE WORKSPACE_ID = ?";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            ProjectVo project = new ProjectVo();
            project.setProjectId(rs.getInt("PROJECT_ID"));
            project.setWorkspaceId(rs.getInt("WORKSPACE_ID"));
            project.setProjectName(rs.getString("PROJECT_NAME"));
            project.setProjectExplain(rs.getString("PROJECT_EXPLAIN"));
            return project;
        }, workspaceId);
    }

    /**
     * 새로운 프로젝트를 데이터베이스에 추가하는 메소드
     * @param project 저장할 프로젝트 정보
     * @return INSERT 성공 시 1, 실패 시 0
     */
    public int insertProject(ProjectVo project) {
        String sql = "INSERT INTO PROJECT (PROJECT_ID, WORKSPACE_ID, PROJECT_NAME, PROJECT_EXPLAIN) VALUES (SEQ_PROJECT.NEXTVAL, ?, ?, ?)";
        return jdbcTemplate.update(sql,
                project.getWorkspaceId(),
                project.getProjectName(),
                project.getProjectExplain());
    }

    /**
     * 특정 프로젝트의 정보를 조회하는 메소드
     * @param projectId 조회할 프로젝트의 ID
     * @return 프로젝트 정보
     */
    public ProjectVo getProjectById(int projectId) {
        String sql = "SELECT PROJECT_ID, WORKSPACE_ID, PROJECT_NAME, PROJECT_EXPLAIN FROM PROJECT WHERE PROJECT_ID = ?";
        try {
            return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
                ProjectVo project = new ProjectVo();
                project.setProjectId(rs.getInt("PROJECT_ID"));
                project.setWorkspaceId(rs.getInt("WORKSPACE_ID"));
                project.setProjectName(rs.getString("PROJECT_NAME"));
                project.setProjectExplain(rs.getString("PROJECT_EXPLAIN"));
                return project;
            }, projectId);
        } catch (EmptyResultDataAccessException e) {
            return null; // 결과가 없을 경우 null 반환
        }
    }

    /**
     * 프로젝트 정보를 수정하는 메소드
     * @param project 수정할 프로젝트 정보
     * @return UPDATE 성공 시 1, 실패 시 0
     */
    public int updateProject(ProjectVo project) {
        String sql = "UPDATE PROJECT SET PROJECT_NAME = ?, PROJECT_EXPLAIN = ? WHERE PROJECT_ID = ?";
        return jdbcTemplate.update(sql,
                project.getProjectName(),
                project.getProjectExplain(),
                project.getProjectId());
    }
}
