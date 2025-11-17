package com.kh.spring.model.vo;


import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Financial {
    /** FINACIAL_ID NUMBER NOT NULL PRIMARY KEY */
    private int financialId;

    /** CONTRACT_ID NUMBER NULL (FK) */
    private Integer contractId; // NULL 가능성이 있으므로 래퍼(Wrapper) 클래스 Integer 사용

    /** MEMBER_ID NUMBER NOT NULL (FK) */
    private int memberId;

    /** FINACIAL_NAME VARCHAR2(100) NOT NULL */
    private String financialName;

    /** FINACIAL_AMOUNT NUMBER NULL */
    private Integer financialAmount; // 금액이 NULL 가능성이 있다면 Integer 또는 Long 사용

    /** FINACIAL_DATE DATE NOT NULL */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date financialDate;

    /** FINACIAL_STATUS VARCHAR2(1) DEFAULT 'Y' NOT NULL */
    private String financialStatus;

    /** CATEGORY VARCHAR2(50) NOT NULL */
    private String category;

    /** FINACIAL_TYPE VARCHAR2(10) NOT NULL */
    private String financialType;

}
