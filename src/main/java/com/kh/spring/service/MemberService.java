package com.kh.spring.service;

import com.kh.spring.model.vo.Member;

public interface MemberService {
    int addMember(Member member);
    int getMemberCountByEmail(String email);
    Member getMemberByEmail(String email);
}
