package com.kh.spring.model.vo;

import java.sql.Date;

public class Contract {
    private int contractId;
    private String contractName;
    private String contractStatus;
    private Date contractFix;
    private Date contractStart;
    private Date contractEnd;
    private String contractDesc;
    private Long contractAmount;
    private int memberId;
    private int companyId;
    
    // JOIN을 위한 Company 정보
    private String companyName;
    private String companyCall;
    private String companyManager;
    private String companyManagerCall;
    private String companyBusinessCall;
    private String companyRepresentative;
    
    public Contract() {
    }
    
    public Contract(int contractId, String contractName, String contractStatus, Date contractFix, Date contractStart,
            Date contractEnd, String contractDesc, Long contractAmount, int memberId, int companyId, String companyName,
            String companyCall, String companyManager, String companyManagerCall, String companyBusinessCall,
            String companyRepresentative) {
        this.contractId = contractId;
        this.contractName = contractName;
        this.contractStatus = contractStatus;
        this.contractFix = contractFix;
        this.contractStart = contractStart;
        this.contractEnd = contractEnd;
        this.contractDesc = contractDesc;
        this.contractAmount = contractAmount;
        this.memberId = memberId;
        this.companyId = companyId;
        this.companyName = companyName;
        this.companyCall = companyCall;
        this.companyManager = companyManager;
        this.companyManagerCall = companyManagerCall;
        this.companyBusinessCall = companyBusinessCall;
        this.companyRepresentative = companyRepresentative;
    }
    
    // Getter and Setter
    public int getContractId() {
        return contractId;
    }
    
    public void setContractId(int contractId) {
        this.contractId = contractId;
    }
    
    public String getContractName() {
        return contractName;
    }
    
    public void setContractName(String contractName) {
        this.contractName = contractName;
    }
    
    public String getContractStatus() {
        return contractStatus;
    }
    
    public void setContractStatus(String contractStatus) {
        this.contractStatus = contractStatus;
    }
    
    public Date getContractFix() {
        return contractFix;
    }
    
    public void setContractFix(Date contractFix) {
        this.contractFix = contractFix;
    }
    
    public Date getContractStart() {
        return contractStart;
    }
    
    public void setContractStart(Date contractStart) {
        this.contractStart = contractStart;
    }
    
    public Date getContractEnd() {
        return contractEnd;
    }
    
    public void setContractEnd(Date contractEnd) {
        this.contractEnd = contractEnd;
    }
    
    public String getContractDesc() {
        return contractDesc;
    }
    
    public void setContractDesc(String contractDesc) {
        this.contractDesc = contractDesc;
    }
    
    public Long getContractAmount() {
        return contractAmount;
    }
    
    public void setContractAmount(Long contractAmount) {
        this.contractAmount = contractAmount;
    }
    
    public int getMemberId() {
        return memberId;
    }
    
    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }
    
    public int getCompanyId() {
        return companyId;
    }
    
    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }
    
    public String getCompanyName() {
        return companyName;
    }
    
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    
    public String getCompanyCall() {
        return companyCall;
    }
    
    public void setCompanyCall(String companyCall) {
        this.companyCall = companyCall;
    }
    
    public String getCompanyManager() {
        return companyManager;
    }
    
    public void setCompanyManager(String companyManager) {
        this.companyManager = companyManager;
    }
    
    public String getCompanyManagerCall() {
        return companyManagerCall;
    }
    
    public void setCompanyManagerCall(String companyManagerCall) {
        this.companyManagerCall = companyManagerCall;
    }
    
    public String getCompanyBusinessCall() {
        return companyBusinessCall;
    }
    
    public void setCompanyBusinessCall(String companyBusinessCall) {
        this.companyBusinessCall = companyBusinessCall;
    }
    
    public String getCompanyRepresentative() {
        return companyRepresentative;
    }
    
    public void setCompanyRepresentative(String companyRepresentative) {
        this.companyRepresentative = companyRepresentative;
    }
    
    // JSP에서 사용할 필드들 (더미 데이터와 호환)
    public String getContractNo() {
        return String.valueOf(contractId);
    }
    
    public String getAmount() {
        return contractAmount != null ? String.valueOf(contractAmount) : "0";
    }
    
    public String getStartDate() {
        return contractStart != null ? contractStart.toString() : "";
    }
    
    public String getEndDate() {
        return contractEnd != null ? contractEnd.toString() : "";
    }
    
    public String getStatus() {
        if (contractStatus == null) return "pending";
        return contractStatus.equals("Y") ? "active" : "pending";
    }
    
    public String getDeliverables() {
        return contractDesc != null && contractDesc.length() > 50 
            ? contractDesc.substring(0, 50) + "..." 
            : (contractDesc != null ? contractDesc : "");
    }
    
    public String getPaymentStatusName() {
        // CONTRACT_STATUS에 따라 정산 상태 결정
        if (contractStatus == null) return "계약서 검토 중";
        if (contractStatus.equals("Y")) return "진행중";
        if (contractFix == null) return "계약서 검토 중";
        return "정산 대기";
    }
    
    public String getPaymentStatus() {
        if (contractStatus == null) return "reviewing";
        if (contractFix == null) return "reviewing";
        if (contractStatus.equals("Y")) return "pending";
        return "completed";
    }
    
    public String getCompanyEmail() {
        // DB에 이메일 필드가 없으므로 기본값 반환
        return "contact@" + (companyName != null ? companyName.toLowerCase().replaceAll("\\s+", "") : "company") + ".com";
    }
    
    public String getCompanyContact() {
        return companyCall != null ? companyCall : "";
    }
    
    public String getManagerName() {
        return companyManager != null ? companyManager : "";
    }
    
    public String getBusinessLicenseNumber() {
        return companyBusinessCall != null ? companyBusinessCall : "";
    }
    
    public String getManagerContact() {
        return companyManagerCall != null ? companyManagerCall : "";
    }
    
    public String getCeoContact() {
        return companyRepresentative != null ? companyRepresentative : "";
    }
    
    public String getMemo() {
        return contractDesc != null ? contractDesc : "";
    }
}
