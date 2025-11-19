package com.kh.spring.model.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class StatusContainer {
    private String statusName;
    private int statusId;
    private int statusTodo;
    private int statusProgress;
    private int statusComplete;
    private int statusSum;
}
