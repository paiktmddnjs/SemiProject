package com.kh.spring.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

/**
 * 치지직 채널 정보 DTO
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ChzzkChannelDto {
    
    @JsonProperty("channelId")
    private String channelId;
    
    @JsonProperty("channelName")
    private String channelName;
    
    @JsonProperty("channelImageUrl")
    private String channelImageUrl;
    
    @JsonProperty("followerCount")
    private Long followerCount;

}

