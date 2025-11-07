package com.kh.spring.service;

import com.kh.spring.model.vo.Finacial;

import java.util.List;

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
    /**
     * 새로운 재무 기록을 삽입하는 메소드
     * @param finacialRecord 삽입할 FinacialManagement 객체
     * @return 처리된 행 수 (1이면 성공)
     */
    int insertFinacialRecord(Finacial finacialRecord);
}
