package com.example.demo.Service;


import com.example.demo.dto.MemberDto;
import com.example.demo.mapper.MemberMapper;
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
        member.setStatus("ACTIVE"); // 기본 상태
        member.setRole("USER");     // 기본 권한
        memberMapper.insertMember(member);
    }
}
