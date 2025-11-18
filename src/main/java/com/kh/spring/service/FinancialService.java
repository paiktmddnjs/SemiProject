package com.kh.spring.Service;

import com.kh.spring.model.vo.Financial;
import com.kh.spring.model.vo.Monthly;
import com.kh.spring.model.vo.TopThree;

import java.util.List;
import java.util.Map;

public interface FinancialService {

    Financial selectAllFinancial();

    List<Financial> selectAllFinancialRecords();

    /**
     * 순이익 (총 수익 - 총 지출)을 계산하여 반환하는 메소드
     * @return 순이익 금액
     */
    int calculateNetProfit(Long memberId);
    int calculateProfit(Long memberId);
    int calculateExpense(Long memberId);
    int calculatePreNetProfit(Long memberId);

    List<Monthly> calculateMonthly(Long memberId);
    List<Monthly> calculateMonthlyMoney(Long memberId);
    List<TopThree> selectTopThree(Long memberId);

    int insertProfitFinancial(Financial financial);

    int insertExpenseFinancial(Financial financial);


    public int selectTransactionCount(Long memberId);

    Map<String, Object> selectAllTransaction(Long memberId, int currentPage);
    
    // 최근 5개월 수익 추이 데이터
    List<Monthly> selectRecentFiveMonthsRevenue(Long memberId);
}
