package com.kh.spring.model.vo;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Monthly {

    // SQL 쿼리의 'month' AS month 와 매핑
    private int month;

    // 총수익, 순수익, 지출 월별 합계
    private int ProfitTotal;
    private int netProfitTotal;
    private int expenseTotal;

    // 수익에 대한 카테고리별 수익합계
    private int AdTotalIncome;
    private int MerchTotalIncome;
    private int SponTotalIncome;
    private int DonationTotalIncome;
    private int EtcTotalIncome;


    // 지출에 대한 카테고리별 지출합계
    private int MarketTotalExpense;
    private int SoftWareTotalExpense;
    private int OutSourceTotalExpense;
    private int EquipTotalExpense;
    private int EtcTotalExpense;

}