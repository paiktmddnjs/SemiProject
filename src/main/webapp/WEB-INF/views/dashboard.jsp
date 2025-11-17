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
                        <a href="${pageContext.request.contextPath}/login2" class="btn-link-channel">
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
                        <a href="${pageContext.request.contextPath}/login2" class="btn-add-channel">채널 추가</a>
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
                        <a href="${pageContext.request.contextPath}/instagram/login" class="btn-link-channel">
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
                        <a href="${pageContext.request.contextPath}/instagram/login" class="btn-add-channel">계정 추가</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <%-- 1-3. 치지직 카드 --%>
        <div class="dash-card channel-card">
            <c:choose>
                <c:when test="${empty chzzkChanels}">
                    <div class="channel-card-unlinked">
                        <div class="channel-icon-wrapper cz">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_chzzk.jsp" />
                        </div>
                        <div>
                            <div class="channel-unlinked-title">CHZZK 채널 연동</div>
                            <div class="channel-unlinked-desc">CHZZK 채널을 연동하여 콘텐츠를 관리하세요</div>
                        </div>
                        <a href="${pageContext.request.contextPath}/chzzk/login" class="btn-link-channel">
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
                        <div class="dash-card-badge">${chzzkChanels.size()}개 연동됨</div>
                    </div>
                    <div class="channel-list">
                        <c:forEach var="chanel" items="${chzzkChanels}">
                            <div class="channel-item">
                                <div class="channel-item-header">
                                    <div class="channel-item-info">
                                            ${chanel.chanelName}
                                    </div>
                                    <button type="button" class="btn-delete-channel" onclick="deleteChannel('${chanel.chanelId}')">
                                        <jsp:include page="/WEB-INF/views/common/icons/icon_delete.jsp" />
                                    </button>
                                </div>
                                <div class="channel-item-stats">
                                    <div class="channel-stat">
                                        <span class="channel-stat-label">구독자</span>
                                        <span class="channel-stat-value">
                                            <c:choose>
                                                <c:when test="${chanel.platfromSubscribe >= 1000}">
                                                    <fmt:formatNumber value="${chanel.platfromSubscribe / 1000}" pattern="#,##0.0" />K
                                                </c:when>
                                                <c:otherwise>
                                                    <fmt:formatNumber value="${chanel.platfromSubscribe}" pattern="#,##0" />
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                    </div>
                                    <c:if test="${not empty chanel.chanelFollower}">
                                        <div class="channel-stat">
                                            <span class="channel-stat-label">팔로워</span>
                                            <span class="channel-stat-value">
                                                <c:catch var="parseError">
                                                    <c:set var="followerNum" value="${0}" />
                                                    <c:if test="${not empty chanel.chanelFollower}">
                                                        <c:set var="followerNum" value="${Integer.parseInt(chanel.chanelFollower)}" />
                                                    </c:if>
                                                    <c:choose>
                                                        <c:when test="${followerNum >= 1000}">
                                                            <fmt:formatNumber value="${followerNum / 1000}" pattern="#,##0.0" />K
                                                        </c:when>
                                                        <c:otherwise>
                                                            <fmt:formatNumber value="${followerNum}" pattern="#,##0" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:catch>
                                                <c:if test="${not empty parseError}">
                                                    ${chanel.chanelFollower}
                                                </c:if>
                                            </span>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty chanel.chanelUrl}">
                                        <div class="channel-stat">
                                            <span class="channel-stat-label">URL</span>
                                            <span class="channel-stat-value">
                                                <a href="${chanel.chanelUrl}" target="_blank" style="color: inherit; text-decoration: underline;">보기</a>
                                            </span>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                        <a href="${pageContext.request.contextPath}/chzzk/login" class="btn-add-channel">채널 추가</a>
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
    // 채널 삭제 함수 (전역 스코프 - onclick에서 접근 가능하도록)
    function deleteChannel(chanelId) {
        console.log('deleteChannel called with ID:', chanelId);

        if (!chanelId) {
            alert('채널 ID가 없습니다.');
            return;
        }

        if (!confirm('정말 이 채널을 삭제하시겠습니까?')) {
            return;
        }

        fetch('/dashboard/channel/' + chanelId + '/delete', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                console.log('Response status:', response.status);
                if (!response.ok) {
                    throw new Error('HTTP error! status: ' + response.status);
                }
                return response.json();
            })
            .then(data => {
                console.log('Response data:', data);
                if (data.success) {
                    alert(data.message);
                    // 페이지 새로고침하여 삭제된 채널 제거
                    location.reload();
                } else {
                    alert(data.message || '채널 삭제에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('채널 삭제 중 오류가 발생했습니다: ' + error.message);
            });
    }


</script>
</body>
</html>