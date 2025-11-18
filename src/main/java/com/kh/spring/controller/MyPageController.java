package com.kh.spring.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

    @GetMapping
    public String mypage() {
        return "mypage";
    }

    @PostMapping("/checkPassword")
    public ResponseEntity<Map<String, Object>> checkPassword(@RequestBody Map<String, String> request, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        String password = request.get("password");
        
        // 세션에서 로그인한 사용자 정보 가져오기
        Object loginMember = session.getAttribute("loginMember");
        
//        if (loginMember == null) {
//            response.put("success", false);
//            response.put("message", "로그인이 필요합니다.");
//            return ResponseEntity.ok(response);
//        }
        
        // TODO: 실제 비밀번호 확인 로직 구현
        // 현재는 임시로 비밀번호가 비어있지 않으면 성공으로 처리
        // 실제로는 DB에서 사용자 비밀번호를 조회하여 비교해야 합니다
        
        if (password == null || password.trim().isEmpty()) {
            response.put("success", false);
            response.put("message", "비밀번호를 입력해주세요.");
        } else {
            // 임시: 비밀번호 확인 성공 (실제로는 DB에서 확인 필요)
            response.put("success", true);
            response.put("message", "비밀번호가 확인되었습니다.");
        }
        
        return ResponseEntity.ok(response);
    }
}

