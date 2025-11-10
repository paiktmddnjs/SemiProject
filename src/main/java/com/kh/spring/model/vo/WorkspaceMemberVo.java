package com.kh.spring.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class WorkspaceMemberVo {
    // Getters and Setters
    private int workspaceMemberId;
    private int workspaceId;
    private int memberId;
    private String workspaceMemberRole;

}