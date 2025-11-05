package com.kh.spring.controlloer.board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.IOException;

@Controller
public class ScheduleController {

    // GET 요청 처리
    @GetMapping("/schedule.bo")
    public String showSchedule() {
        // views/board/schedule.jsp로 포워딩
        return "board/schedule";
    }

    // POST 요청 처리
    @PostMapping("/schedule.bo")
    public String handleSchedulePost() {
        // POST 요청도 동일하게 JSP 보여주기
        return "board/schedule";
    }
}
