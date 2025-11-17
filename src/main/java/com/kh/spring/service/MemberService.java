package com.kh.spring.service;


import com.kh.spring.dto.MemberDto;

public interface MemberService {
    void registerMember(MemberDto member);
    
    // 로그인: 이메일과 비밀번호로 회원 조회
    MemberDto login(String email, String memberPwd);
    
    // 이메일 중복 체크
    boolean isEmailExists(String email);
}

