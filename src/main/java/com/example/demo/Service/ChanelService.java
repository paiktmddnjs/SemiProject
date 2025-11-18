package com.example.demo.Service;

import com.example.demo.dto.ChannelDbDto;
import com.example.demo.dto.ChannelDto;
import com.example.demo.dto.YoutubeChannelDto;
import com.example.demo.mapper.YoutubeChannelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ChanelService {

    private final YoutubeChannelMapper mapper;

    public ChanelService(YoutubeChannelMapper mapper) {
        this.mapper = mapper;
    }

    @Transactional
    public void saveChannel(ChannelDto dto, Long memberId, String platformType) {

        // 기존 채널 조회
        ChannelDbDto existing = mapper.findByMemberIdAndPlatform(memberId, platformType);

        ChannelDbDto db = new ChannelDbDto();
        if (existing != null) {
            db.setChanelId(existing.getChanelId());  // UPDATE 대상 PK
        }
        db.setMemberId(memberId);
        db.setName(dto.getName());
        db.setSubs(dto.getSubs());
        db.setPlatformType(platformType);
        db.setChanelUrl(getPlatformUrl(platformType, dto.getHandle()));
        db.setViews(dto.getViews());
        db.setVideos(dto.getVideos());
        db.setStatus("Y");

        if (existing != null) {
            mapper.updateChannel(db);
        } else {
            mapper.insertChannel(db);
        }
    }

    private String getPlatformUrl(String platformType, String handle) {
        if ("YOUTUBE".equalsIgnoreCase(platformType)) {
            return "https://www.youtube.com/" + handle;
        } else if ("INSTAGRAM".equalsIgnoreCase(platformType)) {
            return "https://www.instagram.com/" + handle;
        } else {
            return "";
        }
    }

}
