<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CREP Dashboard Clone</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="MoneyControll.css" />
    <link rel="stylesheet" href="history.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/MoneyEnroll.jsp" />
<jsp:include page="/WEB-INF/views/ExpenseEnroll.jsp" />


<div class="dashboard-container">



    <div class="main-content">


        <div class="dashboard-body">
            <div class="page-header">
                <div class="action-buttons">

                    <button class="primary-btn" onclick="openProfitModal()">수익 추가</button>

                    <button class="expense-btn" onclick="openExpenseModal()">지출 추가</button>

                </div>
                <p class="page-title">수익과 지출을 통합 관리하고 순이익을 추적하세요!</p>
            </div>

            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-title"><span>순이익</span><i class="fas fa-chart-line"></i></div>
                    <div class="stat-value" >${netProfitAmount}만원</div>
                    <div class="stat-change" >${netProfitChange}</div>
                </div>
                <div class="stat-card">
                    <div class="stat-title"><span>총 수익</span><i class="fas fa-arrow-up"></i></div>
                    <div class="stat-value" type="currency">${ProfitAmount}만원</div>
                    <div class="stat-change">이번 달 총 수익</div>
                </div>
                <div class="stat-card">
                    <div class="stat-title"><span>총 지출</span><i class="fas fa-arrow-down"></i></div>
                    <div class="stat-value">${ExpenseAmount}만원</div>
                    <div class="stat-change">이번 달 총 지출</div>
                </div>
                <div class="stat-card">
                    <div class="stat-title"><span>수익률</span><i class="fas fa-dollar-sign"></i></div>
                    <div class="stat-value">${ProfitPercent} %</div>
                    <div class="stat-change">순이익률</div>
                </div>
            </div>

            <div class="detail-analysis">

                <div class="left-panel">
                    <div class="tabs">
                        <button class="tab-button active" data-page="overview">개요</button>
                        <button class="tab-button" data-page="money">수익 분석</button>
                        <button class="tab-button" data-page="expense">지출 분석</button>
                        <button class="tab-button" data-page="transaction">거래 내역</button>
                    </div>

                    <div id="chart-placeholder" class="chart-placeholder">
                        <canvas id="myChart"></canvas>
                    </div>


                    <div id="history-area" class="transaction-container" style="display: none;">
                        <header class="section-header">
                            <h2>최근 거래 내역</h2>
                            <p class="subtitle">수익 및 지출 상세 내역</p>
                        </header>

                        <div class="table-wrapper">
                            <table>
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
                                            <c:set var="isProfit" value="${item.finacialType eq '수익'}" />
                                            <c:set var="tagClass" value="${isProfit ? 'profit' : 'expense'}" />
                                            <c:set var="amountSign" value="${isProfit ? '+' : '-'}" />

                                            <tr>
                                                <td><fmt:formatDate value="${item.finacialDate}" pattern="yyyy-MM-dd"/></td>
                                                <td><span class="tag ${tagClass}">${item.finacialType}</span></td>
                                                <td>${item.category}</td>
                                                <td>${item.finacialName}</td>

                                                <td class="amount ${tagClass}">
                                                        ${amountSign}<fmt:formatNumber value="${item.finacialAmount}" pattern="#,###"/>원
                                                </td>

                                                    <%-- 상태 로직 --%>
                                                <td>  <%-- 상태 로직 --%>
                                                    <c:choose>
                                                        <c:when test="${item.finacialStatus eq 'Y'}">${isProfit ? '정산완료' : '지불완료'}</c:when>
                                                        <c:when test="${item.finacialStatus eq 'N'}">${isProfit ? '정산대기' : '지불대기'}</c:when>
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
                        </div>
                    </div>
                </div>

                <%-------------------------------- 수익 --------------------------------%>
                <div class="right-panel">
                    <h3>최근 주요 수익</h3>
                    <p style="font-size: 14px; color: #777; margin-bottom: 15px;">수익 금액 TOP 3</p>


                    <div class="recent-revenue-item">
                        <div class="item-source">
                            <div class="tag-revenue-container">
                                <span class="tag-revenue">수익</span> <span class="tag-revenue2">광고 수익</span>
                            </div>
                            <span >YouTube 광고 수익</span>
                        </div>
                        <div class="item-amount">+450K</div>
                    </div>

                    <div class="recent-revenue-item">
                        <div class="item-source">
                            <div class="tag-revenue-container">
                                <span class="tag-revenue">수익</span> 협찬
                            </div>
                            <span>Instagram 협찬</span>
                        </div>
                        <div class="item-amount">+1,500K</div>
                    </div>

                    <div class="recent-revenue-item">
                        <div class="item-source">
                            <div class="tag-revenue-container">
                                <span class="tag-revenue">수익</span> 굿즈 판매
                            </div>
                            <span>스토어 굿즈 판매</span>
                        </div>
                        <div class="item-amount">+580K</div>
                    </div>


                </div>
            </div>

        </div>
    </div>
