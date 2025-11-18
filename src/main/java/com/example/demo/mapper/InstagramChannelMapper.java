package com.example.demo.mapper;


import com.example.demo.dto.InstagramChannelDto;
import com.example.demo.dto.InstagramdashboardDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface InstagramChannelMapper {

    /**
     * 멤버 ID로 Instagram 채널 조회
     */
    List<InstagramChannelDto> findByMemberId(@Param("memberId") Long memberId);

    /**
     * 플랫폼 타입과 상태로 Instagram 채널 목록 조회 (활성 채널만)
     */
    List<InstagramdashboardDto> findByPlatformTypeAndStatusInstagram(@Param("memberId") Long memberId);

    /**
     * 채널 ID로 조회
     */
    InstagramChannelDto findById(@Param("chanelId") Long chanelId);

    /**
     * INSERT
     */
    int insert(InstagramChannelDto channel);

    /**
     * UPDATE
     */
    int update(InstagramChannelDto channel);

    /**
     * DELETE
     */
    int deleteById(@Param("chanelId") Long chanelId);
}
