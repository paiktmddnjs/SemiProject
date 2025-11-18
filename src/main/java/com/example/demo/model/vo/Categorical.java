package com.example.demo.model.vo;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Categorical {

    private String category;

    private int ContentByCategroy;

    private int ViewByCategroy;

    private int content_count;

    private int total_views;

    private int total_likes;

    private int total_comments;




}
