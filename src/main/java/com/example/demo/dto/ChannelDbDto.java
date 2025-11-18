package com.example.demo.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ChannelDbDto {
    private Long chanelId;
    private Long memberId;
    private String name;
    private String platformType;
    private Long subs;
    private String chanelUrl;
    private Long views;
    private Long videos;
    private String status;
}
