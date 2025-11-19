package com.kh.spring.Service;

import com.kh.spring.mapper.RequestMapper;
import com.kh.spring.model.dao.WorkspaceDao;
import com.kh.spring.model.mapper.MemberMapper;
import com.kh.spring.model.vo.Member;
import com.kh.spring.vo.RequestVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RequestService {

    private static final Logger log = LoggerFactory.getLogger(RequestService.class);

    @Autowired
    private RequestMapper requestMapper;

    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private WorkspaceDao workspaceDao;

    @Transactional
    public void sendInvite(int workspaceId, int senderId, String receiverEmail) {
        log.info("--- 초대 보내기 서비스 시작 ---");
        log.info("워크스페이스 ID: {}, 보내는 사람 ID: {}, 받는 사람 이메일: {}", workspaceId, senderId, receiverEmail);

        // 1. 이메일로 받는 사람의 정보를 조회
        log.info("1. 받는 사람 정보 조회 시작...");
        Member receiver = memberMapper.getMemberByEmail(receiverEmail);
        if (receiver == null) {
            log.warn("조회 실패: 존재하지 않는 사용자입니다. 이메일: {}", receiverEmail);
            throw new IllegalStateException("존재하지 않는 사용자입니다.");
        }
        int receiverId = receiver.getMemberId();
        log.info("조회 성공. 받는 사람 ID: {}", receiverId);

        // 2. 자기 자신을 초대하는지 확인
        log.info("2. 자기 자신 초대 여부 확인...");
        if (senderId == receiverId) {
            log.warn("확인 실패: 자기 자신을 초대할 수 없습니다.");
            throw new IllegalStateException("자기 자신을 초대할 수 없습니다.");
        }
        log.info("확인 성공: 자기 자신이 아님.");

        // 3. 이미 워크스페이스에 멤버인지 확인
        log.info("3. 기존 멤버 여부 확인...");
        if (workspaceDao.isMemberInWorkspace(workspaceId, receiverId)) {
            log.warn("확인 실패: 이미 워크스페이스에 참여하고 있는 멤버입니다.");
            throw new IllegalStateException("이미 워크스페이스에 참여하고 있는 멤버입니다.");
        }
        log.info("확인 성공: 기존 멤버가 아님.");

        // 4. 이미 보낸 초대인지 확인 (PENDING 상태)
        log.info("4. 보류 중인 초대 여부 확인...");
        if (requestMapper.countPendingRequest(workspaceId, senderId, receiverId) > 0) {
            log.warn("확인 실패: 이미 초대 요청을 보냈습니다.");
            throw new IllegalStateException("이미 초대 요청을 보냈습니다.");
        }
        log.info("확인 성공: 보류 중인 초대가 없음.");

        // 5. 초대 생성
        log.info("5. 초대 레코드 생성 시작...");
        RequestVo request = new RequestVo();
        request.setWorkspaceId(workspaceId);
        request.setSendMember(senderId);
        request.setFromMember(receiverId);
        int result = requestMapper.createRequest(request);
        
        if (result > 0) {
            log.info("생성 성공: REQUEST 테이블에 초대 기록이 성공적으로 추가되었습니다.");
        } else {
            log.error("생성 실패: REQUEST 테이블에 초대 기록 추가를 실패했습니다.");
            throw new RuntimeException("Database insert failed for request.");
        }
        log.info("--- 초대 보내기 서비스 종료 ---");
    }

    public List<RequestVo> getPendingRequests(int memberId) {
        return requestMapper.getPendingRequestsByMemberId(memberId);
    }

    @Transactional
    public void acceptRequest(int requestId, int memberId) {
        log.info("--- 초대 수락 서비스 시작 ---");
        log.info("요청 ID: {}, 수락자 ID: {}", requestId, memberId);

        // 1. 요청 정보 확인
        log.info("1. 요청 정보 조회 및 유효성 검사 시작...");
        RequestVo request = requestMapper.getRequestById(requestId);
        if (request == null) {
            log.warn("검사 실패: 존재하지 않는 요청입니다. requestId: {}", requestId);
            throw new IllegalStateException("유효하지 않은 요청입니다.");
        }
        if (request.getFromMember() != memberId) {
            log.warn("검사 실패: 초대받은 사용자가 아닙니다. 초대받은사람: {}, 요청자: {}", request.getFromMember(), memberId);
            throw new IllegalStateException("유효하지 않은 요청입니다.");
        }
        if (!"PENDING".equals(request.getRequestStatus())) {
            log.warn("검사 실패: 이미 처리된 요청입니다. 현재상태: {}", request.getRequestStatus());
            throw new IllegalStateException("유효하지 않은 요청입니다.");
        }
        log.info("검사 성공: 유효한 요청입니다.");

        // 2. 요청 상태를 'ACCEPTED'로 변경
        log.info("2. 요청 상태 'ACCEPTED'로 변경 시작...");
        int updateResult = requestMapper.updateRequestStatus(requestId, "ACCEPTED");
        if (updateResult == 0) {
            log.error("상태 변경 실패: update 결과가 0입니다.");
            throw new RuntimeException("Failed to update request status.");
        }
        log.info("상태 변경 성공.");

        // 3. 워크스페이스에 멤버 추가 (기본 역할: VIEWER)
        log.info("3. 워크스페이스 멤버 추가 시작... 워크스페이스 ID: {}", request.getWorkspaceId());
        int addResult = workspaceDao.addWorkspaceMember(request.getWorkspaceId(), memberId, "VIEWER");
        if (addResult == 0) {
            log.error("멤버 추가 실패: insert 결과가 0입니다.");
            throw new RuntimeException("Failed to add member to workspace.");
        }
        log.info("멤버 추가 성공.");
        log.info("--- 초대 수락 서비스 종료 ---");
    }

    @Transactional
    public void rejectRequest(int requestId, int memberId) {
        // 1. 요청 정보 확인
        RequestVo request = requestMapper.getRequestById(requestId);
        if (request == null || request.getFromMember() != memberId || !"PENDING".equals(request.getRequestStatus())) {
            throw new IllegalStateException("유효하지 않은 요청입니다.");
        }

        // 2. 요청 상태를 'REJECTED'로 변경
        requestMapper.updateRequestStatus(requestId, "REJECTED");
    }
}
