package com.kh.spring.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;

/*
    HandlerInterceptor 인터페이스의 메서드 :
    1. preHandle() : 컨트롤러 실행 전에 수행(가장 기본적으로 사용하는 메서드).
    2. postHandle() : 컨트롤러 실행 후, 뷰가 렌더링 되기 전에 실행.
    3. afterCompletion() : 뷰 렌더링 후에 수행.
 */
@Slf4j
public class LoginCheckInterceptor implements HandlerInterceptor {
    //handler 요청의 목적지인 컨트롤러 정보
    // return type -> boolean : true(계속진행), false(요청처리 중단)


    }