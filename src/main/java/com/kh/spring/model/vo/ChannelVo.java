package com.kh.spring.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class ChannelVo {
    // Getters and Setters
    private int channelId;
    private int memberId;
    private String channelName;
    private String platformType;
    private int channelSubscribe;
    private String channelStatus;
    private Date channelCreateDate;
    private String channelUrl;
    private int channelContentCount;
}