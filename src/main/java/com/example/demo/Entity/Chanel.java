package com.example.demo.Entity;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "CHANEL")
public class Chanel {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_CHANEL_ID")
    @SequenceGenerator(name = "SEQ_CHANEL_ID", sequenceName = "SEQ_CHANEL_ID", allocationSize = 1)
    @Column(name = "CHANEL_ID")
    private Long chanelId;

    @Column(name = "MEMBER_ID")
    private Long memberId;

    @Column(name = "CHANEL_NAME", nullable = false)
    private String chanelName;

    @Column(name = "PLATFORM_TYPE", nullable = false)
    private String platformType;

    @Column(name = "PLATFROM_SUBSCRIBE", nullable = false)
    private Long platfromSubscribe;

    @Column(name = "CHANEL_STATUS")
    private String chanelStatus = "Y";

    @Column(name = "CHANEL_CREATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date chanelCreate = new Date();

    @Column(name = "CHANEL_URL")
    private String chanelUrl;

    @Column(name = "CHANEL_COUNT")
    private String chanelCount;

    @Column(name = "CHANEL_FOLLOWER")
    private String chanelFollower;

    // Getter/Setter
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
