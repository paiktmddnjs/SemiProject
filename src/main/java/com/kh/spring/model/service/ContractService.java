package com.kh.spring.model.service;

import java.util.List;
import com.kh.spring.model.vo.Contract;
import com.kh.spring.model.vo.ContractSummary;
import com.kh.spring.model.vo.Company;

public interface ContractService {
    
    // 계약 목록 조회
    List<Contract> selectContractList();
    
    // 계약 상세 조회
    Contract selectContract(int contractId);
    
    // 계약 통계 조회
    ContractSummary selectContractSummary();
    
    // 계약 추가
    int insertContract(Contract contract);
    
    // 계약 수정
    int updateContract(Contract contract);
    
    // 계약 삭제
    int deleteContract(int contractId);
    
    // 회사 목록 조회
    List<Company> selectCompanyList();
    
    // 회사 추가
    int insertCompany(Company company);
}

