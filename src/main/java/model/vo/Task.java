package model.vo;

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
}
