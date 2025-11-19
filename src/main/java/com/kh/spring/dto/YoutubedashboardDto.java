package com.kh.spring.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class YoutubedashboardDto {

    @JsonProperty("CHANEL_ID")
    private Long chanelId;

    @JsonProperty("MEMBER_ID")
    private int memberId;

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
    private String chanelCount;       // 게시물 수

    @JsonProperty("CHANEL_FOLLOWER")
    private String chanelFollower;    // 팔로워 수


    private String name;      // 채널 이름
    private String handle;    // 계정 핸들
    private Long subs;        // 팔로워 수
    private Long views;       // 조회수 (API용, DB에는 없음 → 0)
    private int videos;   // 게시물 수



    public YoutubedashboardDto(String chanelName, String chanelNameForHandle,
                               Long platfromSubscribe, String chanelCount, String chanelFollower) {
        this.name = chanelName;
        this.handle = chanelNameForHandle; // 임시로 name 사용
        this.subs = platfromSubscribe;
        this.views = parseLongSafe(chanelCount);
        this.videos = parseIntSafe(chanelFollower);
    }

    private Long parseLongSafe(String value) {
        try {
            return value != null ? Long.parseLong(value) : 0L;
        } catch (NumberFormatException e) {
            return 0L;
        }
    }

    private int parseIntSafe(String value) {
        try {
            return value != null ? Integer.parseInt(value) : 0;
        } catch (NumberFormatException e) {
            return 0;
        }
    }
    public String getName() { return name; }
    public String getHandle() { return handle; }
    public Long getSubs() { return subs; }

    public Long getViews() { return views; }
    public int getVideos() { return videos; }

    // ... 나머지 Getter/Setter 생략 ...
}
