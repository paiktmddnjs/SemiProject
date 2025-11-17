package com.kh.spring.model.vo;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class TopThree {

    private String category;
    private String financialName;
    private int amount;

}
