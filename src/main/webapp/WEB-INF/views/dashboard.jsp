<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>크리에이터 대시보드</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
</head>
<body>
<%-- ====================================================== --%>
<%-- [임시] 대시보드용 더미 데이터 (DB 연결 전 테스트용) --%>
<%
    // (더미 데이터... 원본과 동일하게 유지)
    java.util.Map<String, Object> channels = new java.util.HashMap<>();
    java.util.Map<String, Object> yt = new java.util.HashMap<>();
    yt.put("name", "afsd"); yt.put("handle", "asdf"); yt.put("subs", "18.3"); yt.put("views", "256.8"); yt.put("videos", 213);
    channels.put("yt", yt);
    java.util.List<java.util.Map<String, Object>> igList = new java.util.ArrayList<>();
    java.util.Map<String, Object> ig1 = new java.util.HashMap<>();
    ig1.put("name", "asdf"); ig1.put("handle", "asdf"); ig1.put("subs", "45.9"); ig1.put("views", "1.2"); ig1.put("posts", 104);
    igList.add(ig1);
    java.util.Map<String, Object> ig2 = new java.util.HashMap<>();
    ig2.put("name", "asfd"); ig2.put("handle", "asdf"); ig2.put("subs", "38.3"); ig2.put("views", "880.8"); ig2.put("posts", 169);
    igList.add(ig2);
    channels.put("ig", igList);
    pageContext.setAttribute("channel", channels);
    java.util.Map<String, String> stats = new java.util.HashMap<>();
    stats.put("totalRevenue", "6,500"); stats.put("revenueGrowth", "24.5"); stats.put("weeklyViews", "159"); stats.put("viewsGrowth", "18.2"); stats.put("engagementRate", "7.5"); stats.put("engagementGrowth", "2.1"); stats.put("activeContracts", "3"); stats.put("activeContractAmount", "6,500");
    pageContext.setAttribute("stats", stats);
    java.util.List<java.util.Map<String, String>> scheduleList = new java.util.ArrayList<>();
    java.util.Map<String, String> sched1 = new java.util.HashMap<>();
    sched1.put("title", "신제품 리뷰 영상"); sched1.put("date", "2025-10-28"); sched1.put("status", "편집중"); sched1.put("platform", "YouTube");
    scheduleList.add(sched1);
    java.util.Map<String, String> sched2 = new java.util.HashMap<>();
    sched2.put("title", "일상 브이로그"); sched2.put("date", "2025-10-29"); sched2.put("status", "촬영완료"); sched2.put("platform", "Instagram");
    scheduleList.add(sched2);
    java.util.Map<String, String> sched3 = new java.util.HashMap<>();
    sched3.put("title", "챌린지 영상"); sched3.put("date", "2025-10-30"); sched3.put("status", "기획"); sched3.put("platform", "Chzzk");
    scheduleList.add(sched3);
    pageContext.setAttribute("schedule", scheduleList);
    java.util.List<java.util.Map<String, String>> contractList = new java.util.ArrayList<>();
    java.util.Map<String, String> contract1 = new java.util.HashMap<>();
    contract1.put("name", "브랜드 A"); contract1.put("amount", "2000000"); contract1.put("status", "진행중"); contract1.put("progress", "60");
    contractList.add(contract1);
    java.util.Map<String, String> contract2 = new java.util.HashMap<>();
    contract2.put("name", "브랜드 B"); contract2.put("amount", "1500000"); contract2.put("status", "대기중"); contract2.put("progress", "30");
    contractList.add(contract2);
    java.util.Map<String, String> contract3 = new java.util.HashMap<>();
    contract3.put("name", "브랜드 C"); contract3.put("amount", "3000000"); contract3.put("status", "정산대기"); contract3.put("progress", "90");
    contractList.add(contract3);
    pageContext.setAttribute("activeContract", contractList);
    java.util.List<java.util.Map<String, Object>> topContentList = new java.util.ArrayList<>();
    java.util.Map<String, Object> content1 = new java.util.HashMap<>();
    content1.put("platform", "YouTube"); content1.put("title", "신제품 리뷰 - 갤럭시 S25"); content1.put("likes", 892);
    topContentList.add(content1);
    java.util.Map<String, Object> content2 = new java.util.HashMap<>();
    content2.put("platform", "YouTube"); content2.put("title", "Q&A 영상"); content2.put("likes", 756);
    topContentList.add(content2);
    java.util.Map<String, Object> content3 = new java.util.HashMap<>();
    content3.put("platform", "Instagram"); content3.put("title", "신제품 리뷰 - 갤럭시 S25"); content3.put("likes", 892);
    topContentList.add(content3);
    pageContext.setAttribute("topContent", topContentList);
