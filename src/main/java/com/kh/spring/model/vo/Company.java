package com.kh.spring.model.vo;

public class Company {
    private int companyId;
    private String companyName;
    private String companyCall;
    private String companyManager;
    private String companyManagerCall;
    private String companyBusinessCall;
    private String companyRepresentative;
    
    public Company() {
    }
    
    public Company(int companyId, String companyName, String companyCall, String companyManager,
            String companyManagerCall, String companyBusinessCall, String companyRepresentative) {
        this.companyId = companyId;
        this.companyName = companyName;
        this.companyCall = companyCall;
        this.companyManager = companyManager;
        this.companyManagerCall = companyManagerCall;
        this.companyBusinessCall = companyBusinessCall;
        this.companyRepresentative = companyRepresentative;
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
}
