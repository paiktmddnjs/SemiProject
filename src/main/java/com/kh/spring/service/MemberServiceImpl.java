package com.kh.spring.service;

import com.kh.spring.model.mapper.MemberMapper;
import com.kh.spring.model.vo.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;

    @Override
    public int addMember(Member member) {
        // XML: <insert id="addMember" ...>
        return memberMapper.addMember(member);
    }

    @Override
    public int getMemberCountByEmail(String email) {
        // XML: <select id="getMemberCountByEmail" ...>
        return memberMapper.getMemberCountByEmail(email);
    }

    @Override
    public Member getMemberByEmail(String email) {
        // XML: <select id="getMemberByEmail" ...>
        return memberMapper.getMemberByEmail(email);
    }

    /* =========================
       마이페이지 관련
       ========================= */

    @Override
    public int updateProfile(Member member) {
        // 이름 / 전화번호 수정 등에 사용
        // XML: <update id="updateMember" ...>
        return memberMapper.updateMember(member);
    }

    @Override
    public int updateEmail(int memberId, String email) {
        // 이메일만 바꿀 때도 updateMember 재사용
        Member m = new Member();
        m.setMemberId(memberId);
        m.setEmail(email);
        return memberMapper.updateMember(m);
    }

    @Override
    public int updatePwd(int memberId, String encPassword) {
        // XML: <update id="updateMemberPassword" ...>
        return memberMapper.updateMemberPassword(memberId, encPassword);
    }

    @Override
    public int deleteMember(int memberId) {
        // XML: <update id="deleteMember" ...>
        return memberMapper.deleteMember(memberId);
    }
}
