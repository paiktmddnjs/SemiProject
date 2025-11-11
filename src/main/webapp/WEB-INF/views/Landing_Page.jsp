<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CREP - 크리에이터를 위한 통합 ERP</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Arimo:wght@400;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arimo', sans-serif;
            line-height: 1.6;
            color: #101828;
            background: #fff;
        }

        /* Header Styles */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            background: white;
            border-bottom: 1px solid #E5E7EB;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        .header-container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 1rem 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo-container {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .logo {
            width: 48px;
            height: 48px;

            border-radius: 10px;
        }

        .logo-text {
            font-size: 30px;
            font-weight: 700;
            color: #F54900;
        }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .btn {
            padding: 0.5rem 1rem;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            border: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s;
        }

        .btn-secondary {
            transform: none ;
            box-shadow: none ;
            background: transparent;
            color: #364153;
        }


        .btn-secondary:hover {
            background: #f3f4f6;
            transform: none;      /* 이동/확대 방지 */
            box-shadow: none;
        }

        .btn-primary {
            transform: none ;
            box-shadow: none ;
            background: #F54900;
            color: white;
        }

        .btn-primary:hover {
            background: #E04300;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, #FFF7ED 0%, white 50%, #FFEDD4 100%);
            padding: 12rem 1.5rem 6rem;
            overflow: hidden;
        }

        .hero-container {
            max-width: 1280px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            align-items: center;
        }

        .hero-content {
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: #FFEDD4;
            border-radius: 50px;
            padding: 0.5rem 1rem;
            width: fit-content;
        }

        .badge-dot {
            width: 16px;
            height: 16px;
            border-radius: 50%;
            background: #CA3500;
        }

        .badge-text {
            color: #CA3500;
            font-size: 14px;
        }

        .hero-title {
            font-size: 60px;
            font-weight: 700;
            line-height: 1.25;
        }

        .text-gradient {
            color: #F54900;
        }

        .hero-description {
            font-size: 20px;
            color: #4A5565;
            line-height: 1.4;
        }

        .hero-cta {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .btn-large {
            padding: 0.75rem 1.5rem;
            font-size: 18px;
        }

        .btn-white {
            background: white;
            color: #0A0A0A;
            border: 1px solid #D1D5DC;
        }

        .btn-white:hover {
            background: #f9fafb;
        }

        .social-proof {
            display: flex;
            align-items: center;
            gap: 2rem;
        }

        .avatar-stack {
            display: flex;
            margin-left: -12px;
        }

        .avatar-stack > * {
            margin-left: -12px;
        }

        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, #FF8904 0%, #F54900 100%);
            border: 2px solid white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 700;
            color: white;
        }

        .rating {
            display: flex;
            flex-direction: column;
            gap: 0.25rem;
        }

        .stars {
            display: flex;
            gap: 0.25rem;
        }

        .star {
            width: 20px;
            height: 20px;
            fill: #FF6900;
        }

        .rating-text {
            font-size: 14px;
            color: #4A5565;
        }

        .hero-image {
            position: relative;
        }

        .hero-image-wrapper {
            position: relative;
            border-radius: 24px;
            overflow: hidden;
            border: 4px solid rgba(255, 105, 0, 0.2);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .hero-image-wrapper::before {
            content: '';
            position: absolute;
            inset: -100px;
            background: linear-gradient(45deg, rgba(255, 105, 0, 0.2) 0%, rgba(245, 73, 0, 0.2) 100%);
            filter: blur(64px);
            z-index: -1;
        }

        .hero-image img {
            width: 100%;
            height: auto;
            display: block;
        }

        /* Features Grid */
        .features {
            background: white;
            padding: 6rem 1.5rem;
        }

        .section-header {
            text-align: center;
            margin-bottom: 4rem;
        }

        .section-title {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .section-description {
            font-size: 20px;
            color: #4A5565;
        }

        .features-grid {
            max-width: 1280px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 1.5rem;
        }

        .feature-card {
            padding: 1.5rem;
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 14px;
            transition: all 0.3s;
        }

        .feature-card:hover {
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            transform: translateY(-2px);
        }

        .feature-icon {
            width: 48px;
            height: 48px;
            background: #FFEDD4;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
        }



        .feature-icon svg {
            width: 24px;
            height: 24px;
            stroke: #F54900;
        }

        .feature-title {
            font-size: 16px;
            font-weight: 400;
            margin-bottom: 0.75rem;
            color: #101828;
        }

        .feature-description {
            font-size: 16px;
            color: #4A5565;
            line-height: 1.5;
        }

        /* Benefits Section */
        .benefits {
            background: #FFF7ED;
            padding: 6rem 1.5rem;
        }

        .benefits-container {
            max-width: 1280px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            align-items: center;
        }

        .benefits-image {
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .benefits-image img {
            width: 100%;
            height: auto;
            display: block;
        }

        .benefits-content {
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .benefits-header {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .benefits-title {
            font-size: 36px;
            font-weight: 700;
            line-height: 1.2;
        }

        .benefits-list {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .benefit-item {
            display: flex;
            gap: 1rem;
            align-items: flex-start;
        }

        .benefit-icon {
            width: 48px;
            height: 48px;
            background: #FFEDD4;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .benefit-icon svg {
            width: 24px;
            height: 24px;
            stroke: #F54900;
        }

        .benefit-content h3 {
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 0.25rem;
        }

        .benefit-content p {
            font-size: 16px;
            color: #4A5565;
        }

        /* Visual Benefits Section */
        .visual-benefits {
            background: linear-gradient(180deg, white 0%, #FFF7ED 100%);
            padding: 6rem 1.5rem;
        }

        .visual-benefits-container {
            max-width: 1280px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            align-items: center;
        }

        .visual-card {
            position: relative;
            height: 432px;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .visual-card-bg {
            position: absolute;
            inset: 0;
            background: linear-gradient(135deg, #FF8904 0%, #F54900 100%);
        }

        .visual-card-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(0deg, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0) 100%);
        }

        .visual-card-content {
            position: relative;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            padding: 2rem;
        }

        .visual-card-icon {
            width: 96px;
            height: 96px;
            margin-bottom: 1.5rem;
            opacity: 0.8;
        }

        .visual-card-icon svg {
            width: 100%;
            height: 100%;
            stroke: white;
        }

        .visual-card-title {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .visual-card-description {
            color: #FFEDD4;
            font-size: 16px;
        }

        /* Categories Section */
        .categories {
            background: white;
            padding: 6rem 1.5rem;
        }

        .categories-grid {
            max-width: 1280px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
        }

        .category-card {
            padding: 1.5rem;
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 14px;
            text-align: center;
            transition: all 0.3s;
            cursor: pointer;
        }

        .category-card:hover {
            border-color: #F54900;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* CTA Section */
        .cta {
            background: linear-gradient(90deg, #FF6900 0%, #F54900 100%);
            padding: 5rem 1.5rem;
        }

        .cta-container {
            max-width: 896px;
            margin: 0 auto;
            text-align: center;
        }

        .cta-header {
            margin-bottom: 3rem;
        }

        .cta-title {
            font-size: 36px;
            font-weight: 700;
            color: white;
            margin-bottom: 1rem;
        }

        .cta-description {
            font-size: 20px;
            color: #FFEDD4;
        }

        .cta-button {
            margin-bottom: 3rem;
        }

        .btn-cta {
            background: white;
            color: #F54900;
        }

        .btn-cta:hover {
            background: #f9fafb;
        }

        .cta-features {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1.5rem;
            flex-wrap: wrap;
        }

        .cta-feature {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #FFEDD4;
        }

        .cta-feature svg {
            width: 20px;
            height: 20px;
            stroke: #FFEDD4;
        }

        /* Footer */
        .footer {
            background: white;
            border-top: 1px solid #E5E7EB;
            padding: 3rem 1.5rem;
        }

        .footer-container {
            max-width: 1280px;
            margin: 0 auto;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .footer-section h3 {
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .footer-section p {
            font-size: 14px;
            color: #4A5565;
            white-space: pre-line;
        }

        .footer-links {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .footer-links a {
            font-size: 14px;
            color: #4A5565;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-links a:hover {
            color: #F54900;
        }

        .footer-bottom {
            padding-top: 2rem;
            border-top: 1px solid #E5E7EB;
            text-align: center;
        }

        .footer-copyright {
            font-size: 14px;
            color: #4A5565;
        }

        /* Responsive */
        @media (max-width: 1024px) {
            .hero-container,
            .benefits-container,
            .visual-benefits-container {
                grid-template-columns: 1fr;
            }

            .hero-title {
                font-size: 48px;
            }

            .features-grid {
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            }
        }

        @media (max-width: 768px) {
            .hero {
                padding: 8rem 1.5rem 4rem;
            }

            .hero-title {
                font-size: 36px;
            }

            .section-title {
                font-size: 28px;
            }

            .benefits-title,
            .cta-title {
                font-size: 28px;
            }

            .categories-grid {
                grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            }
        }

        .logo img {
            width: 100%; /* 부모 대비 비율 */
            height: 100%; /* 부모 대비 비율 */
            object-fit: contain; /* 비율 유지 */
        }
    </style>
</head>
<body>
<section class="hero">
    <div class="hero-container">
        <div class="hero-content">
            <div class="badge">
                <div class="badge-dot"></div>
                <span class="badge-text">1인 크리에이터를 위한 올인원 솔루션</span>
            </div>

            <h1 class="hero-title">
                크리에이터의<br>
                <span class="text-gradient">성장을 가속화</span>하는<br>
                통합 ERP
            </h1>

            <p class="hero-description">
                CREP으로 콘텐츠 일정, 수익 관리, 협찬 계약을 한 곳에서 효율적으로 관리하세요.
            </p>

            <div class="hero-cta">
                <button class="btn btn-primary btn-large" onclick="location.href='login'" >
                    무료로 시작하기
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                        <polyline points="12 5 19 12 12 19"></polyline>
                    </svg>
                </button>
                <button class="btn btn-white btn-large">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polygon points="5 3 19 12 5 21 5 3"></polygon>
                    </svg>
                    데모 보기
                </button>
            </div>

            <div class="social-proof">
                <div class="avatar-stack">
                    <div class="avatar">1K</div>
                    <div class="avatar">2K</div>
                    <div class="avatar">3K</div>
                    <div class="avatar">4K</div>
                </div>
                <div class="rating">
                    <div class="stars">
                        <svg class="star" viewBox="0 0 24 24">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                        </svg>
                        <svg class="star" viewBox="0 0 24 24">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                        </svg>
                        <svg class="star" viewBox="0 0 24 24">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                        </svg>
                        <svg class="star" viewBox="0 0 24 24">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                        </svg>
                        <svg class="star" viewBox="0 0 24 24">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                        </svg>
                    </div>
                    <p class="rating-text">크리에이터 사용 가능</p>
                </div>
            </div>
        </div>

        <div class="hero-image">
            <div class="hero-image-wrapper">
                <img src="랜딩페이지초기.png" alt="CREP Dashboard">
            </div>
        </div>
    </div>
</section>

<!-- Features Grid -->
<section class="features">
    <div class="section-header">
        <h2 class="section-title">모든 기능을 한곳에서</h2>
        <p class="section-description">크리에이터에게 필요한 모든 도구를 제공합니다</p>
    </div>

    <div class="features-grid">
        <div class="feature-card">
            <div class="feature-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                    <rect x="3" y="3" width="7" height="7"></rect>
                    <rect x="14" y="3" width="7" height="7"></rect>
                    <rect x="14" y="14" width="7" height="7"></rect>
                    <rect x="3" y="14" width="7" height="7"></rect>
                </svg>
            </div>
            <h3 class="feature-title">통합 대시보드</h3>
            <p class="feature-description">모든 플랫폼의 데이터를 한눈에 확인하고 성과를 실시간으로 모니터링하세요.</p>
        </div>

        <div class="feature-card">
            <div class="feature-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                    <line x1="16" y1="2" x2="16" y2="6"></line>
                    <line x1="8" y1="2" x2="8" y2="6"></line>
                    <line x1="3" y1="10" x2="21" y2="10"></line>
                </svg>
            </div>
            <h3 class="feature-title">스마트 일정 관리</h3>
            <p class="feature-description">콘텐츠 제작 일정을 효율적으로 관리하고 여러 플랫폼의 업로드 일정을 동기화하세요.</p>
        </div>

        <div class="feature-card">
            <div class="feature-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                    <path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path>
                </svg>
            </div>
            <h3 class="feature-title">콘텐츠 관리</h3>
            <p class="feature-description">리뷰, 브이로그, 튜토리얼, 소통, 엔터테인먼트 등 5가지 카테고리로 체계적으로 관리하세요.</p>
        </div>

        <div class="feature-card">
            <div class="feature-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                    <line x1="12" y1="1" x2="12" y2="23"></line>
                    <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                </svg>
            </div>
            <h3 class="feature-title">재무 관리</h3>
            <p class="feature-description">광고, 협찬, 후원, 굿즈 판매 등 다양한 수익원을 자동으로 집계하고 시각화하세요.</p>
        </div>

        <div class="feature-card">
            <div class="feature-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                    <polyline points="14 2 14 8 20 8"></polyline>
                    <line x1="16" y1="13" x2="8" y2="13"></line>
                    <line x1="16" y1="17" x2="8" y2="17"></line>
                    <polyline points="10 9 9 9 8 9"></polyline>
                </svg>
            </div>
            <h3 class="feature-title">협찬 계약</h3>
            <p class="feature-description">협찬 제안부터 계약, 정산까지 모든 과정을 체계적으로 관리하세요.</p>
        </div>

        <div class="feature-card">
            <div class="feature-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                    <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline>
                </svg>
            </div>
            <h3 class="feature-title">성장 분석</h3>
            <p class="feature-description">데이터 기반 인사이트로 채널 성장을 가속화하세요.</p>
        </div>
    </div>
</section>

<!-- Benefits Section -->
<section class="benefits">
    <div class="benefits-container">
        <div class="benefits-image">
            <img src="크리에이터.png" alt="CREP Features">
        </div>

        <div class="benefits-content">
            <div class="benefits-header">
                <h2 class="benefits-title">
                    크리에이터에게<br>
                    필요한 모든 것
                </h2>
                <p class="section-description">CREP은 크리에이터의 성공을 위해 설계되었습니다</p>
            </div>

            <div class="benefits-list">
                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                            <circle cx="12" cy="12" r="10"></circle>
                            <polyline points="12 6 12 12 16 14"></polyline>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>시간 절약</h3>
                        <p>반복적인 관리 업무를 자동화하여 콘텐츠 제작에 집중하세요.</p>
                    </div>
                </div>

                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                            <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>수익 최적화</h3>
                        <p>다양한 수익원을 분석하여 수익 구조를 최적화하세요.</p>
                    </div>
                </div>

                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                            <circle cx="9" cy="7" r="4"></circle>
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>협업 편의성</h3>
                        <p>팀원 및 협력사와 효율적으로 협업하세요.</p>
                    </div>
                </div>

                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                            <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>빠른 의사결정</h3>
                        <p>실시간 데이터로 신속하고 정확한 의사결정을 하세요.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Visual Benefits Section -->
<section class="visual-benefits">
    <div class="visual-benefits-container">
        <div class="visual-card">
            <div class="visual-card-bg"></div>
            <div class="visual-card-overlay"></div>
            <div class="visual-card-content">
                <div class="visual-card-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke-width="1.5">
                        <rect x="3" y="3" width="7" height="7"></rect>
                        <rect x="14" y="3" width="7" height="7"></rect>
                        <rect x="14" y="14" width="7" height="7"></rect>
                        <rect x="3" y="14" width="7" height="7"></rect>
                    </svg>
                </div>
                <h3 class="visual-card-title">CREP Dashboard</h3>
                <p class="visual-card-description">실시간 성과 모니터링</p>
            </div>
        </div>

        <div class="benefits-content">
            <div class="benefits-header">
                <h2 class="benefits-title">크리에이터의 성공을 위한 필수 도구</h2>
                <p class="section-description">CREP은 크리에이터의 비즈니스 성장을 지원합니다</p>
            </div>

            <div class="benefits-list">
                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                            <circle cx="12" cy="12" r="10"></circle>
                            <polyline points="12 6 12 12 16 14"></polyline>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>시간 절약</h3>
                        <p>반복적인 관리 업무를 자동화하여 콘텐츠 제작에 집중하세요.</p>
                    </div>
                </div>

                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                            <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>수익 최적화</h3>
                        <p>다양한 수익원을 분석하여 수익 구조를 최적화하세요.</p>
                    </div>
                </div>

                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                            <circle cx="9" cy="7" r="4"></circle>
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>협업 편의성</h3>
                        <p>팀원 및 협력사와 효율적으로 협업하세요.</p>
                    </div>
                </div>

                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                            <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>빠른 의사결정</h3>
                        <p>실시간 데이터로 신속하고 정확한 의사결정을 하세요.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Categories Section -->
<section class="categories">
    <div class="section-header">
        <h2 class="section-title">5가지 콘텐츠 카테고리</h2>
        <p class="section-description">체계적인 콘텐츠 분류로 효율적인 관리</p>
    </div>

    <div class="categories-grid">
        <div class="category-card">리뷰</div>
        <div class="category-card">브이로그</div>
        <div class="category-card">튜토리얼</div>
        <div class="category-card">소통</div>
        <div class="category-card">엔터테인먼트</div>
    </div>
</section>

<!-- CTA Section -->
<section class="cta">
    <div class="cta-container">
        <div class="cta-header">
            <h2 class="cta-title">지금 바로 시작하세요</h2>
            <p class="cta-description">무료로 CREP을 시작하고 크리에이터로서의 성장을 경험하세요</p>
        </div>

        <div class="cta-button">
            <button class="btn btn-cta btn-large">
                무료로 시작하기
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <line x1="5" y1="12" x2="19" y2="12"></line>
                    <polyline points="12 5 19 12 12 19"></polyline>
                </svg>
            </button>
        </div>

        <div class="cta-features">
            <div class="cta-feature">
                <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                    <polyline points="20 6 9 17 4 12"></polyline>
                </svg>
                <span>신용카드 불필요</span>
            </div>
            <div class="cta-feature">
                <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                    <rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect>
                    <line x1="1" y1="10" x2="23" y2="10"></line>
                </svg>
                <span>언제든지 취소 가능</span>
            </div>
            <div class="cta-feature">
                <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                </svg>
                <span>안전한 데이터 관리</span>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="footer">
    <div class="footer-container">
        <div class="footer-grid">
            <div class="footer-section">
                <h3>CREP</h3>
                <p>1인 크리에이터를 위한
                    통합 ERP 시스템</p>
            </div>

            <div class="footer-section">
                <h3>제품</h3>
                <ul class="footer-links">
                    <li><a href="#">기능</a></li>
                    <li><a href="#">요금제</a></li>
                    <li><a href="#">데모</a></li>
                </ul>
            </div>

            <div class="footer-section">
                <h3>지원</h3>
                <ul class="footer-links">
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">가이드</a></li>
                    <li><a href="#">FAQ</a></li>
                </ul>
            </div>

            <div class="footer-section">
                <h3>회사</h3>
                <ul class="footer-links">
                    <li><a href="#">소개</a></li>
                    <li><a href="#">블로그</a></li>
                    <li><a href="#">채용</a></li>
                </ul>
            </div>
        </div>

        <div class="footer-bottom">
            <p class="footer-copyright">© 2025 CREP. All rights reserved.</p>
        </div>
    </div>
</footer>

<script>
    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // Add scroll effect to header
    let lastScroll = 0;
    const header = document.querySelector('.header');

    window.addEventListener('scroll', () => {
        const currentScroll = window.pageYOffset;

        if (currentScroll > 100) {
            header.style.boxShadow = '0 2px 8px rgba(0, 0, 0, 0.1)';
        } else {
            header.style.boxShadow = '0 1px 2px rgba(0, 0, 0, 0.1)';
        }

        lastScroll = currentScroll;
    });

    // Button click animations
    document.querySelectorAll('.btn').forEach(button => {
        button.addEventListener('click', function(e) {
            const ripple = document.createElement('span');
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            const x = e.clientX - rect.left - size / 2;
            const y = e.clientY - rect.top - size / 2;

            ripple.style.width = ripple.style.height = size + 'px';
            ripple.style.left = x + 'px';
            ripple.style.top = y + 'px';
            ripple.classList.add('ripple');

            this.appendChild(ripple);

            setTimeout(() => ripple.remove(), 600);
        });
    });
</script>
</body>
</html>
