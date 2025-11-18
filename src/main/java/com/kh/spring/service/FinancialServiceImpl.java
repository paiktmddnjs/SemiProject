package com.kh.spring.Service;

import com.kh.spring.model.mapper.FinancialMapper;
import com.kh.spring.model.vo.Financial;
import com.kh.spring.model.vo.Monthly;
import com.kh.spring.model.vo.PageInfo;
import com.kh.spring.model.vo.TopThree;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class FinancialServiceImpl implements FinancialService {

    private final FinancialMapper financialMapper;
    private final SqlSession sqlSession;

    @Autowired
    public FinancialServiceImpl(FinancialMapper financialMapper, SqlSession sqlSession){

        this.financialMapper = financialMapper;
        this.sqlSession = sqlSession;
    }

    @Override
    public Financial selectAllFinancial() {

        //List<Board> list = boardMapper.selectAllBoard(rowBounds);
        return financialMapper.selectAllFinancial();
    }

    @Override
    public List<Financial> selectAllFinancialRecords() {
        // 매퍼에 정의된 전체 조회 메소드를 호출하여 결과를 반환
        return financialMapper.selectAllFinancialRecords();
    }

    @Override
    public int calculateNetProfit(Long memberId) {
        // 매퍼에 정의된 순이익 계산 쿼리(calculateNetProfit)를 호출
        return financialMapper.calculateNetProfit(memberId);
    }

    @Override
    public int calculateProfit(Long memberId)
    {
        return financialMapper.calculateProfit(memberId);

    }

    @Override
    public int calculateExpense(Long memberId)
    {

        return financialMapper.calculateExpense(memberId);
    }

    public int calculatePreNetProfit(Long memberId)
    {
        return financialMapper.calculatePreNetProfit(memberId);
    }

    @Override
    public List<Monthly> calculateMonthly(Long memberId) {

        return financialMapper.calculateMonthly(memberId);
    }

    public List<Monthly> calculateMonthlyMoney(Long memberId) {
        return financialMapper.calculateMonthlyMoney(memberId);
    }



    public  List<TopThree> selectTopThree(Long memberId) {

        return financialMapper.selectTopThree(memberId);
    }


    @Override
    public int insertProfitFinancial(Financial financial) {
        // 매퍼에 정의된 삽입 메소드를 호출
        return financialMapper.insertFinancial(financial);
    }

    public int insertExpenseFinancial(Financial financial) {

        return financialMapper.insertFinancial(financial);
    }

    @Override
    public int selectTransactionCount(Long memberId) {
        return financialMapper.selectTransactionCount(memberId);
    }

    @Override
    public Map<String, Object> selectAllTransaction(Long memberId, int currentPage) {

        // 1. 총 거래 내역 개수 조회
        int listCount = financialMapper.selectTransactionCount(memberId); /// 인터페이스 메서드 활용

        // 2. 페이지네이션 정보(PageInfo) 설정 및 계산
        int pageLimit = 10;
        int boardLimit = 8; // ✅ 한 페이지당 6개 항목으로 설정

        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit);

        // 3. DB 조회를 위한 OFFSET(시작 위치)과 LIMIT(개수) 계산
        // OFFSET: (현재 페이지 - 1) * 한 페이지당 개수
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        int limit = pi.getBoardLimit();

        // 4. 범위별 거래 내역 조회 (Mapper 호출)
        // Mapper로 offset과 limit을 전달하여 DB에서 6개 데이터만 가져옴
        List<Financial> transactionList = financialMapper.selectAllTransaction(memberId, offset, limit);

        // 5. 결과 반환 (List와 PageInfo를 Map에 담아 Controller로 전달)
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("transactionList", transactionList);
        resultMap.put("pageInfo", pi);

        return resultMap;
    }

    @Override
    public List<Monthly> selectRecentFiveMonthsRevenue(Long memberId) {
        return financialMapper.selectRecentFiveMonthsRevenue(memberId);
    }


}
