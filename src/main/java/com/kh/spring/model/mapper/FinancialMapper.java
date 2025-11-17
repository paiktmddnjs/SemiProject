package com.kh.spring.model.mapper;

import com.kh.spring.model.vo.Financial;
import com.kh.spring.model.vo.Monthly;
import com.kh.spring.model.vo.TopThree;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface FinancialMapper {

    Financial selectAllFinancial();
    List<Financial> selectAllFinancialRecords();
    int calculateNetProfit(@Param("memberId") Long memberId);
    int calculateProfit(@Param("memberId") Long memberId);
    int calculateExpense(@Param("memberId") Long memberId);
    int calculatePreNetProfit(@Param("memberId") Long memberId);

    List<Monthly> calculateMonthly(@Param("memberId") Long memberId);
    List<Monthly> calculateMonthlyMoney(@Param("memberId") Long memberId);
    List<TopThree> selectTopThree(@Param("memberId") Long memberId);

    int insertFinancial(Financial financial);
    List<Financial> selectAllTransaction();

    // 1. 전체 개수 조회
    int selectTransactionCount(@Param("memberId") Long memberId);

    // 2. 범위별 조회 (Map에 offset과 limit을 담아 전달)
    List<Financial> selectAllTransaction(@Param("memberId") Long memberId, @Param("offset") int offset, @Param("limit") int limit);

}
