package com.kh.spring.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.util.List;

/**
 * 치지직 채널 목록 content DTO
 * API 응답의 content 부분: {data: [...]}
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ChzzkChannelListContentDto {
    
    @JsonProperty("data")
    private List<ChzzkChannelDto> data;
}

