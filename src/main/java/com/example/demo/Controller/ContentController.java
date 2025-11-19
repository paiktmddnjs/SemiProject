package com.example.demo.Controller;


import com.example.demo.Service.ContentService;

import com.example.demo.model.vo.Categorical;
import com.example.demo.model.vo.Content;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


@Controller
public class ContentController {

    private final ContentService contentService;


    @Autowired
    public ContentController(ContentService contentService) {

        this.contentService = contentService;

    }


    @GetMapping("content")
    public String getContentboard(
            jakarta.servlet.http.HttpSession session,
            Model model
    ) {


        Integer chanelId = (Integer) session.getAttribute("chanelId");

        //예시로 만든것
        chanelId = 101;

        int ContentCount = contentService.selectCountContent(chanelId);
        int ViewCount = contentService.selectCountView(chanelId);
        double AvergeLikeCount = contentService.selectCountLike(chanelId);
        int AvergeViewCount = contentService.selectCountAvergeView(chanelId);
        System.out.println("AvergeLikeCount: " + AvergeLikeCount);

        model.addAttribute("ContentCount", ContentCount);
        model.addAttribute("ViewCount", ViewCount);
        model.addAttribute("AvergeLikeCount", AvergeLikeCount);
        model.addAttribute("AvergeViewCount", AvergeViewCount);

        List<Categorical> CategoricalContentList = contentService.selectContentByCategory(chanelId);
        List<Categorical> CategoricalViewsList = contentService.selectViewByCategory(chanelId);
        List<Categorical> CategoricalDetailList = contentService.selectDetailByCategory(chanelId);

        int totalViews = 0;
        for (Categorical categorical : CategoricalViewsList) {
            totalViews += categorical.getViewByCategroy();
        }


        List<Double> percentList = new ArrayList<>();
        for (Categorical item : CategoricalViewsList) {
            double percent = ((double) item.getViewByCategroy() * 100) / (double) totalViews;
            percentList.add(percent);
        }


        List<Content> contentList2 = contentService.selectContent(chanelId);


        model.addAttribute("CategoricalContentList", CategoricalContentList);
        model.addAttribute("CategoricalViewsList", CategoricalViewsList);
        model.addAttribute("CategoricalDetailList", CategoricalDetailList);
        model.addAttribute("percentList", percentList);
        model.addAttribute("contentList2", contentList2);

        return "/components/layout";
    }

    @PostMapping("insert.c")
    public String insertProfitFinancial(@ModelAttribute Content content, RedirectAttributes ra,
                                        HttpSession session) {


        // ⭐ 필수: 실제 로그인된 사용자 ID를 설정 (예시: 세션에서 가져옴)
        Integer chanelId = (Integer) session.getAttribute("chanelId");

        try {
            contentService.insertContent(content, chanelId); // <- 인스턴스 메서드 호출
            ra.addFlashAttribute("msg", "콘텐츠가 성공적으로 등록되었습니다.");
        } catch (Exception e) {
            ra.addFlashAttribute("msg", "콘텐츠 등록에 실패했습니다.");
        }
        return "redirect:/financial";
    }



}