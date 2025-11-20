package com.kh.spring.controller;

import com.kh.spring.model.vo.Financial;
import com.kh.spring.model.vo.Member;
import com.kh.spring.model.vo.Monthly;
import com.kh.spring.model.vo.TopThree;
import com.kh.spring.service.FinancialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.DecimalFormat;
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
                                    Model model,
                                    jakarta.servlet.http.HttpSession session) {
        
        // 세션에서 로그인한 멤버 ID 가져오기
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/loginForm.me";
        }
        Long memberId = (long) loginMember.getMemberId();

        // 1. 순이익 계산 (예: 40200000)
        int netProfit = (financialService.calculateNetProfit(memberId) / 10000);
        int Profit = (financialService.calculateProfit(memberId) / 10000);
        int Expense = (financialService.calculateExpense(memberId) / 10000);
        int PrevNetProfit = (financialService.calculatePreNetProfit(memberId) / 10000);

        // DecimalFormat을 사용하여 소수점 2자리와 부호를 동시에 처리
        // 패턴: 양수일 때 앞에 '+'를 붙임 (0.00; -0.00)
        DecimalFormat df = new DecimalFormat("+#,##0.00;-#,##0.00");

        if (PrevNetProfit > 0) {
            // 1. PrevNetProfit이 양수일 때 (가장 정상적인 비교)
            double IncreaseRateDouble = ((double) netProfit - (double) PrevNetProfit) / (double) PrevNetProfit * 100;
            String IncreaseRate = df.format(IncreaseRateDouble);
            model.addAttribute("IncreaseRate", IncreaseRate);

        } else {
            // 2. PrevNetProfit이 0이거나 음수일 때 (else 블록)

            if (PrevNetProfit < 0 && netProfit > 0) {
                // 손실 -> 이익 전환 (Turnaround)
                // 백분율 대신 '개선'이나 절대 변화액을 표시하는 것이 명확함
                model.addAttribute("IncreaseRate", "개선됨");
                // 또는 "N/M (Not Meaningful)"

            } else if (PrevNetProfit == 0) {
                // 0으로 나누기 오류 방지
                model.addAttribute("IncreaseRate", "N/A (비교 불가)");

            } else {
                // 음수 -> 음수 또는 음수 -> 0 등의 기타 비표준 상황
                model.addAttribute("IncreaseRate", "N/M (의미 없음)");
            }
        }
            double ProfitPercent = Math.round((double) netProfit / (double) Profit * 10000) / 100.0;




        // 데이터베이스로부터 카테고리와 수익,지출 에 따른 값을 가져와서 월별 합계로 저장하기
        List<Monthly> monthlyThings = financialService.calculateMonthly(memberId);
        List<Monthly> monthlyTotalMoney = financialService.calculateMonthlyMoney(memberId);

        List<TopThree> topList1 = financialService.selectTopThree1(memberId);
        List<TopThree> topList2 = financialService.selectTopThree2(memberId);
        TopThree dummy = TopThree.DUMMY; // 미리 생성된 더미 객체

// 리스트 크기를 확인하여 각 순위에 맞는 객체를 할당
        TopThree FirstProfit  = topList1.size() > 0 ? topList1.get(0) : dummy;
        TopThree SecondProfit = topList1.size() > 1 ? topList1.get(1) : dummy;
        TopThree ThirdProfit  = topList1.size() > 2 ? topList1.get(2) : dummy;

        TopThree FirstExpense = topList2.size() > 3 ? topList2.get(3) : dummy;
        TopThree SecondExpense = topList2.size() > 4 ? topList2.get(4) : dummy;
        TopThree ThirdExpense = topList2.size() > 5 ? topList2.get(5) : dummy;


        // 총수익, 순수익, 지출 라인 그래프
        List<Integer> monthlyNetProfit = new ArrayList<>(Collections.nCopies(12, 0));
        List<Integer> monthlyProfit = new ArrayList<>(Collections.nCopies(12, 0));
        List<Integer> monthlyExpense = new ArrayList<>(Collections.nCopies(12, 0));


        // 월순으로 각 카테고리별로 넣기 위한 리스트 생성
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

        for (Monthly mp : monthlyTotalMoney) {
            int monthIndex = mp.getMonth() - 1; // 1월 → index 0
            monthlyProfit.set(monthIndex, mp.getProfitTotal());
            monthlyNetProfit.set(monthIndex, mp.getNetProfitTotal());
            monthlyExpense.set(monthIndex, mp.getExpenseTotal());
        }


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
        Map<String, Object> transactionData = financialService.selectAllTransaction(memberId, currentPage);


        model.addAttribute("monthlyNetProfit", monthlyNetProfit);
        model.addAttribute("monthlyProfit", monthlyProfit);
        model.addAttribute("monthlyExpense", monthlyExpense);


        // 오른쪽 패널에 나오는 3개월간의 수익, 지출 순위
        model.addAttribute("FirstProfit", FirstProfit);
        model.addAttribute("SecondProfit", SecondProfit);
        model.addAttribute("ThirdProfit", ThirdProfit);
        model.addAttribute("FirstExpense", FirstExpense);
        model.addAttribute("SecondExpense", SecondExpense);
        model.addAttribute("ThirdExpense", ThirdExpense);


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

        // layout.jsp에서 재무 관리 페이지임을 알리기 위해 contentPage 설정
        model.addAttribute("contentPage", "financial");
        model.addAttribute("pageTitle", "재무 관리");

        return "/components/layout";
    }


    @PostMapping("insert.f")
    public String insertProfitFinancial(@ModelAttribute Financial financial, RedirectAttributes ra,
                                       jakarta.servlet.http.HttpSession session) {

        // 세션에서 로그인한 멤버 ID 가져오기
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/loginForm.me";
        }
        Long memberId = (long) loginMember.getMemberId();

        financial.setFinancialType("수익");
        financial.setMemberId(memberId);

        int result = financialService.insertProfitFinancial(financial);


        if (result > 0) {
            ra.addFlashAttribute("msg", "수익 항목이 성공적으로 등록되었습니다.");
            return "redirect:/financial";
        } else {
            ra.addFlashAttribute("msg", "수익 항목 등록에 실패했습니다.");
            return "redirect:/financial";
        }

    }


    @PostMapping("insert.e")
    public String insertExpenseFinancial(@ModelAttribute Financial financial, RedirectAttributes ra,
                                        jakarta.servlet.http.HttpSession session) {

        try {
            Member loginMember = (Member) session.getAttribute("loginMember");
            if (loginMember == null) {
                return "redirect:/loginForm.me";
            }
            Long memberId = (long) loginMember.getMemberId();

            financial.setFinancialType("지출");
            financial.setMemberId(memberId);

            int result = financialService.insertExpenseFinancial(financial);

            if (result > 0) {
                ra.addFlashAttribute("msg", "지출 항목이 성공적으로 등록되었습니다.");
                return "redirect:/financial";
            } else {
                ra.addFlashAttribute("msg", "지출 항목 등록에 실패했습니다.");
                return "redirect:/financial";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/financial";

    }


}