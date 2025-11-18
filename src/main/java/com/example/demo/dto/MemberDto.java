package com.example.demo.dto;

import java.time.LocalDateTime;

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

    // 기본 생성자
    public MemberDto() {}

    // Getter & Setter
    public Long getMemberId() { return memberId; }
    public void setMemberId(Long memberId) { this.memberId = memberId; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMemberPwd() { return memberPwd; }
    public void setMemberPwd(String memberPwd) { this.memberPwd = memberPwd; }

    public String getMemberName() { return memberName; }
    public void setMemberName(String memberName) { this.memberName = memberName; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public LocalDateTime getEnrollDate() { return enrollDate; }
    public void setEnrollDate(LocalDateTime enrollDate) { this.enrollDate = enrollDate; }

    public LocalDateTime getModifyDate() { return modifyDate; }
    public void setModifyDate(LocalDateTime modifyDate) { this.modifyDate = modifyDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}
