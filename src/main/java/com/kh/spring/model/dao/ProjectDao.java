package com.kh.spring.model.dao;

import com.kh.spring.model.vo.ProjectVo;
import org.springframework.beans.factory.annotation.Autowired;
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
        // Oracle의 시퀀스를 사용하여 PROJECT_ID를 자동 생성한다고 가정합니다. (예: SEQ_PROJECT_ID)
        // 만약 시퀀스가 없다면 이 부분은 수정이 필요합니다.
        String sql = "INSERT INTO PROJECT (WORKSPACE_ID, PROJECT_NAME, PROJECT_EXPLAIN) VALUES (?, ?, ?)";
        return jdbcTemplate.update(sql,
                project.getWorkspaceId(),
                project.getProjectName(),
                project.getProjectExplain());
    }
}
