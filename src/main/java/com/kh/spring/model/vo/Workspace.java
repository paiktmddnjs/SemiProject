package com.kh.spring.model.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Workspace {
    private int workspaceId;
    private int chanelId;
    private String workspaceName;
    private String workspaceExplain;
    private String enrollDate;
}
