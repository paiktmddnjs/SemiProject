package com.kh.spring.model.service;

import com.kh.spring.model.dao.ChannelDAO;
import com.kh.spring.model.dao.WorkspaceDao;
import com.kh.spring.model.vo.ChannelVo;
import com.kh.spring.model.vo.WorkspaceVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; // import 추가

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class WorkspaceService {

    @Autowired
    private WorkspaceDao workspaceDao;

    @Autowired
    private ChannelDAO channelDao;

    public Map<String, Object> getWorkspacePageData() {
        Map<String, Object> result = new HashMap<>();
        List<WorkspaceVo> workspaceList = workspaceDao.getAllWorkspaces();

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
    public int createWorkspace(WorkspaceVo workspace) {
        return workspaceDao.insertWorkspace(workspace);
    }

    public WorkspaceVo getWorkspaceById(int workspaceId) {
        return workspaceDao.getWorkspaceById(workspaceId);
    }

    @Transactional
    public int updateWorkspace(WorkspaceVo workspace) {
        return workspaceDao.updateWorkspace(workspace);
    }
}
