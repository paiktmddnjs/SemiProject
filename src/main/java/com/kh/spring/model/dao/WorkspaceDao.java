package com.kh.spring.model.dao;

import com.kh.spring.model.vo.MemberVo;
import com.kh.spring.model.vo.WorkspaceMemberVo;
import com.kh.spring.model.vo.WorkspaceVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class WorkspaceDao {

    private static final Logger log = LoggerFactory.getLogger(WorkspaceDao.class);

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

    public WorkspaceVo getWorkspaceById(int workspaceId) {
        String sql = "SELECT WORKSPACE_ID, WORKSPACE_NAME, WORKSPACE_EXPLAIN FROM WORKSPACE WHERE WORKSPACE_ID = ?";
        try {
            return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
                WorkspaceVo ws = new WorkspaceVo();
                ws.setWorkspaceId(rs.getInt("WORKSPACE_ID"));
                ws.setWorkspaceName(rs.getString("WORKSPACE_NAME"));
                ws.setWorkspaceExplain(rs.getString("WORKSPACE_EXPLAIN"));
                return ws;
            }, workspaceId);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public int insertWorkspace(WorkspaceVo workspace) {
        String sql = "INSERT INTO WORKSPACE (CHANNEL_ID, WORKSPACE_NAME, WORKSPACE_EXPLAIN, ENROLL_DATE) VALUES (?, ?, ?, SYSDATE)";
        return jdbcTemplate.update(sql,
                workspace.getChannelId(),
                workspace.getWorkspaceName(),
                workspace.getWorkspaceExplain());
    }

    public int updateWorkspace(WorkspaceVo workspace) {
        String sql = "UPDATE WORKSPACE SET WORKSPACE_NAME = ?, WORKSPACE_EXPLAIN = ? WHERE WORKSPACE_ID = ?";
        return jdbcTemplate.update(sql,
                workspace.getWorkspaceName(),
                workspace.getWorkspaceExplain(),
                workspace.getWorkspaceId());
    }

    public List<WorkspaceMemberVo> getWorkspaceMembersByWorkspaceId(int workspaceId) {
        String sql = "SELECT wm.WORKSPACE_MEMBER_ID, wm.WORKSPACE_ID, wm.MEMBER_ID, wm.WORKSPACE_MEMBER_ROLE, " +
                     "m.MEMBER_EMAIL, m.MEMBER_NAME, m.MEMBER_ENROLL_DATE " +
                     "FROM WORKSPACE_MEMBER wm " +
                     "JOIN MEMBER m ON wm.MEMBER_ID = m.MEMBER_ID " +
                     "WHERE wm.WORKSPACE_ID = ?";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            WorkspaceMemberVo workspaceMember = new WorkspaceMemberVo();
            workspaceMember.setWorkspaceMemberId(rs.getInt("WORKSPACE_MEMBER_ID"));
            workspaceMember.setWorkspaceId(rs.getInt("WORKSPACE_ID"));
            workspaceMember.setMemberId(rs.getInt("MEMBER_ID"));
            workspaceMember.setWorkspaceMemberRole(rs.getString("WORKSPACE_MEMBER_ROLE"));
            workspaceMember.setEnrollDate(rs.getDate("MEMBER_ENROLL_DATE"));

            MemberVo member = new MemberVo();
            member.setMemberId(rs.getInt("MEMBER_ID"));
            member.setMemberEmail(rs.getString("MEMBER_EMAIL"));
            member.setMemberName(rs.getString("MEMBER_NAME"));
            member.setMemberEnrollDate(rs.getDate("MEMBER_ENROLL_DATE"));
            
            workspaceMember.setMemberVo(member);
            return workspaceMember;
        }, workspaceId);
    }
}
