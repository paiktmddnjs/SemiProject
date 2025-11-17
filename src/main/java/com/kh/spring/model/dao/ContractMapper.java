package com.kh.spring.model.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.kh.spring.model.vo.Contract;
import com.kh.spring.model.vo.ContractSummary;

@Mapper
public interface ContractMapper {
    
    // 계약 목록 조회 (회사 정보 포함)
    List<Contract> selectContractList(@org.apache.ibatis.annotations.Param("memberId") Long memberId);
    
    // 계약 상세 조회
    Contract selectContract(int contractId);
    
    // 계약 통계 조회
    ContractSummary selectContractSummary(@org.apache.ibatis.annotations.Param("memberId") Long memberId);
    
    // 계약 추가
    int insertContract(Contract contract);
    
    // 계약 수정
    int updateContract(Contract contract);
    
    // 계약 삭제
    int deleteContract(int contractId);
    
    // 회사 목록 조회
    List<com.kh.spring.model.vo.Company> selectCompanyList();
    
    // 회사 추가
    int insertCompany(com.kh.spring.model.vo.Company company);
}

