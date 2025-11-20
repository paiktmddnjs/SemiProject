package com.kh.spring.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class WorkspaceMemberVo {
    private int workspaceMemberId;
    private int workspaceId;
    private int memberId;
    private String workspaceMemberRole;

    // JOIN해서 사용하는 필드
    private MemberVo memberVo;
    // MemberVo에 enrollDate가 있으므로, 이 필드는 더 이상 필요 없음
    // private Date enrollDate;
}
