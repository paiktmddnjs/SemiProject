package com.kh.spring.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class ProjectVo {
    private int projectId;
    private int workspaceId;
    private String projectName;
    private String projectStatus;
    private Date projectStart;
    private Date projectDeadline;
    private String projectTime;
    private String projectType;
    private String projectMemo;
    private double projectProgress;
    
    // JOIN해서 사용하는 채널의 플랫폼 타입
    private String channelPlatformType;
}
