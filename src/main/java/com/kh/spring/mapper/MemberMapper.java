package com.kh.spring.mapper;


import com.kh.spring.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {
    void insertMember(MemberDto member);
    
    // 로그인: 이메일과 비밀번호로 회원 조회
    MemberDto selectMemberByEmailAndPassword(@Param("email") String email, @Param("memberPwd") String memberPwd);
    
    // 이메일 중복 체크
    MemberDto selectMemberByEmail(@Param("email") String email);
}
