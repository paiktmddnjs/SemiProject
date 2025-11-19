package com.kh.spring.Controller;

import com.kh.spring.Service.FinancialService;
import com.kh.spring.model.vo.Monthly;
import com.kh.spring.Service.FinancialService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
public class HomeController {

    private final FinancialService financialService;

    @Autowired
    public HomeController(FinancialService financialService) {
        this.financialService = financialService;
    }

    @GetMapping("/")
    public String home(HttpSession session, Model model){
        // 로그인 여부 확인
        Object loginMember = session.getAttribute("loginMember");
        
        if (loginMember != null) {
            // 세션에서 멤버 ID 가져오기
            Long memberId = (Long) session.getAttribute("memberId");
            
            if (memberId != null) {
                // 최근 5개월 수익 데이터 가져오기
                List<Monthly> revenueData = financialService.selectRecentFiveMonthsRevenue(memberId);
                
                // 월별 라벨과 데이터 준비
                List<String> monthLabels = new ArrayList<>();
                List<Integer> adRevenue = new ArrayList<>();
                List<Integer> sponRevenue = new ArrayList<>();
                List<Integer> merchRevenue = new ArrayList<>();
                List<Integer> etcRevenue = new ArrayList<>();
                
                // 최근 5개월 계산 (현재 월 포함)
                Calendar cal = Calendar.getInstance();
                int currentMonth = cal.get(Calendar.MONTH) + 1; // 1-12
                
                // 5개월 전부터 현재까지
                for (int i = 4; i >= 0; i--) {
                    int monthValue = currentMonth - i;
                    
                    // 월이 음수면 작년으로
                    if (monthValue <= 0) {
                        monthValue += 12;
                    }
                    
                    // 람다 식에서 사용하기 위해 final 변수로 복사
                    final int month = monthValue;
                    
                    monthLabels.add(month + "월");
                    
                    // 해당 월의 데이터 찾기
                    Monthly monthData = revenueData.stream()
                        .filter(m -> m.getMonth() == month)
                        .findFirst()
                        .orElse(null);
                    
                    if (monthData != null) {
                        // 만원 단위로 변환
                        adRevenue.add(monthData.getAdTotalIncome() / 10000);
                        sponRevenue.add(monthData.getSponTotalIncome() / 10000);
                        merchRevenue.add(monthData.getMerchTotalIncome() / 10000);
                        etcRevenue.add(monthData.getEtcTotalIncome() / 10000);
                    } else {
                        // 데이터가 없으면 0
                        adRevenue.add(0);
                        sponRevenue.add(0);
                        merchRevenue.add(0);
                        etcRevenue.add(0);
                    }
                }
                
                model.addAttribute("revenueMonthLabels", monthLabels);
                model.addAttribute("adRevenue", adRevenue);
                model.addAttribute("sponRevenue", sponRevenue);
                model.addAttribute("merchRevenue", merchRevenue);
                model.addAttribute("etcRevenue", etcRevenue);
            }
            
            // 로그인되어 있으면 대시보드로
            model.addAttribute("contentPage", "dashboard");
            model.addAttribute("pageTitle", "대시보드");
            return "components/layout";
        } else {
            // 로그인되지 않았으면 랜딩 페이지로
            return "Landing_Page";
        }
    }
}