</div>



<script src="/MoneyEnroll.js"></script>
<script src="/ExpenseEnroll.js"></script>


<script>
    const ctx = document.getElementById('myChart');
    const chartPlaceholder = document.getElementById('chart-placeholder'); // ✅ 추가
    const historyArea = document.getElementById('history-area');           // ✅ 추가
    let chart; // Ch Chart.js 인스턴스

    // 📊 그래프별 설정 정의
    const chartConfigs = {

        // 🟢 개요
        overview: {
            type: 'line',
            data: {
                labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                datasets: [
                    {
                        label: '수익',
                        data: [${netProfitAmount * 10000}, 80000000, 120000000, 30000000, 50000000, 95000000, 150000000, 130000000, 100000000, 115000000, 160000000, 180000000],
                        fill: false,
                        borderColor: '#e10d2c',
                        backgroundColor: '#e10d2c',
                        tension: 0.3,
                        pointRadius: 5,
                        pointHoverRadius: 8,
                    },
                    {
                        label: '순수익',
                        data: [20000000, 60000000, 100000000, 40000000, 70000000, 110000000, 130000000, 110000000, 80000000, 130000000, 140000000, 160000000],
                        fill: false,
                        borderColor: '#032ee3',
                        backgroundColor: '#032ee3',
                        tension: 0.3,
                        pointRadius: 5,
                        pointHoverRadius: 8,
                    },
                    {
                        label: '지출',
                        data: [20000000, 30000000, 60000000, 40000000, 70000000, 30000000, 110000000, 100000000, 80000000, 130000000, 140000000, 130000000],
                        fill: false,
                        borderColor: '#e57230',
                        backgroundColor: '#e57230',
                        tension: 0.3,
                        pointRadius: 5,
                        pointHoverRadius: 8,
                    }
                ]
            },

            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    title: {
                        display: true,
                        text: '최근 7개월 수익, 지출 및 순이익 변화',
                        font: {size: 18},
                        align: 'start'
                    },
                    legend: {position: 'top'},
                    tooltip: {
                        callbacks: {
                            label: function (context) {
                                const value = context.parsed.y;
                                return ' 매출: ' + value.toLocaleString('ko-KR') + '원';
                            }
                        }
                    },
                    datalabels: {
                        display: false // 데이터 라벨 표시 끔
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 200000000,
                        title: {display: false},
                        ticks: {
                            callback: function (value) {
                                if (value >= 100000000) return (value / 100000000).toFixed(1) + '억';
                                return value.toLocaleString('ko-KR');
                            },
                            stepSize: 20000000
                        }
                    },
                    x: {
                        title: {display: false}
                    }
                }
            }
        },

        // === 수익 분석 (MoneyBarApi.jsp 내용 반영) ===
        money: {
            type: 'bar',
            data: {
                labels: ['4월', '5월', '6월', '7월', '8월', '9월', '10월'],
                datasets: [
                    {
                        label: '광고',
                        data: [1500, 1800, 2200, 2500, 2800, 3000, 3500],
                        backgroundColor: '#E55F1C'
                    },
                    {
                        label: '굿즈',
                        data: [500, 700, 800, 1000, 1200, 1400, 1500],
                        backgroundColor: '#F4A346'
                    },
                    {
                        label: '협찬',
                        data: [300, 400, 500, 600, 700, 800, 900],
                        backgroundColor: '#F7C281'
                    },
                    {label: '후원', data: [100, 150, 200, 250, 300, 350, 400], backgroundColor: '#F9D39F'}
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    title: {
                        display: true,
                        text: '광고, 후원, 협찬, 굿즈별 월별 수익 변화',
                        color: '#888',
                        position: 'top',
                        align: 'start',
                        font: {size: 18, weight: 'bold'},
                        padding: {top: 10, bottom: 40}
                    },
                    legend: {display: true, position: 'bottom'}
                },
                scales: {
                    x: {stacked: true},
                    y: {
                        stacked: true,
                        min: 0, max: 8000,
                        ticks: {
                            stepSize: 2000,
                            callback: value => value + ' 만원'
                        },
                        title: {display: true, text: '수익 (단위: 만원)'}
                    }
                }
            }
        },


        // 🔴 지출 분석
        expense: {
            type: 'bar',
            data: {
                labels: ['4월', '5월', '6월', '7월', '8월', '9월', '10월'],
                datasets: [
                    {
                        label: '마케팅',
                        data: [1500, 1800, 2200, 2500, 2300, 2000, 2500],
                        backgroundColor: '#3232de'
                    },
                    {
                        label: '소프트웨어',
                        data: [500, 700, 800, 1000, 1200, 1400, 1500],
                        backgroundColor: '#4169E1'
                    },
                    {
                        label: '외주',
                        data: [300, 400, 500, 600, 700, 400, 500],
                        backgroundColor: '#6495ED'
                    },
                    {label: '장비', data: [100, 150, 200, 150, 100, 150, 100], backgroundColor: '#abc8ec'}
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    title: {
                        display: true,
                        text: '장비, 소프트웨어, 외주, 마케팅별 지출 변화',
                        color: '#888',
                        position: 'top',
                        align: 'start',
                        font: {size: 18, weight: 'bold'},
                        padding: {top: 10, bottom: 40}
                    },
                    legend: {display: true, position: 'bottom'}
                },
                scales: {
                    x: {stacked: true},
                    y: {
                        stacked: true,
                        min: 0, max: 5000,
                        ticks: {stepSize: 1000, callback: v => v + ' 만원'},
                        title: {display: true, text: '지출 (단위: 만원)'}
                    }
                }
            }
        }
    };


    // ✅ 기본 그래프: 수익 분석
    chart = new Chart(ctx, chartConfigs.overview);

    // ✅ 버튼 클릭 시 차트 전환
    document.querySelectorAll('.tab-button').forEach(btn => {
        btn.addEventListener('click', function () {

            // 🔹 탭 활성화 전환
            document.querySelectorAll('.tab-button').forEach(b => b.classList.remove('active'));
            this.classList.add('active');

            const key = this.dataset.page;
            const config = chartConfigs[key];
            const rightPanel = document.querySelector('.right-panel');
            const chartPlaceholder = document.getElementById('chart-placeholder');
            const historyArea = document.getElementById('history-area');
            const leftPanel = document.querySelector('.left-panel');

            // 🔹 거래 내역 클릭 시
            if (key === 'transaction') {

                // 1. DOM 전환: 거래 내역 영역만 표시
                chartPlaceholder.style.display = 'none';
                historyArea.style.display = 'block';
                if (rightPanel) rightPanel.style.display = 'none';
                if (leftPanel) {
                    leftPanel.style.flex = 'none';
                    leftPanel.style.width = '100%';
                }
                return;
            }
            else {

            // 🔹 다른 탭 클릭 시 원래 상태 복원
            historyArea.style.display = 'none';
            chartPlaceholder.style.display = 'block';
            if (rightPanel) rightPanel.style.display = 'block';
            if (leftPanel) {
                leftPanel.style.flex = '';
                leftPanel.style.width = '';
            }


            // 🔹 수익 / 지출 분석 시 오른쪽 패널 내용 및 색상 변경
            if (rightPanel) {
                const title = rightPanel.querySelector('h3');
                const desc = rightPanel.querySelector('p');
                const tagContainSpans = rightPanel.querySelectorAll('.tag-revenue-container');
                const tagSpans = rightPanel.querySelectorAll('.tag-revenue');
                const amounts = rightPanel.querySelectorAll('.item-amount');

                if (key === 'expense') {
                    // 🔵 지출 분석 모드
                    title.textContent = '최근 주요 지출';
                    if (desc) desc.textContent = '지출 금액 TOP 3';
                    tagSpans.forEach(span => {
                        span.textContent = '지출';
                        span.style.backgroundColor = '#2A68E8'; // 파란색
                        span.style.color = '#fff';
                    });
                    amounts.forEach(div => {
                        div.style.color = '#2A68E8'; // 파란색
                    });
                }


                else if (key === 'money' || key === 'overview') {
                    // 🔴 수익 분석 / 개요 모드
                    title.textContent = '최근 주요 수익';
                    if (desc) desc.textContent = '수익 금액 TOP 3';
                    tagSpans.forEach(span => {
                        span.textContent = '수익';
                        span.style.backgroundColor = '#f55a1d'; // 빨간색
                        span.style.color = '#fff';
                    });
                    amounts.forEach(div => {
                        div.style.color = '#f55a1d'; // 빨간색
                    });
                }
            }

            // 🔹 그래프 변경
            if (!config) {
                console.error(`${key} 그래프 구성 없음`);
                return;
            }

            chart.destroy();
            chart = new Chart(ctx, config);
        }
        });
    });

</script>
</body>
</html>