%>
<%-- 더미 데이터 끝 --%>
<%-- ====================================================== --%>
<div class="container">
    <div class="dash-grid-row dash-grid-row-3">

        <%-- 1-1. YouTube 카드 --%>
        <div class="dash-card channel-card">
            <c:choose>
                <c:when test="${empty channel.yt}">
                    <div class="channel-card-unlinked">
                        <div class="channel-icon-wrapper yt">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_youtube.jsp" />
                        </div>
                        <div>
                            <div class="channel-unlinked-title">YouTube 채널 연동</div>
                            <div class="channel-unlinked-desc">YouTube 채널을 연동하여 콘텐츠를 관리하세요</div>
                        </div>
                        <a href="#" class="btn-link-channel">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_plus.jsp" />
                            채널 연동하기
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="dash-card-header">
                        <div class="dash-card-title">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_youtube.jsp" />
                            YouTube 채널
                        </div>
                        <div class="dash-card-badge">1개 연동됨</div>
                    </div>
                    <div class="channel-list">
                        <div class="channel-item">
                            <div class="channel-item-header">
                                <div class="channel-item-info">
                                        ${channel.yt.name} <span>@${channel.yt.handle}</span>
                                </div>
                            </div>
                            <div class="channel-item-stats">
                                <div class="channel-stat">
                                    <span class="channel-stat-label">구독자</span>
                                    <span class="channel-stat-value">${channel.yt.subs}K</span>
                                </div>
                                <div class="channel-stat">
                                    <span class="channel-stat-label">조회수</span>
                                    <span class="channel-stat-value">${channel.yt.views}K</span>
                                </div>
                                <div class="channel-stat">
                                    <span class="channel-stat-label">영상</span>
                                    <span class="channel-stat-value">${channel.yt.videos}</span>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="btn-add-channel">채널 추가</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <%-- 1-2. Instagram 카드 --%>
        <div class="dash-card channel-card">
            <c:choose>
                <c:when test="${empty channel.ig}">
                    <div class="channel-card-unlinked">
                        <div class="channel-icon-wrapper ig">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_instagram.jsp" />
                        </div>
                        <div>
                            <div class="channel-unlinked-title">Instagram 계정 연동</div>
                            <div class="channel-unlinked-desc">Instagram 계정을 연동하여 콘텐츠를 관리하세요</div>
                        </div>
                        <a href="#" class="btn-link-channel">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_plus.jsp" />
                            계정 연동하기
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="dash-card-header">
                        <div class="dash-card-title">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_instagram.jsp" />
                            Instagram 계정
                        </div>
                        <div class="dash-card-badge">${channel.ig.size()}개 연동됨</div>
                    </div>
                    <div class="channel-list">
                        <c:forEach var="igAccount" items="${channel.ig}">
                            <div class="channel-item">
                                <div class="channel-item-header">
                                    <div class="channel-item-info">
                                            ${igAccount.name} <span>@${igAccount.handle}</span>
                                    </div>
                                </div>
                                <div class="channel-item-stats">
                                    <div class="channel-stat">
                                        <span class="channel-stat-label">팔로워</span>
                                        <span class="channel-stat-value">${igAccount.subs}K</span>
                                    </div>
                                    <div class="channel-stat">
                                        <span class="channel-stat-label">조회수</span>
                                        <span class="channel-stat-value">${igAccount.views}M</span>
                                    </div>
                                    <div class="channel-stat">
                                        <span class="channel-stat-label">게시물</span>
                                        <span class="channel-stat-value">${igAccount.posts}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <a href="#" class="btn-add-channel">계정 추가</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <%-- 1-3. 치지직 카드 --%>
        <div class="dash-card channel-card">
            <c:choose>
                <c:when test="${empty channel.chzzk}">
                    <div class="channel-card-unlinked">
                        <div class="channel-icon-wrapper cz">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_chzzk.jsp" />
                        </div>
                        <div>
                            <div class="channel-unlinked-title">CHZZK 채널 연동</div>
                            <div class="channel-unlinked-desc">CHZZK 채널을 연동하여 콘텐츠를 관리하세요</div>
                        </div>
                        <a href="#" class="btn-link-channel">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_plus.jsp" />
                            채널 연동하기
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="dash-card-header">
                        <div class="dash-card-title">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_chzzk.jsp" />
                            치지직 채널
                        </div>
                        <div class="dash-card-badge">1개 연동됨</div>
                    </div>
                    <div class="channel-list">
                        <div class="channel-item">
                            <div class="channel-item-header">
                                <div class="channel-item-info">
                                        ${channel.chzzk.name} <span>@${channel.chzzk.handle}</span>
                                </div>
                            </div>
                            <div class="channel-item-stats">
                                <div class="channel-stat">
                                    <span class="channel-stat-label">팔로워</span>
                                    <span class="channel-stat-value">${channel.chzzk.subs}K</span>
                                </div>
                                <div class="channel-stat">
                                    <span class="channel-stat-label">조회수</span>
                                    <span class="channel-stat-value">${channel.chzzk.views}K</span>
                                </div>
                                <div class="channel-stat">
                                    <span class="channel-stat-label">영상</span>
                                    <span class="channel-stat-value">${channel.chzzk.videos}</span>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="btn-add-channel">채널 추가</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

    </div> <%-- .dash-grid-row-3 끝 --%>

