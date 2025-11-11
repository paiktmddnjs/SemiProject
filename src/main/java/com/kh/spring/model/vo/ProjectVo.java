package com.kh.spring.model.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProjectVo {
    private int projectId;
    private int workspaceId;
    private String projectName;
    private String projectExplain;
}