package com.kh.spring.model.vo;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Categorical {

    private String category;

    private int contentByCategory;

    private int ViewByCategroy;

    private int content_count;

    private int total_views;

    private int total_likes;

    private int total_comments;




}