<%--             2. 통계 (4열)--%>
    <div class="dash-grid-row dash-grid-row-4">
        <div class="dash-card dash-stat-card">
            <span class="dash-stat-card-title">이번 달 총 수익</span>
            <div class="dash-stat-card-body">
                <div class="dash-stat-value">${stats.totalRevenue}만원</div>
                <div class="dash-stat-desc">
                    <span class="highlight">+${stats.revenueGrowth}%</span>
                    <span class="label">전월 대비</span>
                </div>
            </div>
        </div>
        <div class="dash-card dash-stat-card">
            <span class="dash-stat-card-title">주간 조회수</span>
            <div class="dash-stat-card-body">
                <div class="dash-stat-value">${stats.weeklyViews}K</div>
                <div class="dash-stat-desc">
                    <span class="highlight">+${stats.viewsGrowth}%</span>
                    <span class="label">지난주 대비</span>
                </div>
            </div>
        </div>
        <div class="dash-card dash-stat-card">
            <span class="dash-stat-card-title">평균 참여율</span>
            <div class="dash-stat-card-body">
                <div class="dash-stat-value">${stats.engagementRate}%</div>
                <div class="dash-stat-desc">
                    <span class="highlight">+${stats.engagementGrowth}%</span>
                    <span class="label">지난주 대비</span>
                </div>
            </div>
        </div>
        <div class="dash-card dash-stat-card">
            <span class="dash-stat-card-title">진행중인 협찬</span>
            <div class="dash-stat-card-body">
                <div class="dash-stat-value">${stats.activeContracts}건</div>
                <div class="dash-stat-desc">
                    <span class="label">총 계약금액 ${stats.activeContractAmount}만원</span>
                </div>
            </div>
        </div>
    </div>

<%--         3. 수익 분석 (2열) --%>
    <div class="dash-grid-row dash-grid-row-2-ratio">
        <%-- (내용 동일) --%>
        <div class="dash-card">
            <div class="chart-card-header">
                <div class="chart-card-title">수익 추이</div>
                <div class="chart-card-subtitle">최근 5개월 수익원별 변화</div>
            </div>
            <div class="chart-placeholder">
                <canvas id="revenueTrendChart"></canvas>
            </div>
        </div>
        <div class="dash-card">
            <div class="chart-card-header">
                <div class="chart-card-title">플랫폼별 수익 비중</div>
                <div class="chart-card-subtitle">전체 수익 중 플랫폼별 기여도</div>
            </div>
            <div class="chart-placeholder">
                <canvas id="platformRevenueChart"></canvas>
            </div>
        </div>
    </div>


