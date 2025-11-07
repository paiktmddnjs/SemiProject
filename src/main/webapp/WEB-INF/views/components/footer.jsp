<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 11. 4.
  Time: 오후 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>CREP Footer</title>

    <style>
        :root {
            --text-strong: #101828;
            --text: #4a5565;
            --muted: #6a7282;
            --border: #e5e7eb;
            --bg: #f9fafb;
            --card: #ffffff;
            --brand: #f54900;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html, body {
            height: 100%;
        }

        body {
            font-family: 'Arimo', 'Noto Sans KR', sans-serif;
            background-color: var(--bg);
            color: var(--text);
            line-height: 1.5;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        main {
            flex: 1; /* 푸터가 항상 하단에 오도록 */
        }

        footer.footer {
            border-top: 1px solid var(--border);
            background-color: var(--card);
            width: 100%;
        }

        .footer-inner {
            max-width: 1200px;
            margin: 0 auto;
            padding: 32px 24px;
            display: grid;
            gap: 32px;
        }

        /* footer main sections grid */
        .footer-sections {
            display: grid;
            gap: 24px;
            grid-template-columns: 1fr;
        }

        @media (min-width: 640px) {
            .footer-sections {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (min-width: 1024px) {
            .footer-sections {
                grid-template-columns: repeat(4, 1fr);
            }
        }

        .section h3 {
            font-size: 16px;
            line-height: 24px;
            color: var(--text-strong);
            font-weight: bold;
            margin-bottom: 12px;
        }

        .section .desc {
            font-size: 14px;
            color: var(--text);
            margin-bottom: 12px;
        }

        .link-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .link-list a {
            display: inline-block;
            text-decoration: none;
            font-size: 14px;
            color: var(--text);
            padding: 2px 0;
            border-radius: 6px;
            transition: color 0.15s ease, background-color 0.15s ease, transform 0.1s ease;
        }

        .link-list a:hover {
            color: var(--brand);
            background-color: rgba(245, 73, 0, 0.08);
        }

        .link-list a:active {
            transform: scale(0.98);
        }

        .link-list a:focus-visible {
            outline: 2px solid var(--brand);
            outline-offset: 2px;
        }

        .footer-bottom {
            border-top: 1px solid var(--border);
            padding-top: 16px;
            text-align: center;
            font-size: 14px;
            color: var(--text);
        }

        @media (prefers-reduced-motion: reduce) {
            .link-list a {
                transition: none;
            }
        }
    </style>
</head>

<body>
<main>
    <!-- 메인 콘텐츠 자리 (푸터는 항상 하단에 고정됨) -->
</main>

<footer class="footer" aria-labelledby="footer-title">
    <div class="footer-inner">
        <h2 id="footer-title" class="sr-only" style="position:absolute;left:-9999px;">CREP 푸터</h2>

        <div class="footer-sections">
            <!-- CREP 소개 -->
            <section class="section" aria-labelledby="footer-crep">
                <h3 id="footer-crep">CREP</h3>
                <p class="desc">
                    1인 크리에이터를 위한<br/>
                    통합 ERP 시스템
                </p>
            </section>

            <!-- 제품 -->
            <nav class="section" aria-labelledby="footer-product">
                <h3 id="footer-product">제품</h3>
                <ul class="link-list">
                    <li><a href="#">기능</a></li>
                    <li><a href="#">요금제</a></li>
                    <li><a href="#">데모</a></li>
                </ul>
            </nav>

            <!-- 지원 -->
            <nav class="section" aria-labelledby="footer-support">
                <h3 id="footer-support">지원</h3>
                <ul class="link-list">
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">가이드</a></li>
                    <li><a href="#">FAQ</a></li>
                </ul>
            </nav>

            <!-- 회사 -->
            <nav class="section" aria-labelledby="footer-company">
                <h3 id="footer-company">회사</h3>
                <ul class="link-list">
                    <li><a href="#">소개</a></li>
                    <li><a href="#">블로그</a></li>
                    <li><a href="#">채용</a></li>
                </ul>
            </nav>
        </div>

        <div class="footer-bottom">
            © 2025 CREP. All rights reserved.
        </div>
    </div>
</footer>
</body>
</html>

