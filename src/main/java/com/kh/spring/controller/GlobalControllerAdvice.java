package com.kh.spring.controller;

import com.kh.spring.dto.MemberDto;
import com.kh.spring.service.RequestService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalControllerAdvice {

    @Autowired
    private RequestService requestService;

    @ModelAttribute("pendingRequestCount")
    public int addPendingRequestCount(HttpSession session) {
        MemberDto loginUser = (MemberDto) session.getAttribute("loginMember");
        if (loginUser != null) {
            return requestService.getPendingRequests(loginUser.getMemberId().intValue()).size();
        }
        return 0;
    }
}
