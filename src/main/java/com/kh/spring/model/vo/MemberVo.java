package com.kh.spring.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class MemberVo {
    private int memberId;
    private String email;
    private String memberPwd;
    private String memberName;
    private String phone;
    private Date enrollDate;
    private Date modifyDate;
    private String status;
    private String role;
    // private String memberProfileUrl; // 제거
}
