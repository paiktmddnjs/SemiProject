<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--
    주의: 이 JSP는 AJAX 요청을 위해 사용되며,
    오직 <table>의 <tbody> 안에 들어갈 <tr>...</tr> HTML 조각만 반환해야 합니다.
--%>
<div id="history-area" class="transaction-container" style="display: none;">

    <header class="section-header">
        <div class="h2-div">
        <h2>최근 거래 내역</h2>
            <div id="filter-buttons">
                <button id="btn-all" class="filter-btn active">전체 보기</button>
                <button id="btn-income" class="filter-btn">수익만 보기</button>
                <button id="btn-expense" class="filter-btn">지출만 보기</button>
            </div>
        </div>
        <p class="subtitle">수익 및 지출 상세 내역</p>
    </header>

    <div class="table-wrapper">
        <table id="transaction-table">
            <thead>
            <tr>
                <th>날짜</th>
                <th>구분</th>
                <th>카테고리</th>
                <th>내역</th>
                <th>금액</th>
                <th>상태</th>
            </tr>
            </thead>

            <tbody>
            <%--
             <tr><td>2025-10-18</td><td><span class="tag expense">지출</span></td><td>장비</td><td>조명 장비 구입</td><td class="amount expense">-250,000원</td><td>지불완료</td></tr>
            --%>
            <c:choose>
                <c:when test="${not empty transactionList}">
                    <c:forEach var="item" items="${transactionList}">
                        <c:set var="isProfit" value="${item.financialType eq '수익'}" />
                        <c:set var="tagClass" value="${isProfit ? 'profit' : 'expense'}" />
                        <c:set var="amountSign" value="${isProfit ? '+' : '-'}" />

                        <tr>
                            <td><fmt:formatDate value="${item.financialDate}" pattern="yyyy-MM-dd"/></td>
                            <td><span class="tag ${tagClass}">${item.financialType}</span></td>
                            <td>${item.category}</td>
                            <td>${item.financialName}</td>

                            <td class="amount ${tagClass}">
                                    ${amountSign}<fmt:formatNumber value="${item.financialAmount}" pattern="#,###"/>원
                            </td>

                                <%-- 상태 로직 --%>
                            <td>  <%-- 상태 로직 --%>
                                <c:choose>
                                    <c:when test="${item.financialStatus eq 'Y'}">${isProfit ? '정산완료' : '지불완료'}</c:when>
                                    <c:when test="${item.financialStatus eq 'N'}">${isProfit ? '정산대기' : '지불대기'}</c:when>
                                    <c:otherwise>알 수 없음</c:otherwise>
                                </c:choose>
                            </td> </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="6" style="text-align:center;">등록된 거래 내역이 없습니다.</td></tr>
                </c:otherwise>
            </c:choose>

            </tbody>

        </table>

        <%--페이지 구현--%>
        <c:set var="currentTabKey" value="${currentTabKey}" />
        <div class="pagination-area" style="text-align:center; margin-top:50px; margin-bottom: 20px;">
            <c:set var="pi" value="${pageInfo}" />

            <%-- ◀ 처음으로 / 이전 페이지 버튼 --%>
            <c:if test="${pi.currentPage > 1}">
                <a href="/financial?page=1" style="margin-right: 5px;">&lt;&lt;</a>
                <a href="/financial?page=${pi.currentPage - 1}" style="margin-right: 15px;">이전</a>
            </c:if>

            <%-- 페이지 번호 목록 --%>
            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                <c:choose>
                    <c:when test="${p eq pi.currentPage}">
                        <span style="font-weight: bold; color: #e10d2c; font-size: 1.1em; margin: 0 5px;">${p}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="/financial?page=${p}" style="margin: 0 5px; color: #555;">${p}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <%-- ▶ 다음 페이지 / 마지막 페이지 버튼 --%>
            <c:if test="${pi.currentPage < pi.maxPage}">
                <a href="/financial?page=${pi.currentPage + 1}" style="margin-left: 15px;">다음</a>
                <a href="/financial?page=${pi.maxPage}" style="margin-left: 5px;">&gt;&gt;</a>
            </c:if>
        </div>
    </div>

</div>