<%--         4. 콘텐츠 성과 (2열) --%>
    <div class="dash-grid-row dash-grid-row-2-ratio">

        <%-- 4-1. "콘텐츠 성과 추이" 카드  --%>
        <div class="dash-card">
            <div class="chart-card-header">
                <div class="chart-card-title">콘텐츠 성과 추이</div>
                <div class="chart-card-subtitle">최근 7일간 조회수 및 참여율</div>
            </div>
            <div class="chart-placeholder">
                <canvas id="contentTrendChart"></canvas>
            </div>
        </div>

        <%-- 4-2. "이번달 인기 콘텐츠" 카드  --%>
        <div class="dash-card">
            <div class="chart-card-header">
                <div class="chart-card-title">이번달 인기 콘텐츠</div>
                <div class="chart-card-subtitle">인기 콘텐츠 TOP 3</div>
            </div>

            <div class="dash-list">
                <c:forEach var="content" items="${topContent}">
                    <div class="dash-list-item top-content-item">
                        <div class="dash-list-info">
                            <span class="icon-platform-wrapper
                                <c:choose>
                                    <c:when test='${content.platform == "YouTube"}'>yt</c:when>
                                    <c:when test='${content.platform == "Instagram"}'>ig</c:when>
                                    <c:when test='${content.platform == "Chzzk"}'>cz</c:when>
                                </c:choose>
                            ">
                                <c:choose>
                                    <c:when test='${content.platform == "YouTube"}'>
                                        <jsp:include page="/WEB-INF/views/common/icons/icon_youtube.jsp" />
                                    </c:when>
                                    <c:when test='${content.platform == "Instagram"}'>
                                        <jsp:include page="/WEB-INF/views/common/icons/icon_instagram.jsp" />
                                    </c:when>
                                    <c:when test='${content.platform == "Chzzk"}'>
                                        <jsp:include page="/WEB-INF/views/common/icons/icon_chzzk.jsp" />
                                    </c:when>
                                </c:choose>
                            </span>
                            <span class="dash-list-platform-name">${content.platform}</span>
                        </div>

                        <span class="dash-list-title">${content.title}</span>

                        <span class="dash-list-likes">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_like.jsp" />
                            <fmt:formatNumber value="${content.likes}" pattern="#,##0" />
                        </span>

                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

<%--         5. 일정 및 계약 (2열) --%>
    <div class="dash-grid-row dash-grid-row-2">

        <div class="dash-card">
            <div class="chart-card-header">
                <div class="chart-card-title">예정된 콘텐츠</div>
                <div class="chart-card-subtitle">다가오는 업로드 일정</div>
            </div>
            <div class="dash-list">
                <c:forEach var="item" items="${schedule}">
                    <div class="dash-list-item">
                        <div class="dash-list-info">

                            <span class="icon-platform-wrapper
                                <c:choose>
                                    <c:when test="${item.platform == 'YouTube'}">yt</c:when>
                                    <c:when test="${item.platform == 'Instagram'}">ig</c:when>
                                    <c:when test="${item.platform == 'Chzzk'}">cz</c:when>
                                </c:choose>
                            ">
                                <c:choose>
                                    <c:when test="${item.platform == 'YouTube'}">
                                        <jsp:include page="/WEB-INF/views/common/icons/icon_youtube.jsp" />
                                    </c:when>
                                    <c:when test="${item.platform == 'Instagram'}">
                                        <jsp:include page="/WEB-INF/views/common/icons/icon_instagram.jsp" />
                                    </c:when>
                                    <c:when test="${item.platform == 'Chzzk'}">
                                        <jsp:include page="/WEB-INF/views/common/icons/icon_chzzk.jsp" />
                                    </c:when>
                                </c:choose>
                            </span>

                            <div class="dash-list-info-text">
                                    ${item.title}
                                <span>${item.date}</span>
                            </div>
                        </div>
                        <span class="dash-list-badge
                                <c:choose>
                                    <c:when test="${item.status == '편집중'}">editing</c:when>
                                    <c:when test="${item.status == '촬영완료'}">filmed</c:when>
                                    <c:when test="${item.status == '기획'}">planning</c:when>
                                    <c:otherwise>default-status</c:otherwise>
                                </c:choose>
                            ">${item.status}</span>
                    </div>
                </c:forEach>
            </div>
        </div>

        <%-- 5-2. 활성 협찬 계약 (변경 없음) --%>
        <div class="dash-card">
            <div class="chart-card-header">
                <div class="chart-card-title">활성 협찬 계약</div>
                <div class="chart-card-subtitle">진행중인 계약 현황</div>
            </div>

            <div class="dash-list">
                <c:forEach var="contract" items="${activeContract}">
                    <div class="dash-list-item-progress">
                        <div class="dash-list-progress-top">
                            <span class="dash-list-progress-title">${contract.name}</span>
                            <span class="dash-list-progress-amount"><fmt:formatNumber value="${contract.amount}" pattern="#,##0" />원</span>
                        </div>
                        <c:choose>
                            <c:when test="${contract.status == '진행중'}">
                                <span class="dash-list-badge editing">${contract.status}</span>
                            </c:when>
                            <c:when test="${contract.status == '대기중'}">
                                <span class="dash-list-badge pending">${contract.status}</span>
                            </c:when>
                            <c:when test="${contract.status == '정산대기'}">
                                <span class="dash-list-badge filmed">${contract.status}</span>
                            </c:when>
                            <c:otherwise>
                                <span class="dash-list-badge">${contract.status}</span>
                            </c:otherwise>
                        </c:choose>
                        <div class="dash-list-progress-footer">
                            <div class="progress-bar-wrapper">
                                <span>진행률</span>
                                <span>${contract.progress}%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-inner" style="width: ${contract.progress}%;"></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

    </div> <%-- .dash-grid-row-2 끝 --%>

