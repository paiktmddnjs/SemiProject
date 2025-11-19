package com.kh.spring.model.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Task {
    private int taskId;
    private int projectId;
    private int workspaceMemberId;
    private String taskName;
    private String taskAssign;
    private String taskStatus;
    private String taskStart;
    private String taskDeadline;

    private String workspaceName; //전달용 콘드
    private String projectName; //전달용 코드
}