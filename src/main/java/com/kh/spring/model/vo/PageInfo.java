package com.kh.spring.model.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PageInfo {
    private int listCount;      // 총 게시글 수
    private int currentPage;    // 현재 페이지 (요청 페이지)
    private int pageLimit;      // 페이지 그룹 당 버튼 수 (예: 10)
    private int boardLimit;     // 한 페이지 당 게시글 수 (요청사항: 6)

    private int maxPage;        // 가장 마지막 페이지
    private int startPage;      // 현재 페이지 그룹의 시작 페이지
    private int endPage;        // 현재 페이지 그룹의 끝 페이지

    // 기본 생성자, 매개변수 생성자, Getter/Setter 필요

    // 계산 로직은 Controller/Service에서 처리하고, 이 필드에 담아 JSP로 전달합니다.

    public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
        this.listCount = listCount;
        this.currentPage = currentPage;
        this.pageLimit = pageLimit;
        this.boardLimit = boardLimit;

        // 1. maxPage (총 페이지 수)
        // (총 데이터 수 / 한 페이지당 개수)의 올림 계산
        this.maxPage = (int)Math.ceil((double)listCount / boardLimit);

        // 2. startPage (현재 페이지 그룹의 시작 번호)
        // (현재 페이지 - 1) / 페이지 그룹 버튼 수 * 페이지 그룹 버튼 수 + 1
        this.startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

        // 3. endPage (현재 페이지 그룹의 마지막 번호)
        this.endPage = startPage + pageLimit - 1;

        // maxPage가 endPage보다 작으면, endPage를 maxPage로 설정
        if(endPage > maxPage) {
            this.endPage = maxPage;
        }
    }

}
