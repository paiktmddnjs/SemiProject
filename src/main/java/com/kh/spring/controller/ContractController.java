package com.kh.spring.controller;

import java.sql.Date;
import java.util.List;

import com.kh.spring.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.spring.model.service.ContractService;
import com.kh.spring.model.vo.Contract;
import com.kh.spring.model.vo.Company;

@Controller
@RequestMapping("/contract")
public class ContractController {
    
    @Autowired
    private ContractService contractService;
    
    // 계약 목록 페이지
    @GetMapping("/list.co")
    public String contractList(Model model, jakarta.servlet.http.HttpSession session) {
        // 세션에서 로그인한 멤버 ID 가져오기
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/loginForm.me";
        }
        Long memberId = (long) loginMember.getMemberId();
        
        // 계약 목록 조회 (해당 멤버의 계약만)
        List<Contract> contractList = contractService.selectContractList(memberId);
        model.addAttribute("list", contractList);
        
        // 계약 통계 조회 (해당 멤버의 통계만)
        var summary = contractService.selectContractSummary(memberId);
        model.addAttribute("contractSummary", summary);
        
        // 회사 목록 조회 (계약 추가 시 사용)
        List<Company> companyList = contractService.selectCompanyList();
        model.addAttribute("companyList", companyList);
        
        // layout.jsp에서 어떤 페이지를 include할지 지정
        model.addAttribute("contentPage", "contract");
        model.addAttribute("pageTitle", "협찬 계약");
        
        return "components/layout";
    }
    
    // 계약 추가
    @PostMapping("/saveContract.do")
    public String saveContract(
            @RequestParam("contractName") String contractName,
            @RequestParam(value = "contractAmount", required = false) Long contractAmount,
            @RequestParam(value = "companyId", required = false) Integer companyId,
            @RequestParam("startDate") String startDate,
            @RequestParam("endDate") String endDate,
            @RequestParam(value = "contractStatus", defaultValue = "Y") String contractStatus,
            @RequestParam(value = "memo", required = false) String memo,
            Model model,
            jakarta.servlet.http.HttpSession session) {
        
        Contract contract = new Contract();
        contract.setContractName(contractName);
        contract.setContractAmount(contractAmount != null ? contractAmount : 0L);
        contract.setCompanyId(companyId != null ? companyId : 0);
        contract.setContractStart(Date.valueOf(startDate));
        contract.setContractEnd(Date.valueOf(endDate));
        contract.setContractStatus(contractStatus);
        contract.setContractDesc(memo);
        
        // 세션에서 로그인한 멤버 ID 가져오기
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/loginForm.me";
        }
        int memberId =  loginMember.getMemberId();
        contract.setMemberId(memberId);
        
        int result = contractService.insertContract(contract);
        
        if (result > 0) {
            return "redirect:/contract/list.co";
        } else {
            model.addAttribute("errorMsg", "계약 추가에 실패했습니다.");
            model.addAttribute("contentPage", "contract");
            model.addAttribute("pageTitle", "협찬 계약");
            return "components/layout";
        }
    }
    
    // 회사 추가
    @PostMapping("/saveCompany.do")
    public String saveCompany(
            @RequestParam("companyName") String companyName,
            @RequestParam(value = "companyCall", required = false) String companyCall,
            @RequestParam(value = "companyManager", required = false) String companyManager,
            @RequestParam(value = "companyManagerCall", required = false) String companyManagerCall,
            @RequestParam(value = "companyBusinessCall", required = false) String companyBusinessCall,
            @RequestParam(value = "companyRepresentaiveCall", required = false) String companyRepresentative,
            Model model) {
        
        Company company = new Company();
        company.setCompanyName(companyName);
        company.setCompanyCall(companyCall);
        company.setCompanyManager(companyManager);
        company.setCompanyManagerCall(companyManagerCall);
        company.setCompanyBusinessCall(companyBusinessCall);
        company.setCompanyRepresentative(companyRepresentative);
        
        int result = contractService.insertCompany(company);
        
        if (result > 0) {
            return "redirect:/contract/list.co";
        } else {
            model.addAttribute("errorMsg", "회사 추가에 실패했습니다.");
            model.addAttribute("contentPage", "contract");
            model.addAttribute("pageTitle", "협찬 계약");
            return "components/layout";
        }
    }
    
    // 계약 수정 (정산 상태 변경 등)
    @PostMapping("/updateContract.do")
    public String updateContract(
            @RequestParam("contractId") int contractId,
            @RequestParam(value = "paymentStatus", required = false) String paymentStatus,
            Model model) {
        
        Contract contract = contractService.selectContract(contractId);
        if (contract != null) {
            // paymentStatus에 따라 contractStatus와 contractFix 설정
            if (paymentStatus != null) {
                if (paymentStatus.equals("completed")) {
                    contract.setContractStatus("N");
                    // 완료 시 contractFix는 이미 설정되어 있을 수 있음
                } else if (paymentStatus.equals("pending")) {
                    contract.setContractStatus("Y");
                    // 진행중일 때 contractFix 설정
                    if (contract.getContractFix() == null) {
                        contract.setContractFix(new Date(System.currentTimeMillis()));
                    }
                } else if (paymentStatus.equals("reviewing")) {
                    contract.setContractStatus("N");
                    contract.setContractFix(null);
                }
            }
            
            int result = contractService.updateContract(contract);
            if (result > 0) {
                return "redirect:/contract/list.co";
            }
        }
        
        model.addAttribute("errorMsg", "계약 수정에 실패했습니다.");
        model.addAttribute("contentPage", "contract");
        model.addAttribute("pageTitle", "협찬 계약");
        return "components/layout";
    }
}

