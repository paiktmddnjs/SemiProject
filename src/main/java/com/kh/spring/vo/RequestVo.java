package com.kh.spring.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RequestVo {
    private int requestId;
    private int workspaceId;
    private int sendMember;
    private int fromMember;
    private String requestStatus;

    // JOIN해서 사용하는 필드
    private String workspaceName;
    private String senderName;
}
