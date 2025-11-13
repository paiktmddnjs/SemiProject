package com.kh.spring.service;

import com.kh.spring.model.vo.Finacial;
import com.kh.spring.model.vo.Monthly;

import java.util.List;
import java.util.Map;

public interface FinacialService {

    Finacial selectAllFinacial();

    List<Finacial> selectAllFinacialRecords();

    /**
     * 순이익 (총 수익 - 총 지출)을 계산하여 반환하는 메소드
     * @return 순이익 금액
     */
    int calculateNetProfit();
    int calculateProfit();
    int calculateExpense();


    List<Monthly> calculateMonthly();

    int insertProfitFinacial(Finacial finacial);

    int insertExpenseFinacial(Finacial finacial);


    public int selectTransactionCount();

    Map<String, Object> selectAllTransaction(int currentPage);
}
