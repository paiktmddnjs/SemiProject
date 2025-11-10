package com.kh.spring.controller;

import com.kh.spring.model.vo.Finacial;
import com.kh.spring.service.FinacialService;
import org.apache.jasper.compiler.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;


@Controller
public class FinacialController {

    private final FinacialService finacialService;


    @Autowired
    public FinacialController(FinacialService finacialService) {

        this.finacialService = finacialService;

    }

    @GetMapping("asdsdfsf")
    public String selectAllFinacial(Model model) {

        Finacial finacialData = finacialService.selectAllFinacial();


        model.addAttribute("fd", finacialData);

        return "/components/layoutd"; // 포워드할 뷰 경로
    }


    @GetMapping("finacial")
    public String getDashboard(Model model) {

        // 1. 순이익 계산 (예: 40200000)
        int netProfit = (finacialService.calculateNetProfit() / 10000);
        int Profit = (finacialService.calculateProfit() / 10000);
        int Expense = (finacialService.calculateExpense() / 10000);
        double ProfitPercent = Math.round((double) netProfit / (double) Profit * 10000) / 100.0;


        // 3. 모델에 순이익 데이터 추가
        model.addAttribute("netProfitAmount", netProfit);
        model.addAttribute("ProfitAmount", Profit);
        model.addAttribute("ExpenseAmount", Expense);
        model.addAttribute("ProfitPercent", ProfitPercent);
        // (전월 대비 변화율 계산 로직은 생략함)
        model.addAttribute("netProfitChange", "+29.7% 전월 대비");

        return "/components/layout";
    }


    @PostMapping("insert.f")
    public String insertProfitFinacial(@ModelAttribute Finacial finacial, RedirectAttributes ra) {

        finacial.setFinacialType("수익");
        // ⭐ 필수: 실제 로그인된 사용자 ID를 설정 (예시: 세션에서 가져옴)
        finacial.setMemberId(1234); // 예

        int result = finacialService.insertProfitFinacial(finacial);

        if (result > 0) {
            ra.addFlashAttribute("alertMsg", "등록 성공!");
            return "redirect:/finacial";
        } else {
            ra.addFlashAttribute("alertMsg", "등록 실패");
            return "redirect:/finacial";
        }

    }


    @PostMapping("insert.e")
    public String insertExpenseFinacial(@ModelAttribute Finacial finacial, RedirectAttributes ra) {

        try {
            finacial.setFinacialType("지출");
            // ⭐ 필수: 실제 로그인된 사용자 ID를 설정 (예시: 세션에서 가져옴)
            finacial.setMemberId(1234); // 예

            int result = finacialService.insertExpenseFinacial(finacial);

            if (result > 0) {
                ra.addFlashAttribute("alertMsg", "등록 성공!");
                return "redirect:/finacial";
            } else {
                ra.addFlashAttribute("alertMsg", "등록 실패");
                return "redirect:/finacial";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/finacial";

    }

    @GetMapping("transaction.f")
    public String selectAllTransaction(Model model) {


        List<Finacial> transactionList = finacialService.selectAllTransaction();

        model.addAttribute("transactionList", transactionList);


        return "/MoneyControll";
    }

}