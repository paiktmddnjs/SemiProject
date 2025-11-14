package com.kh.spring.model.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.spring.model.dao.ContractMapper;
import com.kh.spring.model.vo.Contract;
import com.kh.spring.model.vo.ContractSummary;
import com.kh.spring.model.vo.Company;

@Service
public class ContractServiceImpl implements ContractService {
    
    @Autowired
    private ContractMapper contractMapper;
    
    @Override
    public List<Contract> selectContractList() {
        return contractMapper.selectContractList();
    }
    
    @Override
    public Contract selectContract(int contractId) {
        return contractMapper.selectContract(contractId);
    }
    
    @Override
    public ContractSummary selectContractSummary() {
        return contractMapper.selectContractSummary();
    }
    
    @Override
    public int insertContract(Contract contract) {
        return contractMapper.insertContract(contract);
    }
    
    @Override
    public int updateContract(Contract contract) {
        return contractMapper.updateContract(contract);
    }
    
    @Override
    public int deleteContract(int contractId) {
        return contractMapper.deleteContract(contractId);
    }
    
    @Override
    public List<Company> selectCompanyList() {
        return contractMapper.selectCompanyList();
    }
    
    @Override
    public int insertCompany(Company company) {
        return contractMapper.insertCompany(company);
    }
}

