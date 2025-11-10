package com.kh.spring.model.mapper;

import com.kh.spring.model.vo.Finacial;
import org.apache.ibatis.annotations.Mapper;

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

}
