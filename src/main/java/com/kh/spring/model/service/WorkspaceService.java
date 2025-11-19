package com.kh.spring.model.service;

import com.kh.spring.model.vo.ChannelVo;
import com.kh.spring.model.vo.WorkspaceMemberVo;
import com.kh.spring.model.vo.WorkspaceVo;

import java.util.List;
import java.util.Map;

public interface WorkspaceService {
    Map<String, Object> getWorkspacePageData(int memberId);
    List<ChannelVo> getAllChannels();
    void createWorkspaceAndAddMember(WorkspaceVo workspace, int memberId);
    void removeMember(int workspaceId, int memberToRemoveId, int currentUserId);
    void updateMemberRole(int workspaceId, int memberToUpdateId, String newRole, int currentUserId);
    WorkspaceVo getWorkspaceById(int workspaceId);
    int updateWorkspace(WorkspaceVo workspace);
    int updateWorkspaceStatus(int workspaceId);
    List<WorkspaceMemberVo> getWorkspaceMembers(int workspaceId, String searchQuery); // 추가
}
