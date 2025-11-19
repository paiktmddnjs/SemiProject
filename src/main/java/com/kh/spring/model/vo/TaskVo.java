package com.kh.spring.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class TaskVo {
    private int taskId;
    private int projectId;
    private int workspaceMemberId;
    private String taskName;
    private String taskAssign; // 요구사항
    private String taskStatus;
    private Date taskStart;
    private Date taskDeadline;

    // JOIN해서 사용하는 필드
    private WorkspaceMemberVo workspaceMember;
}
