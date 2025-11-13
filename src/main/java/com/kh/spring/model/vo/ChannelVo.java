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
    private long platformSubscribe; // NUMBER는 long으로 처리
    private String channelStatus;
    private Date channelCreate;
    private String channelUrl;
    private String channelCount;
}
