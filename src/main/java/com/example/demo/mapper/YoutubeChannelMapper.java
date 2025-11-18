package com.example.demo.mapper;

import com.example.demo.dto.ChannelDbDto;
import com.example.demo.dto.ChannelDto;
import com.example.demo.dto.YoutubeChannelDto;
import com.example.demo.dto.YoutubedashboardDto;
import com.google.api.services.youtube.YouTube;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface YoutubeChannelMapper {

    List<YoutubedashboardDto> findByMemberId(@Param("memberId") Long memberId);


    YoutubeChannelDto findById(@Param("chanelId") Long chanelId);

    List<YoutubeChannelDto> findAllActive();

    int insert(YoutubeChannelDto channel);


    int update(YoutubeChannelDto channel);


    int deleteById(@Param("chanelId") Long chanelId);
    ChannelDbDto findByMemberIdAndPlatform(Long memberId, String platformType);
    void insertChannel(ChannelDbDto dto);
    void updateChannel(ChannelDbDto dto);


}
