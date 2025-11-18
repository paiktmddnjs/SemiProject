package com.example.demo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

/**
 * 치지직 유저 정보 DTO
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ChzzkUserInfoDto {
    
    @JsonProperty("channelId")
    private String channelId;
    
    @JsonProperty("channelName")
    private String channelName;
    
    @JsonProperty("nickname")
    private String nickname;
}

