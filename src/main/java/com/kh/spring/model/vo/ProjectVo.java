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
    private String projectMemo; // projectExplain -> projectMemo
    private double projectProgress; // NUMBER는 double 또는 int로 처리
}
