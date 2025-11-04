<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>광고 , 후원 , 협찬 , 굿즈별, 수익 변화</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
    <style>
        /* 차트 컨테이너 스타일 */
        * {
            box-sizing: border-box;
            /* Note: Noto Sans KR font link is missing here, but assuming it's available or using default system font */
        }

        .chart-container {

            padding-left:55px;
            padding-top: 15px;
            border-radius: 12px;
            background-color: #ffffff;
            max-height: 500px;
        }

        /* 부제목 스타일 */
        h2 {
            text-align: left;
            color: #555;
            font-size: 18px;
            font-weight: bold;
            margin-top: 0;
            margin-bottom: 10px;
            padding-left: 0;
        }

        /* 캔버스 자체의 스타일 */
        #myChart {
            display: block;
            width: 100% !important;
            max-height: 440px;
            max-width: 900px;
        }
    </style>
</head>
<div class="chart-container">
    <h2>수익원별 추이</h2>
    <canvas id="myChart"></canvas>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const ctx = document.getElementById('myChart');

        // 월별 데이터로 가정하고 레이블 변경
        const categories = ['4월', '5월', '6월', '7월', '8월', '9월', '10월'];

        const myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: categories,
                datasets: [
                    {
                        label: '마케팅',
                        // 수익 데이터 (만원 단위로 임의 조정)
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
                    {
                        label: '장비',
                        data: [100, 150, 200, 150, 100, 150, 100],
                        backgroundColor: '#abc8ec'
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    // 주 제목 역할
                    title: {
                        display: true,
                        text: '장비, 소프트웨어, 외주, 마케팅별 지출 변화', // 제목 수정
                        color: '#b3b3bd',
                        position: 'top',
                        align: 'start',
                        font: {
                            size: 18,
                            weight: 'bold'
                        },
                        padding: {
                            top: 10,
                            bottom: 40
                        }
                    },
                    legend: {
                        display: true,
                        position: 'bottom',
                    }
                },
                scales: {
                    x: {
                        stacked: true,
                        title: {
                            display: true,

                        }
                    },
                    y: {
                        stacked: true,
                        // 💡 Y축 눈금 설정 💡
                        min: 0,
                        max: 5000, // 최대값을 8000으로 설정
                        ticks: {
                            stepSize: 1000, // 눈금 간격을 2000으로 설정 (0, 2000, 4000, 6000, 8000)
                            callback: function(value, index, values) {
                                // 눈금 값에 '만원' 추가 (선택 사항)
                                return value + ' 만원';
                            }
                        },
                        title: {
                            display: true,
                            text: '수익 (단위: 만원)'
                        }
                    }
                }
            }
        });
    });
</script>

