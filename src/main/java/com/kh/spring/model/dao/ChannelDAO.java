package com.kh.spring.model.dao;

import com.kh.spring.model.vo.ChannelVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ChannelDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<ChannelVo> getAllChannels() {
        // WHERE 조건절을 임시로 제거하고, 컬럼명 오타 수정
        String sql = "SELECT * FROM CHANNEL";
        
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            ChannelVo channel = new ChannelVo();
            // 조회한 모든 컬럼을 Vo에 매핑
            channel.setChannelId(rs.getInt("CHANNEL_ID"));
            channel.setMemberId(rs.getInt("MEMBER_ID"));
            channel.setChannelName(rs.getString("CHANNEL_NAME"));
            channel.setPlatformType(rs.getString("PLATFORM_TYPE"));
            channel.setChannelSubscribe(rs.getInt("CHANNEL_SUBSCRIBE"));
            channel.setChannelStatus(rs.getString("CHANNEL_STATUS"));
            channel.setChannelCreateDate(rs.getDate("CHANNEL_CREATE")); // 오타 수정
            channel.setChannelUrl(rs.getString("CHANNEL_URL"));
            channel.setChannelContentCount(rs.getInt("CHANNEL_CONTENT_COUNT"));
            return channel;
        });
    }
}
