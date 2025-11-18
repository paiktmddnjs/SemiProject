package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

/**
 * Member MyBatis Mapper
 */
@Mapper
public interface ChzzkMemberMapper {
    
    /**
     * 기본 테스트 회원 ID 조회 (없으면 null)
     */
    Long findDefaultMemberId();
    
    /**
     * 기본 테스트 회원 생성
     */
    void insertDefaultMember();
}

