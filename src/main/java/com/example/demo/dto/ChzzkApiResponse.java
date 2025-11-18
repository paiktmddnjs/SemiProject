package com.example.demo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

/**
 * 치지직 API 공통 응답 래퍼
 * @param <T> content 타입
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ChzzkApiResponse<T> {
    
    @JsonProperty("code")
    private Integer code;
    
    @JsonProperty("message")
    private String message;
    
    @JsonProperty("content")
    private T content;
    
    /**
     * 응답이 성공인지 확인
     */
    public boolean isSuccess() {
        return code != null && code == 200;
    }
}

