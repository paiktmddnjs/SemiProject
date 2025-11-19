package com.kh.spring.mapper;

import com.kh.spring.vo.RequestVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RequestMapper {
    int createRequest(RequestVo request);
    int countPendingRequest(@Param("workspaceId") int workspaceId, @Param("senderId") int senderId, @Param("receiverId") int receiverId);
    List<RequestVo> getPendingRequestsByMemberId(int memberId);
    RequestVo getRequestById(int requestId);
    int updateRequestStatus(@Param("requestId") int requestId, @Param("status") String status);
}
