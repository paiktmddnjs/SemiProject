package com.kh.spring.service;

import com.kh.spring.model.mapper.FinacialMapper;
import com.kh.spring.model.vo.Finacial;
import com.kh.spring.model.vo.PageInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


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

    @Override
    public int selectTransactionCount() {
        return finacialMapper.selectTransactionCount();
    }

    @Override
    public Map<String, Object> selectAllTransaction(int currentPage) {

        // 1. 총 거래 내역 개수 조회
        int listCount = finacialMapper.selectTransactionCount(); /// 인터페이스 메서드 활용

        // 2. 페이지네이션 정보(PageInfo) 설정 및 계산
        int pageLimit = 10;
        int boardLimit = 6; // ✅ 한 페이지당 6개 항목으로 설정

        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit);

        // 3. DB 조회를 위한 OFFSET(시작 위치)과 LIMIT(개수) 계산
        // OFFSET: (현재 페이지 - 1) * 한 페이지당 개수
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        int limit = pi.getBoardLimit();

        // 4. 범위별 거래 내역 조회 (Mapper 호출)
        // Mapper로 offset과 limit을 전달하여 DB에서 6개 데이터만 가져옴
        List<Finacial> transactionList = finacialMapper.selectAllTransaction(offset, limit);

        // 5. 결과 반환 (List와 PageInfo를 Map에 담아 Controller로 전달)
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("transactionList", transactionList);
        resultMap.put("pageInfo", pi);

        return resultMap;
    }


}
