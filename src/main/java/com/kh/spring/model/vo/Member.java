package com.kh.spring.model.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Member {
    private int memberId;
    private String email;
    private String memberPwd;
    private String memberName;
    private String phone;
    private Date enrollDate;
    private Date modifyDate;
    private String status;
    private String role;

    public static Member insertCreateMember(String email,
                                            String userPwd,
                                            String userName,
                                            String phone) {
        Member m = new Member();
        m.setEmail(email);
        m.setMemberPwd(userPwd);
        m.setMemberName(userName);
        m.setPhone(phone);
        return m;
    }

    public static Member updateCreateMember(String email,
                                            String phone,
                                            String userName) {
        Member m = new Member();
        m.setEmail(email);
        m.setPhone(phone);
        m.setMemberName(userName);
        return m;
    }
}
