package com.kh.spring.controller;

import com.kh.spring.model.vo.Financial;
import com.kh.spring.model.vo.Monthly;
import com.kh.spring.service.FinancialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;


@Controller
public class FinancialController {

    private final FinancialService financialService;


    @Autowired
    public FinancialController(FinancialService financialService) {

        this.financialService = financialService;

    }


    @GetMapping("financial")
    public String getFinancialboard(@RequestParam(value="page", defaultValue="1") int currentPage,
                                    @RequestParam(value="tab", defaultValue="overview") String currentTabKey,// 페이지 번호 받기
                                    Model model) {


        // 1. 순이익 계산 (예: 40200000)
        int netProfit = (financialService.calculateNetProfit() / 10000);
        int Profit = (financialService.calculateProfit() / 10000);
        int Expense = (financialService.calculateExpense() / 10000);
        double ProfitPercent = Math.round((double) netProfit / (double) Profit * 10000) / 100.0;


        // 데이터베이스로부터 카테고리와 수익,지출 에 따른 값을 가져와서 월별 합계로 저장하기
        List<Monthly> monthlyThings = financialService.calculateMonthly();

        List<Integer> monthlyAdProfits = new ArrayList<>(Collections.nCopies(12, 0));
        List<Integer> monthlyMerchProfits = new ArrayList<>(Collections.nCopies(12, 0));
        List<Integer> monthlySponProfits = new ArrayList<>(Collections.nCopies(12, 0));
        List<Integer> monthlyDonationProfits = new ArrayList<>(Collections.nCopies(12, 0));
        List<Integer> monthlyEtcProfits = new ArrayList<>(Collections.nCopies(12, 0));

        List<Integer> monthlyMarketExpenses = new ArrayList<>(Collections.nCopies(12, 0));
        List<Integer> monthlySoftWareExpenses = new ArrayList<>(Collections.nCopies(12, 0));
        List<Integer> monthlyOutSourceExpenses = new ArrayList<>(Collections.nCopies(12, 0));
        List<Integer> monthlyEquipExpenses = new ArrayList<>(Collections.nCopies(12, 0));
        List<Integer> monthlyEtcTotalExpenses = new ArrayList<>(Collections.nCopies(12, 0));

        for (Monthly mp : monthlyThings) {
            int monthIndex = mp.getMonth() - 1; // 1월 → index 0
            monthlyAdProfits.set(monthIndex, mp.getAdTotalIncome() / 10000);
            monthlyMerchProfits.set(monthIndex, mp.getMerchTotalIncome() / 10000);
            monthlySponProfits.set(monthIndex, mp.getSponTotalIncome() / 10000);
            monthlyDonationProfits.set(monthIndex, mp.getDonationTotalIncome() / 10000);
            monthlyEtcProfits.set(monthIndex, mp.getEtcTotalIncome() / 10000);

            monthlyMarketExpenses.set(monthIndex, mp.getMarketTotalExpense() / 10000);
            monthlySoftWareExpenses.set(monthIndex, mp.getSoftWareTotalExpense() / 10000);
            monthlyOutSourceExpenses.set(monthIndex, mp.getOutSourceTotalExpense() / 10000);
            monthlyEquipExpenses.set(monthIndex, mp.getEquipTotalExpense() / 10000);
            monthlyEtcTotalExpenses.set(monthIndex, mp.getEtcTotalExpense() / 10000);
        }



        //page를 위한 map 객체
        Map<String, Object> transactionData = financialService.selectAllTransaction(currentPage);


        // 모델에 순이익 데이터 추가 , 게약관리 조회
        model.addAttribute("transactionList", transactionData.get("transactionList"));
        model.addAttribute("pageInfo", transactionData.get("pageInfo")); // PageInfo 객체 전달
        model.addAttribute("currentTabKey", currentTabKey);
        model.addAttribute("netProfitAmount", netProfit);
        model.addAttribute("ProfitAmount", Profit);
        model.addAttribute("ExpenseAmount", Expense);
        model.addAttribute("ProfitPercent", ProfitPercent);
        
        // 데이터베이스에서 값을 가져와서 수익,지출 그래프 나타내기
        model.addAttribute("monthlyAdProfits", monthlyAdProfits);
        model.addAttribute("monthlyMerchProfits", monthlyMerchProfits);
        model.addAttribute("monthlySponProfits", monthlySponProfits);
        model.addAttribute("monthlyDonationProfits", monthlyDonationProfits);
        model.addAttribute("monthlyEtcProfits", monthlyEtcProfits);

        model.addAttribute("monthlyMarketExpenses", monthlyMarketExpenses);
        model.addAttribute("monthlySoftWareExpenses", monthlySoftWareExpenses);
        model.addAttribute("monthlyOutSourceExpenses", monthlyOutSourceExpenses);
        model.addAttribute("monthlyEquipExpenses", monthlyEquipExpenses);
        model.addAttribute("monthlyEtcTotalExpenses", monthlyEtcTotalExpenses);


        // (전월 대비 변화율 계산 로직은 생략함)
        model.addAttribute("netProfitChange", "+29.7% 전월 대비");

        return "/components/layout";
    }


    @PostMapping("insert.f")
    public String insertProfitFinancial(@ModelAttribute Financial financial, RedirectAttributes ra) {

        financial.setFinancialType("수익");
        // ⭐ 필수: 실제 로그인된 사용자 ID를 설정 (예시: 세션에서 가져옴)
        financial.setMemberId(1234); // 예

        int result = financialService.insertProfitFinancial(financial);

        if (result > 0) {
            ra.addFlashAttribute("alertMsg", "등록 성공!");
            return "redirect:/financial";
        } else {
            ra.addFlashAttribute("alertMsg", "등록 실패");
            return "redirect:/financial";
        }

    }


    @PostMapping("insert.e")
    public String insertExpenseFinancial(@ModelAttribute Financial financial, RedirectAttributes ra) {

        try {
            financial.setFinancialType("지출");
            // ⭐ 필수: 실제 로그인된 사용자 ID를 설정 (예시: 세션에서 가져옴)
            financial.setMemberId(1234); // 예

            int result = financialService.insertExpenseFinancial(financial);

            if (result > 0) {
                ra.addFlashAttribute("alertMsg", "등록 성공!");
                return "redirect:/financial";
            } else {
                ra.addFlashAttribute("alertMsg", "등록 실패");
                return "redirect:/financial";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/financial";

    }


}