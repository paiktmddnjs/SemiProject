package com.kh.spring.dao;

import com.kh.spring.vo.RequestVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RequestDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public int createRequest(RequestVo request) {
        String sql = "INSERT INTO REQUEST (REQUEST_ID, WORKSPACE_ID, SEND_MEMBER, FROM_MEMBER, REQUEST_STATUS) " +
                     "VALUES (SEQ_REQUEST_ID.NEXTVAL, ?, ?, ?, 'PENDING')";
        return jdbcTemplate.update(sql,
                request.getWorkspaceId(),
                request.getSendMember(),
                request.getFromMember());
    }

    public boolean isPendingRequestExists(int workspaceId, int senderId, int receiverId) {
        String sql = "SELECT COUNT(*) FROM REQUEST " +
                     "WHERE WORKSPACE_ID = ? AND SEND_MEMBER = ? AND FROM_MEMBER = ? AND REQUEST_STATUS = 'PENDING'";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, workspaceId, senderId, receiverId);
        return count != null && count > 0;
    }

    public List<RequestVo> getPendingRequestsByMemberId(int memberId) {
        String sql = "SELECT r.REQUEST_ID, r.WORKSPACE_ID, w.WORKSPACE_NAME, m.MEMBER_NAME AS SENDER_NAME " +
                     "FROM REQUEST r " +
                     "JOIN WORKSPACE w ON r.WORKSPACE_ID = w.WORKSPACE_ID " +
                     "JOIN MEMBER m ON r.SEND_MEMBER = m.MEMBER_ID " +
                     "WHERE r.FROM_MEMBER = ? AND r.REQUEST_STATUS = 'PENDING'";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            RequestVo req = new RequestVo();
            req.setRequestId(rs.getInt("REQUEST_ID"));
            req.setWorkspaceId(rs.getInt("WORKSPACE_ID"));
            req.setWorkspaceName(rs.getString("WORKSPACE_NAME"));
            req.setSenderName(rs.getString("SENDER_NAME"));
            return req;
        }, memberId);
    }

    public RequestVo getRequestById(int requestId) {
        String sql = "SELECT * FROM REQUEST WHERE REQUEST_ID = ?";
        try {
            return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
                RequestVo req = new RequestVo();
                req.setRequestId(rs.getInt("REQUEST_ID"));
                req.setWorkspaceId(rs.getInt("WORKSPACE_ID"));
                req.setSendMember(rs.getInt("SEND_MEMBER"));
                req.setFromMember(rs.getInt("FROM_MEMBER"));
                req.setRequestStatus(rs.getString("REQUEST_STATUS"));
                return req;
            }, requestId);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public int updateRequestStatus(int requestId, String status) {
        String sql = "UPDATE REQUEST SET REQUEST_STATUS = ? WHERE REQUEST_ID = ?";
        return jdbcTemplate.update(sql, status, requestId);
    }
}
