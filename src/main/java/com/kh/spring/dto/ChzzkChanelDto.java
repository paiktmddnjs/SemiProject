package com.kh.spring.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.util.Date;

/**
 * 치지직 채널 DTO (DB 저장용)
 * Entity를 DTO로 변환하여 MyBatis에서 사용
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ChzzkChanelDto {
    
    @JsonProperty("CHANEL_ID")
    private Long chanelId;
    
    @JsonProperty("MEMBER_ID")
    private Long memberId;
    
    @JsonProperty("CHANEL_NAME")
    private String chanelName;
    
    @JsonProperty("PLATFORM_TYPE")
    private String platformType;
    
    @JsonProperty("PLATFROM_SUBSCRIBE")
    private Long platfromSubscribe;
    
    @JsonProperty("CHANEL_STATUS")
    private String chanelStatus;
    
    @JsonProperty("CHANEL_CREATE")
    private Date chanelCreate;
    
    @JsonProperty("CHANEL_URL")
    private String chanelUrl;
    
    @JsonProperty("CHANEL_COUNT")
    private String chanelCount;
    
    @JsonProperty("CHANEL_FOLLOWER")
    private String chanelFollower;
}

