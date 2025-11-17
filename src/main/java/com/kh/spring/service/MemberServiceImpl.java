package com.kh.spring.service;


import com.kh.spring.dto.MemberDto;
import com.kh.spring.mapper.MemberMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;

    public MemberServiceImpl(MemberMapper memberMapper) {
        this.memberMapper = memberMapper;
    }

    @Override
    @Transactional
    public void registerMember(MemberDto member) {
        member.setStatus("Y"); // 기본 상태 (DB 스키마에 맞게 'Y'로 설정)
        member.setRole("USER");     // 기본 권한
        memberMapper.insertMember(member);
    }

    @Override
    public MemberDto login(String email, String memberPwd) {
        return memberMapper.selectMemberByEmailAndPassword(email, memberPwd);
    }

    @Override
    public boolean isEmailExists(String email) {
        MemberDto member = memberMapper.selectMemberByEmail(email);
        return member != null;
    }
}
