package com.kh.spring.model.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Project {
    private int projectId;
    private int workspaceId;
    private String projectName;
    private String projectStatus;
    private String projectStart;
    private String projectDeadline;
    private String projectTime;
    private String projectType;
    private String projectMemo;
    private int projectProgress;
}
