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
        // 이미지 관련 JOIN 및 컬럼 제거
        String sql = "SELECT " +
                     "    W.WORKSPACE_ID, W.WORKSPACE_NAME, W.WORKSPACE_EXPLAIN, W.ENROLL_DATE, " +
                     "    C.CHANEL_ID, C.CHANEL_NAME, " +
                     "    (SELECT COUNT(*) FROM PROJECT P WHERE P.WORKSPACE_ID = W.WORKSPACE_ID) AS PROJECT_COUNT, " +
                     "    (SELECT COUNT(DISTINCT WM.MEMBER_ID) FROM WORKSPACE_MEMBER WM WHERE WM.WORKSPACE_ID = W.WORKSPACE_ID) AS MEMBER_COUNT " +
                     "FROM WORKSPACE W " +
                     "JOIN CHANEL C ON W.CHANEL_ID = C.CHANEL_ID";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            WorkspaceVo ws = new WorkspaceVo();
            ws.setWorkspaceId(rs.getInt("WORKSPACE_ID"));
            ws.setWorkspaceName(rs.getString("WORKSPACE_NAME"));
            ws.setWorkspaceExplain(rs.getString("WORKSPACE_EXPLAIN"));
            ws.setEnrollDate(rs.getDate("ENROLL_DATE"));
            ws.setChannelId(rs.getInt("CHANEL_ID"));
            ws.setChannelName(rs.getString("CHANEL_NAME"));
            ws.setProjectCount(rs.getInt("PROJECT_COUNT"));
            ws.setMemberCount(rs.getInt("MEMBER_COUNT"));
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
        String sql = "INSERT INTO WORKSPACE (WORKSPACE_ID, CHANEL_ID, WORKSPACE_NAME, WORKSPACE_EXPLAIN) VALUES (SEQ_WORKSPACE_ID.NEXTVAL, ?, ?, ?)";
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
        // 이미지 관련 컬럼 제거
        String sql = "SELECT wm.WORKSPACE_MEMBER_ID, wm.WORKSPACE_ID, wm.MEMBER_ID, wm.WORKSPACE_MEMBER_ROLE, " +
                     "m.EMAIL, m.MEMBER_NAME, m.ENROLL_DATE " +
                     "FROM WORKSPACE_MEMBER wm " +
                     "JOIN MEMBER m ON wm.MEMBER_ID = m.MEMBER_ID " +
                     "WHERE wm.WORKSPACE_ID = ?";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            WorkspaceMemberVo workspaceMember = new WorkspaceMemberVo();
            workspaceMember.setWorkspaceMemberId(rs.getInt("WORKSPACE_MEMBER_ID"));
            workspaceMember.setWorkspaceId(rs.getInt("WORKSPACE_ID"));
            workspaceMember.setMemberId(rs.getInt("MEMBER_ID"));
            workspaceMember.setWorkspaceMemberRole(rs.getString("WORKSPACE_MEMBER_ROLE"));

            MemberVo member = new MemberVo();
            member.setMemberId(rs.getInt("MEMBER_ID"));
            member.setEmail(rs.getString("EMAIL"));
            member.setMemberName(rs.getString("MEMBER_NAME"));
            member.setEnrollDate(rs.getDate("ENROLL_DATE"));
            
            workspaceMember.setMemberVo(member);
            return workspaceMember;
        }, workspaceId);
    }

    public MemberVo getMemberByEmail(String email) {
        // 이미지 관련 컬럼 제거
        String sql = "SELECT MEMBER_ID, EMAIL, MEMBER_NAME, ENROLL_DATE FROM MEMBER WHERE EMAIL = ?";
        try {
            return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
                MemberVo member = new MemberVo();
                member.setMemberId(rs.getInt("MEMBER_ID"));
                member.setEmail(rs.getString("EMAIL"));
                member.setMemberName(rs.getString("MEMBER_NAME"));
                member.setEnrollDate(rs.getDate("ENROLL_DATE"));
                return member;
            }, email);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public int addWorkspaceMember(int workspaceId, int memberId, String role) {
        String sql = "INSERT INTO WORKSPACE_MEMBER (WORKSPACE_MEMBER_ID, WORKSPACE_ID, MEMBER_ID, WORKSPACE_MEMBER_ROLE) " +
                     "VALUES (SEQ_WORKSPACE_MEMBER_ID.NEXTVAL, ?, ?, ?)";
        return jdbcTemplate.update(sql, workspaceId, memberId, role);
    }

    public boolean isMemberInWorkspace(int workspaceId, int memberId) {
        String sql = "SELECT COUNT(*) FROM WORKSPACE_MEMBER WHERE WORKSPACE_ID = ? AND MEMBER_ID = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, workspaceId, memberId);
        return count != null && count > 0;
    }
}
