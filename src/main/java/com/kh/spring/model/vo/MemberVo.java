package com.kh.spring.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class MemberVo {
    private int memberId;
    private String email; // email로 변경
    private String memberPwd; // memberPassword -> memberPwd
    private String memberName;
    private String phone; // memberPhone -> phone
    private Date enrollDate; // memberEnrollDate -> enrollDate
    private Date modifyDate;
    private String status; // char -> String
    private String role; // memberRole -> role
}
