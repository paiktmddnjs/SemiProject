package com.kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ContentController {

    @GetMapping("content")
    public String showYouTubeStats(Model model) {

        model.addAttribute("contentPage", "content");
        return "/components/layout";
    }
}
