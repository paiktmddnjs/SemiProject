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
    int calculateNetProfit();
    int calculateProfit();
    int calculateExpense();
    int calculatePreNetProfit();

    List<Monthly> calculateMonthly();
    List<Monthly> calculateMonthlyMoney();
    List<TopThree> selectTopThree();

    int insertFinancial(Financial financial);
    List<Financial> selectAllTransaction();

    // 1. 전체 개수 조회
    int selectTransactionCount();

    // 2. 범위별 조회 (Map에 offset과 limit을 담아 전달)
    List<Financial> selectAllTransaction(@Param("offset") int offset, @Param("limit") int limit);

}
