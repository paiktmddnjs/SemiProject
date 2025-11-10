package com.kh.spring.model.dao;

import com.kh.spring.model.vo.WorkspaceVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class WorkspaceDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<WorkspaceVo> getAllWorkspaces() {
        // CHANNEL 테이블을 JOIN하고, 필요한 컬럼들을 추가로 SELECT
        String sql = "SELECT " +
                     "    W.WORKSPACE_ID, W.WORKSPACE_NAME, W.WORKSPACE_EXPLAIN, W.ENROLL_DATE, " +
                     "    C.CHANNEL_ID, C.CHANNEL_NAME " + // 실제 채널 설명 컬럼명으로 수정 필요
                     "FROM WORKSPACE W " +
                     "JOIN CHANNEL C ON W.CHANNEL_ID = C.CHANNEL_ID";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            WorkspaceVo ws = new WorkspaceVo();
            ws.setWorkspaceId(rs.getInt("WORKSPACE_ID"));
            ws.setWorkspaceName(rs.getString("WORKSPACE_NAME"));
            ws.setWorkspaceExplain(rs.getString("WORKSPACE_EXPLAIN"));
            ws.setEnrollDate(rs.getDate("ENROLL_DATE"));
            
            // JOIN으로 가져온 채널 정보 매핑
            ws.setChannelId(rs.getInt("CHANNEL_ID"));
            ws.setChannelName(rs.getString("CHANNEL_NAME"));

            return ws;
        });
    }

    /**
     * 새로운 워크스페이스를 데이터베이스에 추가하는 메소드
     * @param workspace 저장할 워크스페이스 정보
     * @return INSERT 성공 시 1, 실패 시 0
     */
    public int insertWorkspace(WorkspaceVo workspace) {
        String sql = "INSERT INTO WORKSPACE (CHANNEL_ID, WORKSPACE_NAME, WORKSPACE_EXPLAIN, ENROLL_DATE) VALUES (?, ?, ?, SYSDATE)";
        return jdbcTemplate.update(sql,
                workspace.getChannelId(),
                workspace.getWorkspaceName(),
                workspace.getWorkspaceExplain());
    }
}
