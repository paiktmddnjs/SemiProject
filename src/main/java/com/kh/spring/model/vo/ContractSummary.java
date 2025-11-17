package com.kh.spring.model.vo;

public class ContractSummary {
    private int activeContracts;
    private long totalAmount;
    private int newContractsThisMonth;
    private int newContractsGrowthRate;
    private int pendingPayments;
    
    public ContractSummary() {
    }
    
    public ContractSummary(int activeContracts, long totalAmount, int newContractsThisMonth,
            int newContractsGrowthRate, int pendingPayments) {
        this.activeContracts = activeContracts;
        this.totalAmount = totalAmount;
        this.newContractsThisMonth = newContractsThisMonth;
        this.newContractsGrowthRate = newContractsGrowthRate;
        this.pendingPayments = pendingPayments;
    }
    
    public int getActiveContracts() {
        return activeContracts;
    }
    
    public void setActiveContracts(int activeContracts) {
        this.activeContracts = activeContracts;
    }
    
    public long getTotalAmount() {
        return totalAmount;
    }
    
    public void setTotalAmount(long totalAmount) {
        this.totalAmount = totalAmount;
    }
    
    public int getNewContractsThisMonth() {
        return newContractsThisMonth;
    }
    
    public void setNewContractsThisMonth(int newContractsThisMonth) {
        this.newContractsThisMonth = newContractsThisMonth;
    }
    
    public int getNewContractsGrowthRate() {
        return newContractsGrowthRate;
    }
    
    public void setNewContractsGrowthRate(int newContractsGrowthRate) {
        this.newContractsGrowthRate = newContractsGrowthRate;
    }
    
    public int getPendingPayments() {
        return pendingPayments;
    }
    
    public void setPendingPayments(int pendingPayments) {
        this.pendingPayments = pendingPayments;
    }
}
