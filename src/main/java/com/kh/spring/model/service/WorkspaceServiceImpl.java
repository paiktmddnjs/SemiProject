package com.kh.spring.model.service;

import com.kh.spring.model.dao.ChannelDAO;
import com.kh.spring.model.dao.WorkspaceDao;
import com.kh.spring.model.vo.ChannelVo;
import com.kh.spring.model.vo.WorkspaceMemberVo;
import com.kh.spring.model.vo.WorkspaceVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service
public class WorkspaceServiceImpl implements WorkspaceService {

    private static final Logger log = LoggerFactory.getLogger(WorkspaceServiceImpl.class);

    @Autowired
    private WorkspaceDao workspaceDao;

    @Autowired
    private ChannelDAO channelDao;

    @Override
    public Map<String, Object> getWorkspacePageData(int memberId) {
        Map<String, Object> result = new HashMap<>();
        List<WorkspaceVo> workspaceList = workspaceDao.getWorkspacesByMemberId(memberId);

        Map<Integer, ChannelVo> uniqueChannelMap = new LinkedHashMap<>();
        for (WorkspaceVo ws : workspaceList) {
            if (!uniqueChannelMap.containsKey(ws.getChannelId())) {
                ChannelVo channel = new ChannelVo();
                channel.setChannelId(ws.getChannelId());
                channel.setChannelName(ws.getChannelName());
                uniqueChannelMap.put(ws.getChannelId(), channel);
            }
        }

        result.put("workspaces", workspaceList);
        result.put("channels", new ArrayList<>(uniqueChannelMap.values()));
        return result;
    }

    @Override
    public List<ChannelVo> getAllChannels() {
        return channelDao.getAllChannels();
    }

    @Override
    @Transactional
    public void createWorkspaceAndAddMember(WorkspaceVo workspace, int memberId) {
        log.info("워크스페이스 생성 및 멤버 추가 시작. memberId: {}", memberId);
        log.debug("전달된 WorkspaceVo: {}", workspace);

        // 1. 워크스페이스 생성
        workspaceDao.insertWorkspace(workspace);
        int workspaceId = workspace.getWorkspaceId();
        log.info("워크스페이스 생성 완료. 생성된 workspaceId: {}", workspaceId);

        if (workspaceId == 0) {
            log.error("DAO에서 workspaceId를 제대로 반환하지 못했습니다. 트랜잭션을 롤백합니다.");
            throw new IllegalStateException("Failed to retrieve workspaceId after insert.");
        }

        // 2. 생성자를 관리자로 멤버 추가
        log.info("워크스페이스 멤버 추가 시작. workspaceId: {}, memberId: {}, role: ADMIN", workspaceId, memberId);
        workspaceDao.addWorkspaceMember(workspaceId, memberId, "ADMIN");
        log.info("워크스페이스 멤버 추가 완료.");
    }

    @Override
    @Transactional
    public void removeMember(int workspaceId, int memberToRemoveId, int currentUserId) {
        // 1. 요청한 사용자의 권한 확인
        WorkspaceMemberVo currentUser = workspaceDao.findWorkspaceMember(workspaceId, currentUserId);
        if (currentUser == null || !"ADMIN".equals(currentUser.getWorkspaceMemberRole())) {
            throw new IllegalStateException("멤버를 추방할 권한이 없습니다.");
        }

        // 2. 자기 자신을 추방하는지 확인
        if (memberToRemoveId == currentUserId) {
            throw new IllegalStateException("자기 자신을 추방할 수 없습니다.");
        }

        // 3. 멤버 삭제
        int result = workspaceDao.removeMember(workspaceId, memberToRemoveId);
        if (result == 0) {
            throw new IllegalStateException("추방할 멤버를 찾을 수 없거나, 작업에 실패했습니다.");
        }
    }

    @Override
    @Transactional
    public void updateMemberRole(int workspaceId, int memberToUpdateId, String newRole, int currentUserId) {
        // 1. 요청한 사용자의 권한 확인
        WorkspaceMemberVo currentUser = workspaceDao.findWorkspaceMember(workspaceId, currentUserId);
        if (currentUser == null || !"ADMIN".equals(currentUser.getWorkspaceMemberRole())) {
            throw new IllegalStateException("역할을 변경할 권한이 없습니다.");
        }

        // 2. 대상 멤버 정보 확인
        WorkspaceMemberVo targetMember = workspaceDao.findWorkspaceMember(workspaceId, memberToUpdateId);
        if (targetMember == null) {
            throw new IllegalStateException("역할을 변경할 멤버를 찾을 수 없습니다.");
        }

        // 3. 관리자 역할 변경 시도 방지
        if ("ADMIN".equals(targetMember.getWorkspaceMemberRole())) {
            throw new IllegalStateException("관리자의 역할은 변경할 수 없습니다.");
        }
        
        // 4. 새로운 역할이 유효한지 확인 (선택적)
        if (!Objects.equals(newRole, "EDITOR") && !Objects.equals(newRole, "VIEWER")) {
            throw new IllegalStateException("유효하지 않은 역할입니다.");
        }

        // 5. 역할 변경
        int result = workspaceDao.updateMemberRole(workspaceId, memberToUpdateId, newRole);
        if (result == 0) {
            throw new IllegalStateException("역할 변경에 실패했습니다.");
        }
    }

    @Override
    public WorkspaceVo getWorkspaceById(int workspaceId) {
        return workspaceDao.getWorkspaceById(workspaceId);
    }

    @Override
    @Transactional
    public int updateWorkspace(WorkspaceVo workspace) {
        return workspaceDao.updateWorkspace(workspace);
    }

    @Override
    @Transactional
    public int updateWorkspaceStatus(int workspaceId) {
        return workspaceDao.updateWorkspaceStatus(workspaceId);
    }

    @Override
    public List<WorkspaceMemberVo> getWorkspaceMembers(int workspaceId, String searchQuery) {
        log.debug("WorkspaceService.getWorkspaceMembers - workspaceId: {}, searchQuery: {}", workspaceId, searchQuery); // 로그 추가
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("workspaceId", workspaceId);
        paramMap.put("searchQuery", searchQuery);
        return workspaceDao.getWorkspaceMembersWithSearch(paramMap);
    }
}
