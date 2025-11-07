package com.kh.spring.controller;

import com.kh.spring.model.vo.Finacial;
import com.kh.spring.service.FinacialService;
import org.apache.jasper.compiler.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class FinacialController {

    private final FinacialService finacialService;


    @Autowired
    public FinacialController(FinacialService finacialService) {

        this.finacialService = finacialService;

    }

    @GetMapping( "asdsdfsf")
    public String selectAllFinacial(Model model) {

        Finacial finacialData = finacialService.selectAllFinacial();


        model.addAttribute("fd", finacialData);

        return "/components/layoutd"; // 포워드할 뷰 경로
    }


    @GetMapping("finacial")
    public String getDashboard(Model model) {

        // 1. 순이익 계산 (예: 40200000)
        int netProfit = (finacialService.calculateNetProfit()/10000);
        int Profit = (finacialService.calculateProfit()/10000);
        int Expense = (finacialService.calculateExpense()/10000);
        double ProfitPercent = Math.round((double)netProfit/(double)Profit * 10000) / 100.0;




        // 3. 모델에 순이익 데이터 추가
        model.addAttribute("netProfitAmount", netProfit);
        model.addAttribute("ProfitAmount",Profit);
        model.addAttribute("ExpenseAmount", Expense);
        model.addAttribute("ProfitPercent", ProfitPercent);
        // (전월 대비 변화율 계산 로직은 생략함)
        model.addAttribute("netProfitChange", "+29.7% 전월 대비");

        return "/components/layout";
    }

}
