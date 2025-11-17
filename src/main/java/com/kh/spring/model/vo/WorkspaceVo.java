package com.kh.spring.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class WorkspaceVo {
    private int workspaceId;
    private int channelId;
    private String workspaceName;
    private String workspaceExplain;
    private Date enrollDate;
    private String workspaceStatus;

    // JOIN해서 사용하는 필드
    private String channelName;
    // private String channelProfileUrl; // 제거

    // COUNT해서 사용하는 필드
    private int projectCount;
    private int memberCount;
}
