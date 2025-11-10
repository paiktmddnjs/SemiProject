package model.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class WorkspaceMember {
    private int workspaceMemberId;
    private int workspaceId;
    private int memberId;
    private String workspaceMemberRole;
}
