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
        // 테이블명과 컬럼명을 CHANEL 스키마에 맞게 수정
        String sql = "SELECT CHANEL_ID, MEMBER_ID, CHANEL_NAME, PLATFORM_TYPE, PLATFROM_SUBSCRIBE, " +
                     "CHANEL_STATUS, CHANEL_CREATE, CHANEL_URL, CHANEL_COUNT FROM CHANEL";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            ChannelVo channel = new ChannelVo();
            channel.setChannelId(rs.getInt("CHANEL_ID")); // VO 필드명은 그대로 유지, 컬럼명만 수정
            channel.setMemberId(rs.getInt("MEMBER_ID"));
            channel.setChannelName(rs.getString("CHANEL_NAME"));
            channel.setPlatformType(rs.getString("PLATFORM_TYPE"));
            channel.setPlatformSubscribe(rs.getLong("PLATFROM_SUBSCRIBE"));
            channel.setChannelStatus(rs.getString("CHANEL_STATUS"));
            channel.setChannelCreate(rs.getDate("CHANEL_CREATE"));
            channel.setChannelUrl(rs.getString("CHANEL_URL"));
            channel.setChannelCount(rs.getString("CHANEL_COUNT"));
            return channel;
        });
    }
}
