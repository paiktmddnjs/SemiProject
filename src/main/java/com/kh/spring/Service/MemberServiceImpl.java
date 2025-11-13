package com.kh.spring.Service;

import com.kh.spring.model.mapper.MemberMapper;
import com.kh.spring.model.vo.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service //@Component보다 더 구체화해서 service객체에 알맞게 bean등록
public class MemberServiceImpl implements MemberService {
    private final MemberMapper memberMapper;

    @Override
    public int addMember(Member member) {

        return memberMapper.addMember(member);
    }
}
