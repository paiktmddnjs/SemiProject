<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 11. 4.
  Time: 오후 12:38
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>CREP</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        /* 오렌지 버튼 스타일 */
        .btn-primary {
            --bs-btn-bg: #f54900;
            --bs-btn-border-color: #f54900;
            --bs-btn-hover-bg: #d94000;
            --bs-btn-hover-border-color: #d94000;
            --bs-btn-active-bg: #c24100;
            --bs-btn-active-border-color: #c24100;
            --bs-btn-focus-shadow-rgb: 245, 73, 0;
        }

        .btn-outline-primary {
            --bs-btn-color: #f54900;
            --bs-btn-border-color: #f54900;
            --bs-btn-hover-bg: #f54900;
            --bs-btn-hover-border-color: #f54900;
            --bs-btn-hover-color: #fff;
            --bs-btn-active-bg: #c24100;
            --bs-btn-active-border-color: #c24100;
        }

        .btn-primary:focus,
        .btn-outline-primary:focus {
            box-shadow: 0 0 0 0.25rem rgba(245, 73, 0, 0.35) !important;
        }

        :root{
            --header-h:72px;
            --border:#e5e7eb;
            --muted:#717182;
            --muted-bg:#f3f3f5;
            --ring:#9ca3af;
            --brand:#f54900;
            --shadow:0 1px 3px rgba(0,0,0,.1), 0 1px 2px -1px rgba(0,0,0,.1);
            font-family: 'Arimo','Noto Sans KR',system-ui,-apple-system,Segoe UI,Roboto,Arial,sans-serif;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            background: #fff;
            color: #111827;
        }

        /* Header */
        .app-header {
            position: sticky;
            top: 0;
            z-index: 50;
            width: 100%;
            height: var(--header-h);
            border-bottom: 1px solid var(--border);
            background: #fff;
            box-shadow: var(--shadow);
        }

        .header-content {
            height: 100%;
            width: 100%;
            margin: 0 auto;
            padding: 0 16px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
        }

        .left-section {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .menu-button,
        .icon-button {
            width: 36px;
            height: 36px;
            border-radius: 8px;
            border: 0;
            background: transparent;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: background-color .15s ease;
        }
        .menu-button:hover,
        .icon-button:hover {
            background: #f3f4f6;
        }

        .button-icon {
            width: 20px;
            height: 20px;
        }

        .logo {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
        }
        .logo img {
            width: 44px;
            height: 44px;
            border-radius: 4px;
        }
        .logo-text {
            font-size: 26px;
            font-weight: 800;
            color: var(--brand);
        }

        /* Search */
        .search-wrap {
            flex: 1 1 auto;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .search-container {
            position: relative;
            width: min(720px, 100%);
        }

        .search-input {
            width: 100%;
            height: 40px;
            padding: 8px 14px 8px 40px;
            background: var(--muted-bg);
            border: 1px solid #d1d5dc;
            border-radius: 10px;
        }

        .search-input:focus {
            border-color: var(--ring);
            background: #fff;
        }

        .search-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            width: 16px;
            height: 16px;
        }

        /* Right Section */
        .right-section {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .avatar-button {
            width: 40px;
            height: 40px;
            border: 1px solid #ffd6a7;
            border-radius: 999px;
            overflow: hidden;
            background: transparent;
        }

        .avatar-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 999px;
        }

        /* Responsive */
        @media (max-width: 1024px) {
            .logo-text { font-size: 22px; }
        }

        @media (max-width: 768px) {
            .logo-text { font-size: 20px; }
        }

        @media (max-width: 480px) {
            .logo-text { font-size: 18px; }
        }
    </style>
</head>
<body>

<header class="app-header">
    <div class="header-content">

        <!-- Left Logo -->
        <div class="left-section">
            <a href="<c:url value='/'/>" class="logo">
                <img src="<c:url value='/resources/images/logo.png'/>" alt="CREP 로고" />
                <span class="logo-text">CREP</span>
            </a>
        </div>

        <c:choose>

            <%-- 로그인 전 --%>
            <c:when test="${empty sessionScope.loginMember}">
                <div class="right-section">
                    <button class="icon-button" id="themeToggleBtn">
                        <img class="button-icon" src="<c:url value='/resources/images/moon_icon.png'/>" />
                    </button>

                    <a href="${pageContext.request.contextPath}/loginForm.me"
                       class="btn btn-outline-primary btn-sm d-flex align-items-center gap-1">
                        <i data-lucide="log-in" class="icon"></i>
                        로그인
                    </a>

                    <a href="${pageContext.request.contextPath}/enrollForm.me"
                       class="btn btn-primary btn-sm d-flex align-items-center gap-1">
                        <i data-lucide="user-plus" class="icon"></i>
                        회원가입
                    </a>
                </div>
            </c:when>

            <%-- 로그인 후 --%>
            <c:otherwise>
                <div class="search-wrap">
                    <form class="search-container">
                        <input id="globalSearch" class="search-input" placeholder="검색..." />
                        <img class="search-icon" src="<c:url value='/resources/images/search_icon.png'/>" />
                    </form>
                </div>

                <div class="right-section">

                    <button class="icon-button" id="themeToggleBtn">
                        <img class="button-icon" src="<c:url value='/resources/images/moon_icon.png'/>" />
                    </button>

                    <button class="icon-button" id="notifyBtn" style="position: relative;">
                        <img class="button-icon" src="<c:url value='/resources/images/bell_icon.png'/>" />
                        <span class="notification-badge" style="position:absolute;top:4px;right:4px;width:8px;height:8px;background:#fb2c36;border-radius:999px;"></span>
                    </button>

                    <button class="avatar-button" id="profileBtn">
                        <img class="avatar-image" src="<c:url value='/resources/images/avatar_image.png'/>" />
                    </button>
                </div>
            </c:otherwise>

        </c:choose>

    </div>
</header>

<!-- Icons -->
<script src="https://unpkg.com/lucide@latest"></script>
<script>
    if (window.lucide) lucide.createIcons();

    document.getElementById('themeToggleBtn')?.addEventListener('click', ()=> {
        document.documentElement.classList.toggle('dark');
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
