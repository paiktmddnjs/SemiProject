package com.kh.spring.model.service;

import com.kh.spring.model.dao.ChannelDAO;
import com.kh.spring.model.dao.WorkspaceDao;
import com.kh.spring.model.vo.ChannelVo;
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

@Service
public class WorkspaceService {

    private static final Logger log = LoggerFactory.getLogger(WorkspaceService.class);

    @Autowired
    private WorkspaceDao workspaceDao;

    @Autowired
    private ChannelDAO channelDao;

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

    public List<ChannelVo> getAllChannels() {
        return channelDao.getAllChannels();
    }

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

    public WorkspaceVo getWorkspaceById(int workspaceId) {
        return workspaceDao.getWorkspaceById(workspaceId);
    }

    @Transactional
    public int updateWorkspace(WorkspaceVo workspace) {
        return workspaceDao.updateWorkspace(workspace);
    }

    @Transactional
    public int updateWorkspaceStatus(int workspaceId) {
        return workspaceDao.updateWorkspaceStatus(workspaceId);
    }
}
