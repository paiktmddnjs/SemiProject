
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            color: #EA580C;
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
    // JSP에서 사용할 데이터 설정 (실제로는 Controller에서 Model에 담아 전달)
    request.setAttribute("totalContent", 8);
    request.setAttribute("totalViews", "153.5K");
    request.setAttribute("viewsGrowth", "+12.5%");
    request.setAttribute("avgLikes", "1,680");
    request.setAttribute("avgComments", "170");
    request.setAttribute("monthlyContentIncrease", "+8개");

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
                <div class="stat-value">${totalContent}개</div>
                <div class="stat-subtitle">이번 달 ${monthlyContentIncrease}</div>
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
                <div class="stat-value">${totalViews}</div>
                <div class="stat-subtitle">
                    <span class="trend-positive">${viewsGrowth}</span> 전월 대비
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
                <div class="stat-value">${avgLikes}</div>
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
                <div class="stat-value">${avgComments}</div>
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
                <c:forEach var="stat" items="${categoryStatsList}">
                    <tr>
                        <td>
                            <div class="category-badge">
                                <div class="category-dot" style="background-color: ${stat.color}"></div>
                                <span>${stat.name}</span>
                            </div>
                        </td>
                        <td>${stat.count}개</td>
                        <td><fmt:formatNumber value="${stat.views}" pattern="#,###"/></td>
                        <td>
                            <div class="icon-value">
                                <svg class="icon-sm" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                                </svg>
                                <span><fmt:formatNumber value="${stat.likes}" pattern="#,###"/></span>
                            </div>
                        </td>
                        <td>
                            <div class="icon-value">
                                <svg class="icon-sm" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
                                </svg>
                                <span><fmt:formatNumber value="${stat.comments}" pattern="#,###"/></span>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Category Filter -->
    <div class="category-filter">
        <c:forEach var="cat" items="${['전체', '리뷰', '브이로그', '튜토리얼', '소통', '엔터테인먼트']}">
            <form action="dashboard.jsp" method="get" style="display: inline;">
                <input type="hidden" name="category" value="${cat}">
                <button type="submit" class="category-btn ${selectedCategory eq cat ? 'active' : ''}">
                        ${cat}
                </button>
            </form>
        </c:forEach>
    </div>



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
                <c:forEach var="content" items="${contentList}">
                    <tr>
                        <td>
                            <div class="platform-badge">
                                <div class="platform-icon ${content.platformIcon}">
                                    <c:choose>
                                        <c:when test="${content.platformIcon eq 'youtube'}">
                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                                <rect x="2" y="6" width="20" height="12" rx="2"></rect>
                                                <circle cx="12" cy="12" r="3"></circle>
                                            </svg>
                                        </c:when>
                                        <c:when test="${content.platformIcon eq 'instagram'}">
                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                                <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
                                                <circle cx="12" cy="12" r="4"></circle>
                                            </svg>
                                        </c:when>
                                        <c:otherwise>
                                            <div style="width: 20px; height: 20px; background: black; border-radius: 6px;"></div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <span>${content.platform}</span>
                            </div>
                        </td>
                        <td>${content.title}</td>
                        <td>
                                    <span class="category-tag" style="color: ${content.categoryColor}; border-color: ${content.categoryColor}">
                                            ${content.category}
                                    </span>
                        </td>
                        <td><fmt:formatDate value="${content.uploadDate}" pattern="yyyy-MM-dd"/></td>
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
                            <span class="status-badge">${content.status}</span>
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
            data: [2, 2, 2, 1, 1]
        },
        pieChart: {
            labels: ['리뷰 17%', '브이로그 17%', '엔터테인먼트 50%', '소통 8%', '튜토리얼 6%'],
            data: [17, 17, 50, 8, 6],
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
