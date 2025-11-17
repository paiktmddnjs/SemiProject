package com.kh.spring.dto;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto {
    private Long memberId;
    private String email;
    private String memberPwd;
    private String memberName;
    private String phone;
    private LocalDateTime enrollDate;
    private LocalDateTime modifyDate;
    private String status;
    private String role;
}
