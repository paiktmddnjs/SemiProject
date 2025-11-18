<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>콘텐츠 관리 대시보드</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Arimo:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insert.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arimo', sans-serif;
            background-color: #F9FAFB;
            color: #0A0A0A;
            font-size: 14px;
            line-height: 20px;
        }

        .container {
            padding: 24px;
            max-width: 1920px;
            margin: 0 auto;
        }

        /* Header */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            flex-wrap: wrap;
            gap: 16px;
        }

        .header-subtitle {
            color: #64748B;
            font-size: 16px;
            line-height: 24px;
        }

        .btn-primary {
            display: flex;
            align-items: center;
            gap: 12px;
            background-color: #F54900;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            font-family: 'Arimo', sans-serif;
            font-size: 14px;
            transition: background-color 0.2s;
        }

        .btn-primary:hover {
            background-color: #E04800;
        }

        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 16px;
            margin-bottom: 24px;
        }

        .stat-card {
            background: white;
            border-radius: 14px;
            border: 1.11px solid #FFEDD4;
            padding: 24px;
        }

        .stat-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }

        .stat-card-content {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .stat-value {
            color: #EA580C;
            font-size: 24px;
            font-weight: 700;
            line-height: 32px;
        }

        .stat-subtitle {
            color: #64748B;
            font-size: 12px;
            line-height: 16px;
        }

        .trend-positive {
            color: #219807;
        }

        /* Charts Grid */
        .charts-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 24px;
            margin-bottom: 24px;
        }

        .chart-card {
            background: white;
            border-radius: 14px;
            border: 1.11px solid #FFEDD4;
            padding: 24px;
        }

        .chart-header {
            margin-bottom: 24px;
        }

        .chart-header h3 {
            color: #0A0A0A;
            font-size: 16px;
            line-height: 16px;
            margin-bottom: 8px;
        }

        .chart-header p {
            color: #64748B;
            font-size: 16px;
            line-height: 24px;
        }

        .chart-container {
            height: 350px;
            position: relative;
        }

        /* Tables */
        .table-card {
            background: white;
            border-radius: 14px;
            border: 1.11px solid #FFEDD4;
            padding: 24px;
            margin-bottom: 24px;
        }

        .table-header {
            margin-bottom: 24px;
        }

        .table-header h3 {
            color: #0A0A0A;
            font-size: 16px;
            line-height: 16px;
            margin-bottom: 8px;
        }

        .table-header p {
            color: #64748B;
            font-size: 16px;
            line-height: 24px;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            text-align: left;
            padding: 12px 8px;
            color: #0A0A0A;
            font-weight: 400;
            border-bottom: 1.11px solid rgba(0, 0, 0, 0.1);
        }

        td {
            padding: 12px 8px;
            color: #0A0A0A;
            border-bottom: 1.11px solid rgba(0, 0, 0, 0.1);
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        .category-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .category-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
        }

        .category-tag {
            padding: 4px 12px;
            border-radius: 8px;
            font-size: 12px;
            line-height: 16px;
            border: 1.11px solid;
        }

        .icon-value {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .platform-badge {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .platform-icon {
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .platform-icon.youtube {
            color: #E7000B;
        }

        .platform-icon.instagram {
            color: #E60076;
        }

        .platform-icon.tiktok {
            background: black;
            border-radius: 6px;
        }

        .status-badge {
            padding: 4px 12px;
            background-color: #F54900;
            color: white;
            border-radius: 8px;
            font-size: 12px;
            line-height: 16px;
            display: inline-block;
        }

        /* Category Filter */
        .category-filter {
            display: inline-flex;
            align-items: center;
            gap: 0;
            background: #FFF7ED;
            border-radius: 14px;
            padding: 4px;
            margin-bottom: 24px;
        }

        .category-btn {
            padding: 4px 12px;
            border: none;
            border-radius: 14px;
            background: transparent;
            color: #0A0A0A;
            cursor: pointer;
            font-family: 'Arimo', sans-serif;
            font-size: 14px;
            transition: all 0.2s;
            white-space: nowrap;
        }

        .category-btn:hover {
            background: rgba(245, 73, 0, 0.1);
        }

        .category-btn.active {
            background: #F54900;
            color: white;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }

            .charts-grid {
                grid-template-columns: 1fr;
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
            }

            .table-container {
                overflow-x: scroll;
            }

            table {
                min-width: 800px;
            }
        }

        /* Icons */
        .icon-sm {
            width: 12px;
            height: 12px;
        }

        svg {
            flex-shrink: 0;
        }
    </style>
</head>
<body>
<%
    // JSP에서 사용할 데이터 설정 (실제로는 Controller에서 Model에 담아 전달

    // 파라미터로 받은 카테고리 필터 (없으면 '전체')
    String selectedCategory = request.getParameter("category");
    if (selectedCategory == null || selectedCategory.isEmpty()) {
        selectedCategory = "전체";
    }
    request.setAttribute("selectedCategory", selectedCategory);
%>

<div class="container">
    <!-- Header -->
    <div class="header">
        <p class="header-subtitle">업로드된 콘텐츠를 관리하고 카테고리별 성과를 추적하세요</p>
        <button class="btn-primary" onclick="openModal()">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <line x1="12" y1="5" x2="12" y2="19"></line>
                <line x1="5" y1="12" x2="19" y2="12"></line>
            </svg>
            <span>새 콘텐츠 등록</span>
        </button>
    </div>

    <!-- Stats Cards -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-card-header">
                <span>총 콘텐츠</span>
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F54900" stroke-width="2">
                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                    <polyline points="14 2 14 8 20 8"></polyline>
                </svg>
            </div>
            <div class="stat-card-content">
                <div class="stat-value">${ContentCount}개</div>
                <div class="stat-subtitle">이번 달 <span style="color: ${PrevMonthContent > 0 ? '#219807' : (PrevMonthContent < 0 ? '#F08080' : '#808080')};">
                    ${PrevMonthContent > 0 ? '+' : ''}${PrevMonthContent}
                </span>개</div>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-card-header">
                <span>총 조회수</span>
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F54900" stroke-width="2">
                    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                    <circle cx="12" cy="12" r="3"></circle>
                </svg>
            </div>
            <div class="stat-card-content">
                <div class="stat-value">${ViewCount}</div>
                <div class="stat-subtitle">
                    전월 대비 <span class="trend-positive">${PrevMonthPercent}%</span>
                </div>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-card-header">
                <span>평균 좋아요</span>
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F54900" stroke-width="2">
                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                </svg>
            </div>
            <div class="stat-card-content">
                <div class="stat-value">${AvergeLikeCount}</div>
                <div class="stat-subtitle">콘텐츠당 평균</div>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-card-header">
                <span>평균 댓글</span>
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F54900" stroke-width="2">
                    <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
                </svg>
            </div>
            <div class="stat-card-content">
                <div class="stat-value">${AvergeViewCount}</div>
                <div class="stat-subtitle">콘텐츠당 평균</div>
            </div>
        </div>
    </div>

    <!-- Charts -->
    <div class="charts-grid">
        <!-- Bar Chart -->
        <div class="chart-card">
            <div class="chart-header">
                <h3>카테고리별 콘텐츠 수</h3>
                <p>카테고리별 콘텐츠 분포</p>
            </div>
            <div class="chart-container">
                <canvas id="barChart"></canvas>
            </div>
        </div>

        <!-- Pie Chart -->
        <div class="chart-card">
            <div class="chart-header">
                <h3>카테고리별 조회수 비중</h3>
                <p>전체 조회수 중 카테고리별 비중</p>
            </div>
            <div class="chart-container">
                <canvas id="pieChart"></canvas>
            </div>
        </div>
    </div>

    <!-- Category Stats Table -->
    <div class="table-card">
        <div class="table-header">
            <h3>카테고리별 상세 통계</h3>
            <p>카테고리별 성과 비교</p>
        </div>
        <div class="table-container">
            <table class="stats-table">
                <thead>
                <tr>
                    <th>카테고리</th>
                    <th>콘텐츠 수</th>
                    <th>총 조회수</th>
                    <th>총 좋아요수</th>
                    <th>총 댓글수</th>
                </tr>
                </thead>
                <tbody id="categoryStatsBody">
                <%-- 실제 환경에서는 categoryStatsList를 Model에서 받아 사용 --%>
                <c:forEach var="stat" items="${CategoricalDetailList}">
                    <tr>
                        <td>
                            <div class="category-badge">
                                <c:choose>
                                    <%-- 1. 리뷰 (가장 진한/명확한 주황 계열) --%>
                                    <c:when test="${fn:toLowerCase(stat.category) eq '리뷰'}">
                                        <div class="category-dot" style="background-color: #ff9804;"></div> </c:when>

                                    <%-- 2. 엔터테인먼트 (연한 주황/살구색) --%>
                                    <c:when test="${fn:toLowerCase(stat.category) eq '엔터테인먼트'}">
                                        <div class="category-dot" style="background-color: #f8b96c;"></div> </c:when>

                                    <%-- 3. 브이로그 (더 연한 분홍/파스텔톤) --%>
                                    <c:when test="${fn:toLowerCase(stat.category) eq '브이로그'}">
                                        <div class="category-dot" style="background-color: #eca3a3;"></div> </c:when>

                                    <%-- 4. 튜토리얼 (가장 연한 노란/아이보리 계열) --%>
                                    <c:when test="${fn:toLowerCase(stat.category) eq '튜토리얼'}">
                                        <div class="category-dot" style="background-color: #f5f5aa;"></div> </c:when>

                                    <%-- 5. 소통 (옅은 회색 또는 매우 연한 색상) --%>
                                    <c:when test="${fn:toLowerCase(stat.category) eq '소통'}">
                                        <div class="category-dot" style="background-color: #ffd4d4;"></div> </c:when>

                                    <%-- 기타 (기본색: 회색) --%>
                                    <c:otherwise>
                                        <div class="category-dot" style="background-color: #fff0f0;"></div>
                                    </c:otherwise>
                                </c:choose>
                                <span>${stat.category}</span>
                            </div>
                        </td>
                        <td>${stat.content_count}개</td>
                        <td><fmt:formatNumber value="${stat.total_views}" pattern="#,###"/></td>
                        <td>
                            <div class="icon-value">
                                <svg class="icon-sm" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                                </svg>
                                <span><fmt:formatNumber value="${stat.total_likes}" pattern="#,###"/></span>
                            </div>
                        </td>
                        <td>
                            <div class="icon-value">
                                <svg class="icon-sm" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
                                </svg>
                                <span><fmt:formatNumber value="${stat.total_comments}" pattern="#,###"/></span>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Category Filter -->



    <!-- Content Table -->
    <div class="table-card">
        <div class="table-header">
            <h3>${selectedCategory} 콘텐츠</h3>
            <p>
                <c:choose>
                    <c:when test="${selectedCategory eq '전체'}">모든 카테고리의 콘텐츠 목록</c:when>
                    <c:otherwise>${selectedCategory} 카테고리의 콘텐츠 목록</c:otherwise>
                </c:choose>
            </p>
        </div>
        <div class="table-container">
            <table class="content-table">
                <thead>
                <tr>
                    <th>플랫폼</th>
                    <th>제목</th>
                    <th>카테고리</th>
                    <th>업로드일</th>
                    <th>조회수</th>
                    <th>좋아요</th>
                    <th>댓글</th>
                    <th>상태</th>
                </tr>
                </thead>
                <tbody>
                <%-- 실제 환경에서는 contentList를 Model에서 받아 사용 --%>
                <c:forEach var="content" items="${contentList2}">
                    <tr>
                        <td>
                            <div class="platform-badge">
                                <div class="platform-icon ${content.platformIcon}">
                                    <c:choose>
                                        <c:when test="${fn:toLowerCase(content.platformIcon) eq 'youtube'}">
                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                                    <%-- 배경 (붉은색 둥근 사각형)과 재생 버튼 (흰색 삼각형)을 하나의 SVG로 표현 --%>
                                                <path d="M22 5.5C22 3.5 20.5 2 18.5 2H5.5C3.5 2 2 3.5 2 5.5V18.5C2 20.5 3.5 22 5.5 22H18.5C20.5 22 22 20.5 22 18.5V5.5ZM10 15V9L16 12L10 15Z"
                                                      fill="#FF0000" />

                                                    <%-- 재생 버튼을 별도로 Path로 추가 (더 명확한 분리를 위해) --%>
                                                <path d="M10 9L16 12L10 15Z" fill="#FFFFFF" />
                                            </svg>
                                        </c:when>
                                        <c:when test="${fn:toLowerCase(content.platformIcon) eq 'instagram'}">
                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                                    <%-- 둥근 사각형을 Path로 변환 --%>
                                                <path d="M7 2h10a5 5 0 0 1 5 5v10a5 5 0 0 1-5 5H7a5 5 0 0 1-5-5V7a5 5 0 0 1 5-5z" />

                                                    <%-- 원은 그대로 circle 태그 유지 (가장 효율적) --%>
                                                <circle cx="12" cy="12" r="4"></circle>
                                            </svg>
                                        </c:when>
                                        <%-- 💡 Twitch 아이콘 추가 --%>
                                        <c:when test="${fn:toLowerCase(content.platformIcon) eq 'twitch'}">
                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" stroke="none">
                                                    <%-- Twitch 로고의 복잡한 형태를 Path로 표현 --%>
                                                <path d="M11.53 17.51L9.62 19.38L9.93 17.51L6.96 17.51L6.96 5.51L18.96 5.51L18.96 17.51L11.53 17.51ZM22 5V18L18 22H13L9 18H5V18V2H22V5Z" />
                                            </svg>
                                        </c:when>
                                        <%-- 아이콘이 정의되지 않은 경우 --%>
                                        <c:otherwise>
                                            <div style="width: 20px; height: 20px; background: yellow; border-radius: 6px;"></div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <span>${content.platform}</span>
                            </div>
                        </td>
                        <td>${content.title}</td>
                        <td>
                            <!-- category 소문자 변환 -->
                            <c:set var="cat" value="${fn:toLowerCase(content.category)}" />

                            <!-- category에 따라 색상 결정 -->
                            <c:choose>
                                <c:when test="${cat eq '리뷰'}">
                                    <c:set var="color" value="#FFB347" />
                                </c:when>
                                <c:when test="${cat eq '브이로그'}">
                                    <c:set var="color" value="#FF70A6" />
                                </c:when>
                                <c:when test="${cat eq '엔터테인먼트'}">
                                    <c:set var="color" value="#A0C4FF" />
                                </c:when>
                                <c:when test="${cat eq '소통'}">
                                    <c:set var="color" value="#B388EB" />
                                </c:when>
                                <c:when test="${cat eq '튜토리얼'}">
                                    <c:set var="color" value="#66CDAA" />
                                </c:when>
                                <c:otherwise>
                                    <c:set var="color" value="#6C757D" />
                                </c:otherwise>
                            </c:choose>

                            <!-- 스타일 적용 -->
                            <span class="category-tag"
                                  style="color:${color}; border-color:${color};">
                                    ${content.category}
                            </span>
                        </td>
                        <td><c:choose>
                            <c:when test="${not empty content.uploadDate}">
                                <fmt:formatDate value="${content.uploadDate}" pattern="yyyy-MM-dd"/>
                            </c:when>
                            <c:otherwise>
                                -
                            </c:otherwise>
                        </c:choose></td>
                        <td>
                            <div class="icon-value">
                                <svg class="icon-sm" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                    <circle cx="12" cy="12" r="3"></circle>
                                </svg>
                                <span><fmt:formatNumber value="${content.views}" pattern="#,###"/></span>
                            </div>
                        </td>
                        <td>
                            <div class="icon-value">
                                <svg class="icon-sm" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                                </svg>
                                <span><fmt:formatNumber value="${content.likes}" pattern="#,###"/></span>
                            </div>
                        </td>
                        <td>
                            <div class="icon-value">
                                <svg class="icon-sm" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
                                </svg>
                                <span><fmt:formatNumber value="${content.comments}" pattern="#,###"/></span>
                            </div>
                        </td>
                        <td>
                            <span class="status-badge">${content.contentStatus}</span>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div id="modalOverlay" class="modal-overlay" onclick="handleOverlayClick(event)">
    <div class="modal-content">
        <!-- Header -->
        <div class="modal-header">
            <button class="close-btn" onclick="closeModal()">
                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2">
                    <line x1="4" y1="4" x2="12" y2="12"></line>
                    <line x1="12" y1="4" x2="4" y2="12"></line>
                </svg>
            </button>

            <h2 class="modal-title">새 콘텐츠 등록</h2>
            <p class="modal-subtitle">업로드한 콘텐츠를 등록하세요</p>
        </div>

        <!-- Form -->
        <form id="contentForm" class="modal-form" onsubmit="handleSubmit(event)">
            <!-- Platform -->
            <div class="form-group">
                <label class="form-label">플랫폼</label>
                <select name="platform" class="form-select" required>
                    <option value="">플랫폼 선택</option>
                    <option value="YouTube">YouTube</option>
                    <option value="Instagram">Instagram</option>
                    <option value="TikTok">TikTok</option>
                    <option value="Facebook">Facebook</option>
                </select>
            </div>

            <!-- Title -->
            <div class="form-group">
                <label class="form-label">콘텐츠 제목</label>
                <input
                        type="text"
                        name="title"
                        class="form-input"
                        placeholder="제목을 입력하세요"
                        required
                >
            </div>

            <!-- Category -->
            <div class="form-group">
                <label class="form-label">카테고리</label>
                <select name="category" class="form-select" required>
                    <option value="">카테고리 선택</option>
                    <option value="리뷰">리뷰</option>
                    <option value="브이로그">브이로그</option>
                    <option value="튜토리얼">튜토리얼</option>
                    <option value="소통">소통</option>
                    <option value="엔터테인먼트">엔터테인먼트</option>
                </select>
            </div>

            <!-- Upload Date -->
            <div class="form-group">
                <label class="form-label">업로드 날짜</label>
                <input
                        type="date"
                        name="uploadDate"
                        class="form-input"
                        required
                >
            </div>

            <!-- Status -->
            <div class="form-group">
                <label class="form-label">상태</label>
                <select name="status" class="form-select" required>
                    <option value="">상태 선택</option>
                    <option value="게시됨">게시됨</option>
                    <option value="임시저장">임시저장</option>
                    <option value="예약">예약</option>
                </select>
            </div>

            <!-- URL -->
            <div class="form-group">
                <label class="form-label">콘텐츠 URL</label>
                <input
                        type="url"
                        name="url"
                        class="form-input"
                        placeholder="https://..."
                        required
                >
            </div>

            <!-- Memo -->
            <div class="form-group large">
                <label class="form-label">메모</label>
                <textarea
                        name="memo"
                        class="form-textarea"
                        placeholder="콘텐츠 관련 메모"
                        rows="3"
                ></textarea>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="submit-btn">저장</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    // 차트 데이터는 서버에서 JSON으로 전달받아 사용
    const chartData = {
        barChart: {
            labels: ['리뷰', '브이로그', '엔터테인먼트', '소통', '튜토리얼'],
            data: [
                <c:forEach var="item1" items="${CategoricalContentList}" varStatus="status">
                ${item1.contentByCategroy}${status.last ? '' : ','}
                </c:forEach>
            ],
            colors: ['#EA580C', '#FB923C', '#FFEDD5', '#FED7AA', '#FDBA74']
        },
        pieChart: {
                labels: [
                    <c:forEach var="item2" items="${CategoricalViewsList}" varStatus="status">
                    '<c:out value="${item2.category}"/>'
                    ${status.last ? '' : ','}
                    </c:forEach>
                    ${percent}
                ],
            data: [
                <c:forEach var="item2" items="${CategoricalViewsList}" varStatus="status">
                ${item2.viewByCategroy}${status.last ? '' : ','}
                </c:forEach>
            ],
            colors: ['#EA580C', '#FB923C', '#FFEDD5', '#FED7AA', '#FDBA74']
        }
    };

    // Bar Chart
    const barCtx = document.getElementById('barChart').getContext('2d');
    new Chart(barCtx, {
        type: 'bar',
        data: {
            labels: chartData.barChart.labels,
            datasets: [{
                data: chartData.barChart.data,
                backgroundColor: '#EA580C',
                barThickness: 88,
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    max: 2,
                    ticks: {
                        stepSize: 0.5,
                        color: '#717182',
                        font: {
                            size: 12
                        }
                    },
                    grid: {
                        color: '#f0f0f0',
                        drawBorder: false
                    }
                },
                x: {
                    ticks: {
                        color: '#717182',
                        font: {
                            size: 12
                        }
                    },
                    grid: {
                        display: false,
                        drawBorder: false
                    }
                }
            }
        }
    });

    // Pie Chart
    const pieCtx = document.getElementById('pieChart').getContext('2d');
    new Chart(pieCtx, {
        type: 'pie',
        data: {
            labels: chartData.pieChart.labels,
            datasets: [{
                data: chartData.pieChart.data,
                backgroundColor: chartData.pieChart.colors,
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return context.label;
                        }
                    }
                }
            }
        }
    });

    function openModal() {
        const overlay = document.getElementById('modalOverlay');
        overlay.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeModal() {
        const overlay = document.getElementById('modalOverlay');
        overlay.classList.remove('active');
        document.body.style.overflow = '';

        // Reset form
        document.getElementById('contentForm').reset();
    }

    function handleOverlayClick(event) {
        // Close modal when clicking outside the modal content
        if (event.target === event.currentTarget) {
            closeModal();
        }
    }

    // Form submission
    function handleSubmit(event) {
        event.preventDefault();

        // Get form data
        const formData = new FormData(event.target);
        const data = Object.fromEntries(formData.entries());

        // Log the data (in a real app, you would send this to a server)
        console.log('등록된 콘텐츠:', data);

        // Show success message
        const successMsg = document.getElementById('successMessage');
        successMsg.classList.add('show');

        // Hide success message after 3 seconds
        setTimeout(() => {
            successMsg.classList.remove('show');
        }, 3000);

        // Close modal
        closeModal();
    }

    // Close modal on ESC key
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            const overlay = document.getElementById('modalOverlay');
            if (overlay.classList.contains('active')) {
                closeModal();
            }
        }
    });

    // Set today's date as default
    document.addEventListener('DOMContentLoaded', function() {
        const dateInput = document.querySelector('input[type="date"]');
        const today = new Date().toISOString().split('T')[0];
        dateInput.value = today;
    });

</script>
</body>
</html>
