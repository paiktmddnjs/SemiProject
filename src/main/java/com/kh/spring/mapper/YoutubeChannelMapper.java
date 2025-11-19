package com.kh.spring.mapper;

import com.kh.spring.dto.ChannelDbDto;
import com.kh.spring.dto.YoutubeChannelDto;
import com.kh.spring.dto.YoutubedashboardDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface YoutubeChannelMapper {

    List<YoutubedashboardDto> findByMemberId(@Param("memberId") int memberId);


    YoutubeChannelDto findById(@Param("chanelId") Long chanelId);

    List<YoutubeChannelDto> findAllActive();

    int insert(YoutubeChannelDto channel);


    int update(YoutubeChannelDto channel);


    int deleteById(@Param("chanelId") Long chanelId);
    ChannelDbDto findByMemberIdAndPlatform(int memberId, String platformType);
    void insertChannel(ChannelDbDto dto);
    void updateChannel(ChannelDbDto dto);


}
