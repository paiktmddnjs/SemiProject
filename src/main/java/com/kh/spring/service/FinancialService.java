package com.kh.spring.service;

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
    int calculateNetProfit();
    int calculateProfit();
    int calculateExpense();
    int calculatePreNetProfit();

    List<Monthly> calculateMonthly();
    List<Monthly> calculateMonthlyMoney();
    List<TopThree> selectTopThree();

    int insertProfitFinancial(Financial financial);

    int insertExpenseFinancial(Financial financial);


    public int selectTransactionCount();

    Map<String, Object> selectAllTransaction(int currentPage);
}
