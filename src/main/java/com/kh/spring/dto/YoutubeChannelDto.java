package com.kh.spring.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class YoutubeChannelDto implements ChannelDto {  // ← 추가
    private Long chanelId;
    private int memberId;

    private String name;
    private String handle;
    private Long subs;
    private Long views;
    private Long videos;

    private String platformType = "YOUTUBE";
    private String chanelStatus;
    private String chanelUrl;
    private String chanelCount;
    private String chanelFollower;



    @Override
    public Long getSubs() {
        return this.subs;
    }

    @Override
    public Long getVideos() {
        return this.videos;
    }

    @Override
    public String getName() {
        return this.name;
    }

    @Override
    public String getHandle() {
        return this.handle;
    }
}
