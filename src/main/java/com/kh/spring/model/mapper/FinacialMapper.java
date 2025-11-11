package com.kh.spring.model.mapper;

import com.kh.spring.model.vo.Finacial;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface FinacialMapper {

    Finacial selectAllFinacial();
    List<Finacial> selectAllFinacialRecords();
    int calculateNetProfit();
    int calculateProfit();
    int calculateExpense();
    int insertFinacial(Finacial finacial);
    List<Finacial> selectAllTransaction();

    // 1. 전체 개수 조회
    int selectTransactionCount();

    // 2. 범위별 조회 (Map에 offset과 limit을 담아 전달)
    List<Finacial> selectAllTransaction(@Param("offset") int offset, @Param("limit") int limit);

}
