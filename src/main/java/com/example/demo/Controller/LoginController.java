package com.example.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {



    @GetMapping("/login") // URL 매핑
    public String loginPage() {
        return "Login"; // /WEB-INF/views/Login.jsp 를 찾아서 렌더링
    }

    @GetMapping("/signup")
    public String signUpPage() {
        return "Sign_Up"; // /WEB-INF/views/Sign_Up.jsp
    }

    @GetMapping("/landing")
    public String landingPage() {
        return "Landing_Page"; // /WEB-INF/views/Landing_Page.jsp
    }

}