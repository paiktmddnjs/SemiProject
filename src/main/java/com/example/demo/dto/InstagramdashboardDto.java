package com.example.demo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.Date;

public class InstagramdashboardDto {

    // 공통 필드 (JSP에서 사용)
    private String name;      // 채널 이름
    private String handle;    // 계정 핸들
    private Long subs;        // 팔로워 수
    private Long views;       // 조회수 (API용, DB에는 없음 → 0)
    private int mediaCount;   // 게시물 수

    // DB용 필드
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
    private String chanelCount;       // 게시물 수

    @JsonProperty("CHANEL_FOLLOWER")
    private String chanelFollower;    // 팔로워 수

    // 생성자 (API용)

    public InstagramdashboardDto(String name, String handle, long subs, long views, int mediaCount) {
        this.name = name;
        this.handle = handle;
        this.subs = subs;
        this.views = 0L;
        this.mediaCount = mediaCount;
    }
    // 기본 생성자
    public InstagramdashboardDto() {}

    // EL용 Getter
    public Long getSubs() {
        return this.subs != null ? this.subs : (chanelFollower != null ? Long.parseLong(chanelFollower) : 0L);
    }

    public Long getViews() {
        return this.views != null ? this.views : 0L;
    }

    public int getPosts() {
        return mediaCount != 0 ? mediaCount : (chanelCount != null ? Integer.parseInt(chanelCount) : 0);
    }

    public Long getVideos() {
        return (long) getPosts();
    }

    // 일반 Getter / Setter
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getHandle() { return handle; }
    public void setHandle(String handle) { this.handle = handle; }

    public void setSubs(Long subs) { this.subs = subs; }
    public void setViews(Long views) { this.views = views; }
    public void setMediaCount(int mediaCount) { this.mediaCount = mediaCount; }

    public Long getChanelId() { return chanelId; }
    public void setChanelId(Long chanelId) { this.chanelId = chanelId; }

    public Long getMemberId() { return memberId; }
    public void setMemberId(Long memberId) { this.memberId = memberId; }

    public String getChanelName() { return chanelName; }
    public void setChanelName(String chanelName) { this.chanelName = chanelName; }

    public String getPlatformType() { return platformType; }
    public void setPlatformType(String platformType) { this.platformType = platformType; }

    public Long getPlatfromSubscribe() { return platfromSubscribe; }
    public void setPlatfromSubscribe(Long platfromSubscribe) { this.platfromSubscribe = platfromSubscribe; }

    public String getChanelStatus() { return chanelStatus; }
    public void setChanelStatus(String chanelStatus) { this.chanelStatus = chanelStatus; }

    public Date getChanelCreate() { return chanelCreate; }
    public void setChanelCreate(Date chanelCreate) { this.chanelCreate = chanelCreate; }

    public String getChanelUrl() { return chanelUrl; }
    public void setChanelUrl(String chanelUrl) { this.chanelUrl = chanelUrl; }

    public String getChanelCount() { return chanelCount; }
    public void setChanelCount(String chanelCount) { this.chanelCount = chanelCount; }

    public String getChanelFollower() { return chanelFollower; }
    public void setChanelFollower(String chanelFollower) { this.chanelFollower = chanelFollower; }
}
