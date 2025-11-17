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
    <link rel="stylesheet" href="MoneyView.css" />
    <link rel="stylesheet" href="Transaction.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/ProfitEnroll.jsp" />
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
                    <div class="stat-change" >전월 대비 ${IncreaseRate}% </div>
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
                        <button class="tab-button active" id="tab-button-overview" data-page="overview">개요</button>
                        <button class="tab-button" data-page="money">수익 분석</button>
                        <button class="tab-button" data-page="expense">지출 분석</button>
                        <button class="tab-button" id="tab-button-transaction" data-page="transaction">거래 내역</button>
                    </div>

                    <div id="chart-placeholder" class="chart-placeholder">
                        <canvas id="myChart"></canvas>
                    </div>


                    <jsp:include page="/WEB-INF/views/Transaction.jsp" />

                </div>

                <%-------------------------------- 수익 --------------------------------%>
                <div class="right-panel">
                    <h3>최근 3개월간의 주요 수익</h3>
                    <p style="font-size: 14px; color: #777; margin-bottom: 15px;">수익 금액 TOP 3</p>


                    <div class="recent-revenue-item">
                        <div class="item-source">
                            <div class="tag-revenue-container">
                                <span class="tag-revenue">수익</span> <span class="tag-revenue2-1">${FirstProfit.getCategory()}</span>
                            </div>
                            <span id="detail-1">${FirstProfit.getFinancialName()}</span>
                        </div>
                        <div class="item-amount" id="item-amount-first">${amountKFirst}</div>
                    </div>

                    <div class="recent-revenue-item">
                        <div class="item-source">
                            <div class="tag-revenue-container">
                                <span class="tag-revenue" >수익</span><span class="tag-revenue2-2">${SecondProfit.getCategory()}</span>
                            </div>
                            <span id="detail-2">${SecondProfit.getFinancialName()}</span>
                        </div>
                        <div class="item-amount" id="item-amount-second">${amountKSecond}</div>
                    </div>

                    <div class="recent-revenue-item">
                        <div class="item-source">
                            <div class="tag-revenue-container">
                                <span class="tag-revenue">수익</span> <span class="tag-revenue2-3">${ThirdProfit.getCategory()}</span>
                            </div>
                            <span id="detail-3">${ThirdProfit.getFinancialName()}</span>
                        </div>
                        <div class="item-amount" id="item-amount-third">${amountKThird}</div>
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
                        data: [
                            ${monthlyProfit[0]}, ${monthlyProfit[1]}, ${monthlyProfit[2]}, ${monthlyProfit[3]}, ${monthlyProfit[4]}, ${monthlyProfit[5]}, ${monthlyProfit[6]},
                            ${monthlyProfit[7]}, ${monthlyProfit[8]}, ${monthlyProfit[9]}, ${monthlyProfit[10]}, ${monthlyProfit[11]}
                        ],
                        fill: false,
                        borderColor: '#e10d2c',
                        backgroundColor: '#e10d2c',
                        tension: 0.3,
                        pointRadius: 5,
                        pointHoverRadius: 8,
                    },
                    {
                        label: '순수익',
                        data: [${monthlyNetProfit[0]}, ${monthlyNetProfit[1]}, ${monthlyNetProfit[2]}, ${monthlyNetProfit[3]}, ${monthlyNetProfit[4]},
                            ${monthlyNetProfit[5]}, ${monthlyNetProfit[6]}, ${monthlyNetProfit[7]}, ${monthlyNetProfit[8]}, ${monthlyNetProfit[9]},
                            ${monthlyNetProfit[10]}, ${monthlyNetProfit[11]}],
                        fill: false,
                        borderColor: '#e57230',
                        backgroundColor: '#e57230',
                        tension: 0.3,
                        pointRadius: 5,
                        pointHoverRadius: 8,
                    },
                    {
                        label: '지출',
                        data: [ ${monthlyExpense[0]}, ${monthlyExpense[1]}, ${monthlyExpense[2]}, ${monthlyExpense[3]},
                            ${monthlyExpense[4]}, ${monthlyExpense[5]}, ${monthlyExpense[6]}, ${monthlyExpense[7]}, ${monthlyExpense[8]},
                            ${monthlyExpense[9]}, ${monthlyExpense[10]}, ${monthlyExpense[11]}],
                        fill: false,
                        borderColor: '#032ee3',
                        backgroundColor: '#032ee3',
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
                        text: '수익 vs 지출 추이',
                        color: 'black',
                        position: 'top',
                        align: 'start',
                        font: {size: 18},
                        padding: {top: 15, bottom: 25}
                    },
                    subtitle: {
                        display: true,
                        text: '최근 1년간의 수익,지출 및 순이익 변화',
                        color: '#aaa',
                        align: 'start',
                        font: { size: 17 },
                        padding: { bottom: 20 }
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
                        title: {display: false},
                        ticks: {
                            callback: function (value) {
                                if (value >= 100000000) return (value / 100000000).toFixed(1) + '억';
                                return value.toLocaleString('ko-KR');
                            },
                            stepSize: 10000000
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
                labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월' , '11월' , '12월'],
                datasets: [
                    {
                        label: '광고',
                        data: [ ${monthlyAdProfits[0]}, ${monthlyAdProfits[1]}, ${monthlyAdProfits[2]},
                            ${monthlyAdProfits[3]}, ${monthlyAdProfits[4]}, ${monthlyAdProfits[5]},
                            ${monthlyAdProfits[6]}, ${monthlyAdProfits[7]}, ${monthlyAdProfits[8]},
                            ${monthlyAdProfits[9]}, ${monthlyAdProfits[10]}, ${monthlyAdProfits[11]}],
                        backgroundColor: '#E55F1C'
                    },
                    {
                        label: '굿즈',
                        data: [ ${monthlyMerchProfits[0]}, ${monthlyMerchProfits[1]}, ${monthlyMerchProfits[2]},
                            ${monthlyMerchProfits[3]}, ${monthlyMerchProfits[4]}, ${monthlyMerchProfits[5]},
                            ${monthlyMerchProfits[6]}, ${monthlyMerchProfits[7]}, ${monthlyMerchProfits[8]},
                            ${monthlyMerchProfits[9]}, ${monthlyMerchProfits[10]}, ${monthlyMerchProfits[11]}],
                        backgroundColor: '#F4A346'
                    },
                    {
                        label: '협찬',
                        data: [ ${monthlySponProfits[0]}, ${monthlySponProfits[1]}, ${monthlySponProfits[2]},
                            ${monthlySponProfits[3]}, ${monthlySponProfits[4]}, ${monthlySponProfits[5]},
                            ${monthlySponProfits[6]}, ${monthlySponProfits[7]}, ${monthlySponProfits[8]},
                            ${monthlySponProfits[9]}, ${monthlySponProfits[10]}, ${monthlySponProfits[11]}],
                        backgroundColor: '#F7C281'
                    },
                    {label: '후원', data: [${monthlyDonationProfits[0]}, ${monthlyDonationProfits[1]}, ${monthlyDonationProfits[2]},
                            ${monthlyDonationProfits[3]}, ${monthlyDonationProfits[4]}, ${monthlyDonationProfits[5]},
                            ${monthlyDonationProfits[6]}, ${monthlyDonationProfits[7]}, ${monthlyDonationProfits[8]},
                            ${monthlyDonationProfits[9]}, ${monthlyDonationProfits[10]}, ${monthlyDonationProfits[11]}],
                        backgroundColor: '#F9D39F'
                    },
                    {label: '기타', data: [${monthlyEtcProfits[0]}, ${monthlyEtcProfits[1]}, ${monthlyEtcProfits[2]},
                            ${monthlyEtcProfits[3]}, ${monthlyEtcProfits[4]}, ${monthlyEtcProfits[5]},
                            ${monthlyEtcProfits[6]}, ${monthlyEtcProfits[7]}, ${monthlyEtcProfits[8]},
                            ${monthlyEtcProfits[9]}, ${monthlyEtcProfits[10]}, ${monthlyEtcProfits[11]}],
                        backgroundColor: '#FBE3C3'
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    title: {
                        display: true,
                        text: '카테고리별 수익 추이',
                        color: 'black',
                        position: 'top',
                        align: 'start',
                        font: {size: 18},
                        padding: {top: 15, bottom: 25}
                    },
                    subtitle: {
                        display: true,
                        text: '광고, 후원, 협찬, 굿즈별 월별 수익 변화',
                        color: '#aaa',
                        align: 'start',
                        font: { size: 17 },
                        padding: { bottom: 20 }
                    },
                    legend: {display: true, position: 'bottom'}
                },
                scales: {
                    x: { stacked: true },
                    y: {
                        stacked: true,
                        min: 0,
                        // max: 8000,  ❌ 제거
                        ticks: {
                            stepSize: 1000,
                            callback: value => value + ' 만원'
                        },
                        title: { display: true, text: '수익 (단위: 만원)' }
                    }
                }
            }
        },


        // 🔴 지출 분석
        expense: {
            type: 'bar',
            data: {
                labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월' , '12월'],
                datasets: [
                    {
                        label: '마케팅',
                        data: [${monthlyMarketExpenses[0]}, ${monthlyMarketExpenses[1]}, ${monthlyMarketExpenses[2]},
                            ${monthlyMarketExpenses[3]}, ${monthlyMarketExpenses[4]}, ${monthlyMarketExpenses[5]},
                            ${monthlyMarketExpenses[6]}, ${monthlyMarketExpenses[7]}, ${monthlyMarketExpenses[8]},
                            ${monthlyMarketExpenses[9]}, ${monthlyMarketExpenses[10]}, ${monthlyMarketExpenses[11]}],
                        backgroundColor: '#3232de'
                    },
                    {
                        label: '소프트웨어',
                        data: [${monthlySoftWareExpenses[0]}, ${monthlySoftWareExpenses[1]}, ${monthlySoftWareExpenses[2]},
                            ${monthlySoftWareExpenses[3]}, ${monthlySoftWareExpenses[4]}, ${monthlySoftWareExpenses[5]},
                            ${monthlySoftWareExpenses[6]}, ${monthlySoftWareExpenses[7]}, ${monthlySoftWareExpenses[8]},
                            ${monthlySoftWareExpenses[9]}, ${monthlySoftWareExpenses[10]}, ${monthlySoftWareExpenses[11]}],
                        backgroundColor: '#4169E1'
                    },
                    {
                        label: '외주',
                        data: [${monthlyOutSourceExpenses[0]}, ${monthlyOutSourceExpenses[1]}, ${monthlyOutSourceExpenses[2]},
                            ${monthlyOutSourceExpenses[3]}, ${monthlyOutSourceExpenses[4]}, ${monthlyOutSourceExpenses[5]},
                            ${monthlyOutSourceExpenses[6]}, ${monthlyOutSourceExpenses[7]}, ${monthlyOutSourceExpenses[8]},
                            ${monthlyOutSourceExpenses[9]}, ${monthlyOutSourceExpenses[10]}, ${monthlyOutSourceExpenses[11]}],
                        backgroundColor: '#6495ED'
                    },
                    {label: '장비', data: [${monthlyEquipExpenses[0]}, ${monthlyEquipExpenses[1]}, ${monthlyEquipExpenses[2]},
                            ${monthlyEquipExpenses[3]}, ${monthlyEquipExpenses[4]}, ${monthlyEquipExpenses[5]},
                            ${monthlyEquipExpenses[6]}, ${monthlyEquipExpenses[7]}, ${monthlyEquipExpenses[8]},
                            ${monthlyEquipExpenses[9]}, ${monthlyEquipExpenses[10]}, ${monthlyEquipExpenses[11]}],
                        backgroundColor: '#abc8ec'
                    },
                    {label: '기타', data: [${monthlyEtcTotalExpenses[0]}, ${monthlyEtcTotalExpenses[1]}, ${monthlyEtcTotalExpenses[2]},
                            ${monthlyEtcTotalExpenses[3]}, ${monthlyEtcTotalExpenses[4]}, ${monthlyEtcTotalExpenses[5]},
                            ${monthlyEtcTotalExpenses[6]}, ${monthlyEtcTotalExpenses[7]}, ${monthlyEtcTotalExpenses[8]},
                            ${monthlyEtcTotalExpenses[9]}, ${monthlyEtcTotalExpenses[10]}, ${monthlyEtcTotalExpenses[11]}],
                        backgroundColor: '#C7DBF4'
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    title: {
                        display: true,
                        text: '카테고리별 지출 추이',
                        color: 'black',
                        position: 'top',
                        align: 'start',
                        font: {size: 18},
                        padding: {top: 15, bottom: 25}
                    },
                    subtitle: {
                        display: true,
                        text: '장비, 소프트웨어, 외주, 마케팅, 기타별 지출 변화',
                        color: '#aaa',
                        align: 'start',
                        font: { size: 17 },
                        padding: { bottom: 20 }
                    },
                    legend: {display: true, position: 'bottom'}
                },
                scales: {
                    x: { stacked: true },
                    y: {
                        stacked: true,
                        min: 0,

                        ticks: {
                            stepSize: 1000,
                            callback: value => value + ' 만원'
                        },
                        title: { display: true, text: '지출 (단위: 만원)' }
                    }
                }
            }
        }
    };


    // ✅ 기본 그래프: 수익 분석
    chart = new Chart(ctx, chartConfigs.overview);

    // ✅ 모든 탭 버튼 클릭 이벤트
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

            // 🔹 클릭할 때마다 현재 탭 이름 저장
            try {
                localStorage.setItem('tabName', key);
            } catch (e) {
                console.warn('로컬스토리지 접근 불가:', e);
            }

            // 🔹 거래 내역 클릭 시
            if (key === 'transaction') {
                chartPlaceholder.style.display = 'none';
                historyArea.style.display = 'block';
                if (rightPanel) rightPanel.style.display = 'none';
                if (leftPanel) {
                    leftPanel.style.flex = 'none';
                    leftPanel.style.width = '100%';
                }
                return;
            }

            // 🔹 다른 탭 클릭 시 원래 상태 복원
            historyArea.style.display = 'none';
            chartPlaceholder.style.display = 'block';
            if (rightPanel) rightPanel.style.display = 'block';
            if (leftPanel) {
                leftPanel.style.flex = '';
                leftPanel.style.width = '';
            }

            // 🔹 오른쪽 패널 내용 및 색상 변경
            if (rightPanel) {
                const title = rightPanel.querySelector('h3');
                const desc = rightPanel.querySelector('p');
                const tagSpans = rightPanel.querySelectorAll('.tag-revenue');
                const amounts = rightPanel.querySelectorAll('.item-amount');


                if (key === 'expense') {
                    title.textContent = '최근 3개월간의 주요 지출';
                    if (desc) desc.textContent = '지출 금액 TOP 3';

                    document.querySelector('.tag-revenue2-1').innerText = "${FirstExpense.getCategory()}";
                    document.querySelector('.tag-revenue2-2').innerText = "${SecondExpense.getCategory()}";
                    document.querySelector('.tag-revenue2-3').innerText = "${ThirdExpense.getCategory()}";


                    tagSpans.forEach(span => {

                        <c:set var="amountKFirst" value="${FirstExpense.getAmount() / 1000}" />
                        document.querySelector('#item-amount-first').innerText = "-<fmt:formatNumber value="${amountKFirst}" pattern="0" />K";

                        <c:set var="amountKSecond" value="${SecondExpense.getAmount() / 1000}" />
                        document.querySelector('#item-amount-second').innerText = "-<fmt:formatNumber value="${amountKSecond}" pattern="0" />K";

                        <c:set var="amountKThird" value="${ThirdExpense.getAmount() / 1000}" />
                        document.querySelector('#item-amount-third').innerText = "-<fmt:formatNumber value="${amountKThird}" pattern="0" />K";

                        span.textContent = '지출';

                        span.style.backgroundColor = '#2A68E8';
                        span.style.color = '#fff';
                    });
                    amounts.forEach(div => div.style.color = '#2A68E8');

                    document.querySelector('#detail-1').innerText = "${FirstExpense.getFinancialName()}";
                    document.querySelector('#detail-2').innerText = "${SecondExpense.getFinancialName()}";
                    document.querySelector('#detail-3').innerText = "${ThirdExpense.getFinancialName()}";

                } else {
                    title.textContent = '최근 3개월간의 주요 수익';
                    if (desc) desc.textContent = '수익 금액 TOP 3';

                    document.querySelector('.tag-revenue2-1').innerText = "${FirstProfit.getCategory()}";
                    document.querySelector('.tag-revenue2-2').innerText = "${SecondProfit.getCategory()}";
                    document.querySelector('.tag-revenue2-3').innerText = "${ThirdProfit.getCategory()}";

                    tagSpans.forEach(span => {


                        <c:set var="amountKFirst" value="${FirstProfit.getAmount() / 1000}" />
                        document.querySelector('#item-amount-first').innerText = "+<fmt:formatNumber value="${amountKFirst}" pattern="0" />K";

                        <c:set var="amountKSecond" value="${SecondProfit.getAmount() / 1000}" />
                        document.querySelector('#item-amount-second').innerText = "+<fmt:formatNumber value="${amountKSecond}" pattern="0" />K";

                        <c:set var="amountKThird" value="${ThirdProfit.getAmount() / 1000}" />
                        document.querySelector('#item-amount-third').innerText = "+<fmt:formatNumber value="${amountKThird}" pattern="0" />K";

                        span.textContent = '수익';
                        span.style.backgroundColor = '#f55a1d';
                        span.style.color = '#fff';
                    });
                    amounts.forEach(div => div.style.color = '#f55a1d');

                    document.querySelector('#detail-1').innerText = "${FirstProfit.getFinancialName()}";
                    document.querySelector('#detail-2').innerText = "${SecondProfit.getFinancialName()}";
                    document.querySelector('#detail-3').innerText = "${ThirdProfit.getFinancialName()}";
                }
            }

            // 🔹 그래프 변경
            if (!config) {
                console.error(`${key} 그래프 구성 없음`);
                return;
            }

            chart.destroy();
            chart = new Chart(ctx, config);
        });
    });


    /*  ------- 거래내역 탭에서 수익만 보기, 지출만 보기 구현  ------ */
    document.addEventListener('DOMContentLoaded', () => {
        const rows = document.querySelectorAll('#transaction-table tbody tr');
        const buttons = document.querySelectorAll('.filter-btn');

        buttons.forEach(btn => {
            btn.addEventListener('click', () => {
                // 모든 버튼 비활성화
                buttons.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');

                const id = btn.id;

                rows.forEach(row => {
                    const typeCell = row.querySelector('.tag'); // <span class="tag expense">지출</span>
                    if (!typeCell) return;

                    const type = typeCell.textContent.trim(); // "수익" 또는 "지출"

                    if (id === 'btn-all') {
                        row.style.display = ''; // 모두 표시
                    } else if (id === 'btn-income' && type !== '수익') {
                        row.style.display = 'none';
                    } else if (id === 'btn-expense' && type !== '지출') {
                        row.style.display = 'none';
                    } else {
                        row.style.display = '';
                    }
                });
            });
        });
    });
    /*--------------------------------------------------------------------- */


    // ✅ 페이지 로드 시 마지막 탭 복원
    window.addEventListener('DOMContentLoaded', () => {
        const savedName = localStorage.getItem('tabName');
        if (savedName === 'transaction') {
            document.getElementById('tab-button-transaction').click();
        } else if (savedName === 'expense') {
            document.getElementById('tab-button-expense').click();
        } else if (savedName === 'money') {
            document.getElementById('tab-button-money').click();
        } else {
            document.getElementById('tab-button-overview').click();
        }
    });

</script>
</body>
</html>