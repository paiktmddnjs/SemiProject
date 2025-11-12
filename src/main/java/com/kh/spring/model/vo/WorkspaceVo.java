package com.kh.spring.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Setter
@Getter
public class WorkspaceVo {
    // Getters and Setters
    private int workspaceId;
    private int channelId;
    private String workspaceName;
    private String workspaceExplain;
    private Date enrollDate;

    // JOIN을 통해 가져올 필드 추가
    private String channelName;


}
