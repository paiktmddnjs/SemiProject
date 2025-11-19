package com.kh.spring.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class ChannelVo {
    private int channelId;
    private int memberId;
    private String channelName;
    private String platformType;
    private long platformSubscribe;
    private String channelStatus;
    private Date channelCreate;
    private String channelUrl;
    private String channelCount;
    private String channelProfileUrl; // 채널 프로필 이미지 URL 필드 추가
}
