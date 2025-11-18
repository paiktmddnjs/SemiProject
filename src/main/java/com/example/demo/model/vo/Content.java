package com.example.demo.model.vo;


import lombok.*;

import java.util.Date;
// Lombok 라이브러리를 사용할 경우 주석을 해제하세요.
// import lombok.Data;

/**
 * 테이블: CONTENT
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Content {

    // CONTENT_ID NUMBER PRIMARY KEY
    private Integer contentId;

    // CHANEL_ID NUMBER
    private Integer chanelId;

    // PROJECT_ID NUMBER
    private Integer projectId;

    // TITLE VARCHAR2(30) NOT NULL
    private String title;

    // UPLOAD_DATE DATE DEFAULT SYSDATE
    private Date uploadDate;

    // VIEWS VARCHAR2(30) (VARCHAR2로 되어 있지만, 숫자 값으로 처리할 경우 String 대신 Integer/Long 사용을 고려하세요.)
    private String views;

    // LIKES VARCHAR2(30)
    private String likes;

    // COMMENTS VARCHAR2(300) (실제 댓글 내용이 아닌 댓글 수일 가능성이 높다면 Integer/Long 사용 고려)
    private String comments;

    // CONTENT_STATUS VARCHAR2(30)
    private String contentStatus;

    // CONTENT_DESC VARCHAR2(300)
    private String contentDesc;

    // CATEGORY VARCHAR2(30)
    private String category;

    private int ViewsSum;

    private String url;

    private String memo;


    // --- 기본 생성자 (필요 시) ---
}
// ... 나머지 필드에 대한 Getter