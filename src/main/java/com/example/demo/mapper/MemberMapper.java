package com.example.demo.mapper;


import com.example.demo.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    void insertMember(MemberDto member);
}
