package com.kh.spring.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class MemberVo {
    // Getters and Setters
    private int memberId;
    private String memberEmail;
    private String memberPassword;
    private String memberName;
    private String memberPhone;
    private Date memberEnrollDate;
    private Date modifyDate;
    private char memberStatus;
    private String memberRole;
}