package com.kh.spring.service;

import com.kh.spring.model.vo.Member;

public interface MemberService {

    /**
     * 회원 가입
     */
    int addMember(Member member);

    /**
     * 이메일 중복 체크
     */
    int getMemberCountByEmail(String email);

    /**
     * 이메일로 회원 조회 (로그인/세션 갱신 등에 사용)
     */
    Member getMemberByEmail(String email);


    // =========================
    // 마이페이지 관련
    // =========================

    /**
     * 프로필 수정 (이름, 전화번호 등)
     */
    int updateProfile(Member member);

    /**
     * 이메일 변경
     */
    int updateEmail(int memberId, String email);

    /**
     * 비밀번호 변경
     * @param memberId    비밀번호를 변경할 회원 번호 (int)
     * @param encPassword 암호화(Bcrypt)된 비밀번호
     */
    int updatePwd(int memberId, String encPassword);

    /**
     * 회원 탈퇴 (실제 삭제 or STATUS='N' 처리)
     * @param memberId 탈퇴 처리할 회원 번호
     */
    int deleteMember(int memberId);
}
