package com.kh.spring.service;

import com.kh.spring.model.mapper.FinacialMapper;
import com.kh.spring.model.vo.Finacial;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class FinacialServiceImpl implements FinacialService {

    private final FinacialMapper finacialMapper;
    private final SqlSession sqlSession;

    @Autowired
    public FinacialServiceImpl(FinacialMapper finacialMapper, SqlSession sqlSession){

        this.finacialMapper = finacialMapper;
        this.sqlSession = sqlSession;
    }

    @Override
    public Finacial selectAllFinacial() {

        //List<Board> list = boardMapper.selectAllBoard(rowBounds);
        return finacialMapper.selectAllFinacial();
    }

    @Override
    public List<Finacial> selectAllFinacialRecords() {
        // 매퍼에 정의된 전체 조회 메소드를 호출하여 결과를 반환
        return finacialMapper.selectAllFinacialRecords();
    }

    @Override
    public int calculateNetProfit() {
        // 매퍼에 정의된 순이익 계산 쿼리(calculateNetProfit)를 호출
        return finacialMapper.calculateNetProfit();
    }

    public int calculateProfit()
    {
        return finacialMapper.calculateProfit();

    }

    public int calculateExpense()
    {

        return finacialMapper.calculateExpense();
    }

    @Override
    public int insertProfitFinacial(Finacial finacial) {
        // 매퍼에 정의된 삽입 메소드를 호출
        return finacialMapper.insertFinacial(finacial);
    }

    public int insertExpenseFinacial(Finacial finacial) {

        return finacialMapper.insertFinacial(finacial);
    }

    public List<Finacial> selectAllTransaction() {
        return finacialMapper.selectAllTransaction();
    }

}
