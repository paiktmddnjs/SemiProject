<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>콘텐츠 상세 - 신제품 리뷰</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arimo', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', sans-serif;
            background-color: #F9FAFB;
            color: #0A0A0A;
            line-height: 1.5;
        }

        .container {
            max-width: 1500px;
            margin: 0 auto;
            padding: 24px;
        }

        /* Header */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }

        .header-left {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .back-btn {
            width: 36px;
            height: 36px;
            border-radius: 8px;
            border: none;
            background: transparent;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.2s;
        }

        .back-btn:hover {
            background: rgba(255, 255, 255, 0.5);
        }

        .title-area {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .title-row {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .title-content {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .platform-icon {
            width: 20px;
            height: 20px;
        }

        .title-text {
            color: #F54900;
            font-size: 16px;
        }

        .status-badge {
            background-color: #F54900;
            color: white;
            padding: 2px 8px;
            border-radius: 8px;
            font-size: 12px;
        }

        .meta-row {
            display: flex;
            align-items: center;
            gap: 16px;
            color: #4A5565;
            font-size: 14px;
        }

        .meta-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .meta-icon {
            width: 16px;
            height: 16px;
        }

        .view-btn {
            background: white;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 10px 16px;
            display: flex;
            align-items: center;
            gap: 12px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.2s;
        }

        .view-btn:hover {
            background: #f9fafb;
        }

        /* Metric Cards */
        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 16px;
            margin-bottom: 24px;
        }

        .metric-card {
            background: white;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 14px;
            padding: 24px;
        }

        .metric-title {
            color: #64748B;
            font-size: 16px;
            margin-bottom: 42px;
        }

        .metric-content {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
        }

        .metric-values {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .metric-value {
            color: #F54900;
            font-size: 24px;
            font-weight: 700;
        }

        .metric-change {
            font-size: 12px;
        }

        .metric-change.positive {
            color: #00A63E;
        }

        .metric-change.negative {
            color: #EF4444;
        }

        .metric-icon {
            width: 32px;
            height: 32px;
            color: #99A1AF;
        }

        /* Section Header */
        .section-header {
            display: flex;
            align-items: center;
            gap: 8px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            padding-bottom: 12px;
            margin-bottom: 24px;
        }

        .section-icon {
            width: 20px;
            height: 20px;
            border: 2px solid #F54900;
        }

        .section-icon.square {
            border-radius: 2px;
        }

        .section-icon.rounded {
            border-radius: 4px;
        }

        .section-title {
            font-size: 20px;
            font-weight: 700;
            color: #0A0A0A;
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
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 14px;
            padding: 24px;
        }

        .chart-header {
            margin-bottom: 24px;
        }

        .chart-title {
            color: #0A0A0A;
            font-size: 16px;
            margin-bottom: 4px;
        }

        .chart-subtitle {
            color: #64748B;
            font-size: 16px;
        }

        .chart-container {
            height: 350px;
            position: relative;
        }

        /* Comments Section */
        .comments-card {
            background: white;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 14px;
            padding: 24px;
        }

        .comment-item {
            display: flex;
            gap: 12px;
            padding: 16px 0;
        }

        .comment-item:not(:last-child) {
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .comment-rank {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: #FFEDD4;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            color: #F54900;
            font-size: 14px;
        }

        .comment-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .comment-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .comment-username {
            color: #0A0A0A;
            font-size: 16px;
        }

        .comment-time {
            color: #6A7282;
            font-size: 12px;
        }

        .comment-text {
            color: #364153;
            font-size: 14px;
        }

        .comment-likes {
            display: flex;
            align-items: center;
            gap: 4px;
            color: #4A5565;
            font-size: 12px;
        }

        .comment-likes-icon {
            width: 12px;
            height: 12px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 16px;
            }

            .metrics-grid {
                grid-template-columns: 1fr;
            }

            .charts-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Header -->
    <div class="header">
        <div class="header-left">
            <button class="back-btn" onclick="goBack()">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M19 12H5M12 19l-7-7 7-7"/>
                </svg>
            </button>

            <div class="title-area">
                <div class="title-row">
                    <div class="title-content">
                        <svg class="platform-icon" viewBox="0 0 20 20" fill="none">
                            <rect x="1.65" y="4.11" width="16.71" height="11.78" rx="2" stroke="#E7000B" stroke-width="1.67"/>
                            <path d="M8.33 7.5L12.5 10L8.33 12.5V7.5Z" fill="#E7000B" stroke="#E7000B" stroke-width="1.67"/>
                        </svg>
                        <span class="title-text">신제품 리뷰 - 갤럭시 S25</span>
                    </div>
                    <span class="status-badge">게시됨</span>
                </div>

                <div class="meta-row">
                    <div class="meta-item">
                        <svg class="meta-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                        </svg>
                        <span>2025-10-25</span>
                    </div>
                    <div class="meta-item">
                        <svg class="meta-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z"></path>
                            <line x1="7" y1="7" x2="7.01" y2="7"></line>
                        </svg>
                        <span>리뷰</span>
                    </div>
                </div>
            </div>
        </div>

        <button class="view-btn" onclick="viewContent()">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path>
                <polyline points="15 3 21 3 21 9"></polyline>
                <line x1="10" y1="14" x2="21" y2="3"></line>
            </svg>
            <span>콘텐츠 보기</span>
        </button>
    </div>

    <!-- Metric Cards -->
    <div class="metrics-grid">
        <div class="metric-card">
            <div class="metric-title">총 조회수</div>
            <div class="metric-content">
                <div class="metric-values">
                    <div class="metric-value">15,420</div>
                    <div class="metric-change positive">+12.5% 평균 대비</div>
                </div>
                <svg class="metric-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"></path>
                    <circle cx="12" cy="12" r="3"></circle>
                </svg>
            </div>
        </div>

        <div class="metric-card">
            <div class="metric-title">좋아요</div>
            <div class="metric-content">
                <div class="metric-values">
                    <div class="metric-value">892</div>
                    <div class="metric-change positive">+8.3% 평균 대비</div>
                </div>
                <svg class="metric-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"></path>
                </svg>
            </div>
        </div>

        <div class="metric-card">
            <div class="metric-title">댓글</div>
            <div class="metric-content">
                <div class="metric-values">
                    <div class="metric-value">156</div>
                    <div class="metric-change positive">+15.2% 평균 대비</div>
                </div>
                <svg class="metric-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
                </svg>
            </div>
        </div>
    </div>

    <!-- Overview Section -->
    <div class="section-header">
        <div class="section-icon square"></div>
        <h2 class="section-title">개요</h2>
    </div>

    <div class="charts-grid">
        <!-- Performance Chart -->
        <div class="chart-card">
            <div class="chart-header">
                <h3 class="chart-title">성과 추이</h3>
                <p class="chart-subtitle">시간별 조회수, 좋아요, 댓글 변화</p>
            </div>
            <div class="chart-container">
                <canvas id="performanceChart"></canvas>
            </div>
        </div>

        <!-- Age Chart -->
        <div class="chart-card">
            <div class="chart-header">
                <h3 class="chart-title">시청자 연령대</h3>
                <p class="chart-subtitle">연령별 시청자 분포</p>
            </div>
            <div class="chart-container">
                <canvas id="ageChart"></canvas>
            </div>
        </div>
    </div>

    <!-- Comments Section -->
    <div class="section-header">
        <div class="section-icon rounded"></div>
        <h2 class="section-title">댓글</h2>
    </div>

    <div class="comments-card">
        <div class="chart-header">
            <h3 class="chart-title">인기 댓글</h3>
            <p class="chart-subtitle">좋아요가 가장 많은 댓글</p>
        </div>

        <div id="commentsList">
            <!-- Comments will be populated by JavaScript -->
        </div>
    </div>
</div>

<script>
    // Comments data
    const comments = [
        {
            rank: 1,
            username: '사용자A',
            timeAgo: '2일 전',
            text: '정말 유익한 콘텐츠네요! 감사합니다.',
            likes: 234
        },
        {
            rank: 2,
            username: '사용자B',
            timeAgo: '3일 전',
            text: '이런 콘텐츠 기다렸어요 ㅠㅠ',
            likes: 189
        },
        {
            rank: 3,
            username: '사용자C',
            timeAgo: '3일 전',
            text: '설명이 너무 명확해서 이해하기 쉬웠어요',
            likes: 156
        },
        {
            rank: 4,
            username: '사용자D',
            timeAgo: '4일 전',
            text: '다음 편도 기대하고 있습니다!',
            likes: 142
        },
        {
            rank: 5,
            username: '사용자E',
            timeAgo: '5일 전',
            text: '구독하고 갑니다~~',
            likes: 128
        }
    ];

    // Populate comments
    function populateComments() {
        const container = document.getElementById('commentsList');
        container.innerHTML = comments.map(comment => `
                <div class="comment-item">
                    <div class="comment-rank">${comment.rank}</div>
                    <div class="comment-content">
                        <div class="comment-header">
                            <span class="comment-username">${comment.username}</span>
                            <span class="comment-time">${comment.timeAgo}</span>
                        </div>
                        <p class="comment-text">${comment.text}</p>
                        <div class="comment-likes">
                            <svg class="comment-likes-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3"></path>
                            </svg>
                            <span>${comment.likes}</span>
                        </div>
                    </div>
                </div>
            `).join('');
    }

    // Initialize Performance Chart
    function initPerformanceChart() {
        const ctx = document.getElementById('performanceChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['1일차', '2일차', '3일차', '4일차', '5일차', '6일차', '7일차'],
                datasets: [
                    {
                        label: '조회수',
                        data: [1200, 2800, 4200, 6500, 8900, 11500, 15420],
                        borderColor: '#EA580C',
                        backgroundColor: 'transparent',
                        borderWidth: 2,
                        pointBackgroundColor: 'white',
                        pointBorderColor: '#EA580C',
                        pointBorderWidth: 2,
                        pointRadius: 3,
                        tension: 0.4
                    },
                    {
                        label: '좋아요',
                        data: [45, 78, 124, 198, 312, 523, 892],
                        borderColor: '#FB923C',
                        backgroundColor: 'transparent',
                        borderWidth: 2,
                        pointBackgroundColor: 'white',
                        pointBorderColor: '#FB923C',
                        pointBorderWidth: 2,
                        pointRadius: 3,
                        tension: 0.4
                    },
                    {
                        label: '댓글',
                        data: [12, 23, 35, 48, 67, 89, 156],
                        borderColor: '#FDBA74',
                        backgroundColor: 'transparent',
                        borderWidth: 2,
                        pointBackgroundColor: 'white',
                        pointBorderColor: '#FDBA74',
                        pointBorderWidth: 2,
                        pointRadius: 3,
                        tension: 0.4
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: true,
                        position: 'bottom',
                        labels: {
                            color: '#0A0A0A',
                            font: {
                                size: 12
                            },
                            padding: 15,
                            usePointStyle: true
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            color: '#717182',
                            font: {
                                size: 12
                            }
                        },
                        grid: {
                            display: false
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
                            display: false
                        }
                    }
                }
            }
        });
    }

    // Initialize Age Chart
    function initAgeChart() {
        const ctx = document.getElementById('ageChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['13-17', '18-24', '25-34', '35-44', '45+'],
                datasets: [{
                    label: '시청자 비율',
                    data: [15, 35, 28, 15, 7],
                    backgroundColor: '#EA580C',
                    borderRadius: 4
                }]
            },
            options: {
                indexAxis: 'y',
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    x: {
                        beginAtZero: true,
                        ticks: {
                            color: '#717182',
                            font: {
                                size: 12
                            }
                        },
                        grid: {
                            display: false
                        }
                    },
                    y: {
                        ticks: {
                            color: '#717182',
                            font: {
                                size: 12
                            }
                        },
                        grid: {
                            display: false
                        }
                    }
                }
            }
        });
    }

    // Button handlers
    function goBack() {
        window.history.back();
    }

    function viewContent() {
        alert('콘텐츠 페이지로 이동합니다.');
    }

    // Initialize on load
    window.addEventListener('DOMContentLoaded', function() {
        populateComments();
        initPerformanceChart();
        initAgeChart();
    });
</script>
</body>
</html>
