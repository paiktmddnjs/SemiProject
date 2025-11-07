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
             /* 기본 리셋 */
         * { box-sizing: border-box; }
        html, body { margin: 0; padding: 0; }
        p, h1, h2, h3, h4, h5, h6 { margin: 0; }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background: #f9fafb;
            color: #364153;
        }

        .app { min-height: 100%; display: flex; flex-direction: column; }

        /* ───── Footer ───── */
        .footer {
            background: #fff;
            border-top: 1px solid #e5e7eb;
            padding: 16px 0;
            color: #364153;
        }

        .footer .container {
            max-width: 1120px;
            margin: 0 auto;
            padding: 0 16px;
        }

        .footer .div {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 16px;
        }

        /* 브랜드 블록 */
        .footer .container-2 .heading .text-wrapper {
            font-weight: 700;
            font-size: 16px;
            line-height: 1.2;
        }
        .footer .paragraph .text-wrapper-2,
        .footer .paragraph .text-wrapper-3 {
            font-size: 12px;
            line-height: 1.4;
            color: #6a7282;
        }

        /* 각 컬럼 공통 */
        .footer .heading .text-wrapper {
            font-weight: 600;
            font-size: 13px;
            line-height: 1.2;
            color: #101828;
            margin-bottom: 8px;
        }

        .footer .list {
            display: grid;
            gap: 6px;
        }

        .footer .list-item .text-wrapper-4,
        .footer .list-item .text-wrapper-5 {
            font-size: 12px;
            line-height: 1.4;
            color: #4a5565;
        }

        /* 하단 저작권 */
        .footer .container-6 {
            border-top: 1px solid #e5e7eb;
            margin-top: 12px;
            padding-top: 10px;
        }
        .footer .container-6 .p {
            font-size: 12px;
            line-height: 1.4;
            color: #6a7282;
        }

        /* 링크 효과 */
        .footer [class*="link"] .text-wrapper-4,
        .footer [class*="link"] .text-wrapper-5 { cursor: pointer; }
        .footer [class*="link"]:hover .text-wrapper-4,
        .footer [class*="link"]:hover .text-wrapper-5 { text-decoration: underline; }

        /* 반응형 */
        @media (max-width: 960px) {
            .footer .div { grid-template-columns: repeat(2, minmax(0, 1fr)); }
        }
        @media (max-width: 560px) {
            .footer { padding: 12px 0; }
            .footer .div { grid-template-columns: 1fr; gap: 12px; }
            .footer .heading .text-wrapper { margin-bottom: 6px; }
        }

        /* 초슬림 모드 */
        .footer.is-compact {
            padding: 10px 0;
        }
        .footer.is-compact .div { gap: 10px; }
        .footer.is-compact .heading .text-wrapper { font-size: 12px; margin-bottom: 6px; }
        .footer.is-compact .list { gap: 4px; }
        .footer.is-compact .list-item .text-wrapper-4,
        .footer.is-compact .list-item .text-wrapper-5,
        .footer.is-compact .paragraph .text-wrapper-2,
        .footer.is-compact .paragraph .text-wrapper-3,
        .footer.is-compact .container-6 .p {
            font-size: 11.5px;
        }
        .footer.is-compact .container-6 { margin-top: 8px; padding-top: 8px; }
    </style>
</head>

<body>
<div class="app">
    <footer class="footer is-compact">
        <div class="container">
            <div class="div">
                <div class="container-2">
                    <div class="heading"><div class="text-wrapper">CREP</div></div>
                    <div class="paragraph">
                        <div class="text-wrapper-2">1인 크리에이터를 위한</div>
                        <div class="text-wrapper-3">통합 ERP 시스템</div>
                    </div>
                </div>
                <div class="container-3">
                    <div class="heading"><div class="text-wrapper">제품</div></div>
                    <div class="list">
                        <div class="list-item">
                            <div class="link"><div class="text-wrapper-4">기능</div></div>
                        </div>
                        <div class="list-item">
                            <div class="div-wrapper"><div class="text-wrapper-4">요금제</div></div>
                        </div>
                        <div class="list-item">
                            <div class="link"><div class="text-wrapper-4">데모</div></div>
                        </div>
                    </div>
                </div>
                <div class="container-4">
                    <div class="heading"><div class="text-wrapper">지원</div></div>
                    <div class="list">
                        <div class="list-item">
                            <div class="link-2"><div class="text-wrapper-4">고객센터</div></div>
                        </div>
                        <div class="list-item">
                            <div class="div-wrapper"><div class="text-wrapper-4">가이드</div></div>
                        </div>
                        <div class="list-item">
                            <div class="link-3"><div class="text-wrapper-5">FAQ</div></div>
                        </div>
                    </div>
                </div>
                <div class="container-5">
                    <div class="heading"><div class="text-wrapper">회사</div></div>
                    <div class="list">
                        <div class="list-item">
                            <div class="link"><div class="text-wrapper-4">소개</div></div>
                        </div>
                        <div class="list-item">
                            <div class="div-wrapper"><div class="text-wrapper-4">블로그</div></div>
                        </div>
                        <div class="list-item">
                            <div class="link"><div class="text-wrapper-4">채용</div></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-6"><p class="p">© 2025 CREP. All rights reserved.</p></div>
        </div>
    </footer>
</div>
</body>
</html>
