package com.kh.spring.dto;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class InstagramChannelDto implements ChannelDto{
    private String name;     // 채널 이름
    private String handle;   // 계정 핸들
    private long followers;  // 팔로워 수
    private long views;      // 조회수 (Instagram API에서는 없음 → 0)
    private int mediaCount;  // 게시물 수



    @Override
    public Long getSubs() {
        return this.followers;
    }
    public int getPosts() {
        return this.mediaCount;
    }

    public Long getViews() {
        return this.views;  // long → Long 자동 박싱
    }
    @Override
    public Long getVideos() {
        return (long) this.mediaCount;
    }

}

