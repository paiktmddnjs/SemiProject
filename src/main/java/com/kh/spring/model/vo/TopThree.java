package com.kh.spring.model.vo;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class TopThree {

    public static final TopThree DUMMY = null;
    private String category;
    private String financialName;
    private int amount;

}
