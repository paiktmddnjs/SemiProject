package com.kh.spring.model.service;

import com.kh.spring.model.dao.WorkspaceDao;
import com.kh.spring.model.vo.MemberVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberService {

    @Autowired
    private WorkspaceDao workspaceDao;

    /**
     * 워크스페이스에 멤버를 초대하는 비즈니스 로직
     * @param workspaceId 워크스페이스 ID
     * @param email 초대할 멤버의 이메일
     * @param role 멤버 역할
     * @return 처리 결과 메시지
     * @throws Exception 멤버가 없거나, 이미 존재하거나, DB 오류 발생 시 예외 발생
     */
    @Transactional // 여러 DB 작업을 하나의 트랜잭션으로 묶음
    public String inviteMemberToWorkspace(int workspaceId, String email, String role) throws Exception {
        // 1. 이메일로 멤버 조회
        MemberVo member = workspaceDao.getMemberByEmail(email);
        if (member == null) {
            throw new Exception("해당 이메일의 멤버를 찾을 수 없습니다.");
        }

        // 2. 이미 워크스페이스에 존재하는지 확인
        if (workspaceDao.isMemberInWorkspace(workspaceId, member.getMemberId())) {
            throw new Exception("이미 워크스페이스에 추가된 멤버입니다.");
        }

        // 3. 워크스페이스에 멤버 추가
        int result = workspaceDao.addWorkspaceMember(workspaceId, member.getMemberId(), role);

        if (result > 0) {
            return member.getMemberName() + "님을 워크스페이스에 초대했습니다.";
        } else {
            throw new Exception("멤버 초대 중 알 수 없는 오류가 발생했습니다.");
        }
    }
}
