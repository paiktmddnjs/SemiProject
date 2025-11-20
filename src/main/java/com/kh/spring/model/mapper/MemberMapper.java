package com.kh.spring.model.mapper;

import com.kh.spring.model.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {

    // 회원 가입
    int addMember(Member member);

    // 이메일 중복 체크
    int getMemberCountByEmail(@Param("email") String email);

    // 이메일로 회원 조회
    Member getMemberByEmail(@Param("email") String email);


    // =============================
    // ▼ 마이페이지 기능
    // =============================

    /**
     * 회원정보 수정 (이름, 전화번호, 이메일 업데이트 공통)
     * null 값은 XML에서 <if> 조건으로 제외 처리
     */
    int updateMember(Member member);

    /**
     * 비밀번호 변경
     */
    int updateMemberPassword(@Param("memberId") int memberId,
                             @Param("memberPwd") String memberPwd);

    /**
     * 회원 탈퇴 (STATUS='N' 으로 soft delete)
     */
    int deleteMember(@Param("memberId") int memberId);
}
