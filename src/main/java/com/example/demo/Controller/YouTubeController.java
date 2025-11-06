package com.example.demo.Controller;


import com.example.demo.Service.YouTubeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.json.JSONObject;

@Controller
public class YouTubeController {

    @Autowired
    private YouTubeService youtubeService;

    @GetMapping("/youtubeStats")
    public String showYouTubeStats(Model model) {
        JSONObject stats = youtubeService.getChannelStats();
        model.addAttribute("viewCount", stats.getString("viewCount"));
        model.addAttribute("subscriberCount", stats.getString("subscriberCount"));
        model.addAttribute("videoCount", stats.getString("videoCount"));
        return "youtubeStats"; // → youtubeStats.jsp
    }
}

