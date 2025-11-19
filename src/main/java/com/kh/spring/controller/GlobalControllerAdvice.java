package com.kh.spring.controller;

import com.kh.spring.Service.RequestService;
import com.kh.spring.model.vo.Member;
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
        Member loginUser = (Member) session.getAttribute("loginMember");
        if (loginUser != null) {
            return requestService.getPendingRequests(loginUser.getMemberId()).size();
        }
        return 0;
    }
}
