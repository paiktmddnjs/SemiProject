package com.kh.spring.controller;

import com.kh.spring.model.vo.Finacial;
import com.kh.spring.model.vo.Monthly;
import com.kh.spring.service.FinacialService;
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


        // 1. 순이익 계산 (예: 40200000)
        int netProfit = (finacialService.calculateNetProfit() / 10000);
        int Profit = (finacialService.calculateProfit() / 10000);
        int Expense = (finacialService.calculateExpense() / 10000);
        double ProfitPercent = Math.round((double) netProfit / (double) Profit * 10000) / 100.0;


        // 데이터베이스로부터 카테고리와 수익,지출 에 따른 값을 가져와서 월별 합계로 저장하기
        List<Monthly> monthlyThings = finacialService.calculateMonthly();

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
        Map<String, Object> transactionData = finacialService.selectAllTransaction(currentPage);


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