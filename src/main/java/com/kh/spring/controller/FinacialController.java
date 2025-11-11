package com.kh.spring.controller;

import com.kh.spring.model.vo.Finacial;
import com.kh.spring.service.FinacialService;
import org.apache.jasper.compiler.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;


@Controller
public class FinacialController {

    private final FinacialService finacialService;


    @Autowired
    public FinacialController(FinacialService finacialService) {

        this.finacialService = finacialService;

    }


    @GetMapping("finacial")
    public String getFinancialboard(@RequestParam(value="page", defaultValue="1") int currentPage,
                                    @RequestParam(value="tab", defaultValue="overview") String currentTabKey,// 페이지 번호 받기
                                    Model model) {

        // ... (순이익, 총수익, 총지출 계산 로직 생략) ...

        // 🚨 페이지네이션 로직 호출

        // 1. 순이익 계산 (예: 40200000)
        int netProfit = (finacialService.calculateNetProfit() / 10000);
        int Profit = (finacialService.calculateProfit() / 10000);
        int Expense = (finacialService.calculateExpense() / 10000);
        double ProfitPercent = Math.round((double) netProfit / (double) Profit * 10000) / 100.0;


        Map<String, Object> transactionData = finacialService.selectAllTransaction(currentPage);


        // 3. 모델에 순이익 데이터 추가 , 게약관리 조회
        model.addAttribute("transactionList", transactionData.get("transactionList"));
        model.addAttribute("pageInfo", transactionData.get("pageInfo")); // PageInfo 객체 전달
        model.addAttribute("currentTabKey", currentTabKey);
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


}