</div> <%-- .container 끝 --%>

<script>
    document.addEventListener("DOMContentLoaded", function() {

        Chart.register(ChartDataLabels);

        // --- 1. 수익 추이 (Stacked Bar Chart) ---
        const ctxRevenue = document.getElementById('revenueTrendChart');

        if (ctxRevenue) {
            const revenueLabels = ['6월', '7월', '8월', '9월', '10월'];
            const revenueData = {
                labels: revenueLabels,
                datasets: [
                    { label: '광고 수익', data: [1200, 1500, 1800, 2100, 2800], backgroundColor: '#EA580C' },
                    { label: '협찬 수익', data: [800, 1200, 1000, 1600, 2000], backgroundColor: '#FB923C' },
                    { label: '굿즈 판매', data: [400, 500, 600, 700, 900], backgroundColor: '#FDBA74' },
                    { label: '기타 수익', data: [300, 400, 500, 600, 800], backgroundColor: '#FED7AA' }
                ]
            };

            new Chart(ctxRevenue.getContext('2d'), {
                type: 'bar',
                data: revenueData,
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: true, position: 'bottom' },
                        tooltip: { mode: 'index', intersect: false },
                        datalabels: { display: false }
                    },
                    scales: {
                        x: { stacked: true, grid: { display: false } },
                        y: { stacked: true, beginAtZero: true, ticks: { stepSize: 2000 } }
                    }
                }
            });
        }


        // --- 2. 플랫폼별 수익 비중 (Doughnut Chart) ---
        const ctxPlatform = document.getElementById('platformRevenueChart');

        if (ctxPlatform) {
            const platformData = {
                labels: ['유튜브', '인스타그램', '치지직'],
                datasets: [{
                    label: '수익 비중',
                    data: [45, 30, 25],
                    backgroundColor: ['#EA580C', '#FB923C', '#FDBA74'],
                    borderColor: '#FFFFFF',
                    borderWidth: 2
                }]
            };

            new Chart(ctxPlatform.getContext('2d'), {
                type: 'doughnut',
                data: platformData,
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    cutout: '30%',
                    plugins: {
                        legend: { display: false },
                        datalabels: {
                            formatter: (value, context) => {
                                const label = context.chart.data.labels[context.dataIndex];
                                return label + ' ' + value + '%';
                            },
                            color: (context) => {
                                return context.dataset.backgroundColor[context.dataIndex];
                            },
                            font: { weight: 'bold', size: 12, family: 'Arimo' },
                            anchor: 'end',
                            align: 'end',
                            offset: 10
                        }
                    }
                }
            });
        }

        // --- 3. 콘텐츠 성과 추이 (Dual-Axis Line Chart) ---
        const ctxContent = document.getElementById('contentTrendChart');

        if (ctxContent) {
            const contentLabels = ['10/20', '10/21', '10/22', '10/23', '10/24', '10/25', '10/26'];
            const contentData = {
                labels: contentLabels,
                datasets: [
                    {
                        label: '조회수',
                        data: [15000, 18000, 22000, 19000, 24000, 28000, 32000],
                        borderColor: '#EA580C',
                        backgroundColor: '#EA580C',
                        tension: 0.3,
                        yAxisID: 'yViews'
                    },
                    {
                        label: '참여율 (%)',
                        data: [7.5, 9.0, 10.5, 8.5, 9.5, 11.0, 12.0],
                        borderColor: '#FB923C',
                        backgroundColor: '#FB923C',
                        tension: 0.3,
                        yAxisID: 'yEngagement'
                    }
                ]
            };

            new Chart(ctxContent.getContext('2d'), {
                type: 'line',
                data: contentData,
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: true, position: 'bottom' },
                        datalabels: { display: false }
                    },
                    scales: {
                        x: { grid: { display: false } },
                        yViews: {
                            type: 'linear',
                            position: 'left',
                            beginAtZero: true,
                            ticks: { stepSize: 8000 }
                        },
                        yEngagement: {
                            type: 'linear',
                            position: 'right',
                            beginAtZero: true,
                            ticks: { stepSize: 3 },
                            grid: { drawOnChartArea: false }
                        }
                    }
                }
            });
        }
    });
</script>
</body>
</html>