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

    <!-- ✅ Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        /* ✅ 오렌지 버튼 스타일 강제 적용 */
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
            --bs-btn-focus-shadow-rgb: 245, 73, 0;
        }

        /* ✅ 버튼 클릭/포커스 시 배경색도 주황으로 */
        .btn-primary:focus, .btn-outline-primary:focus {
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
            font-family: 'Arimo','Noto Sans KR',system-ui,-apple-system,Segoe UI,Roboto,Arial,sans-serif;
            background: #fff;
            color: #111827;
        }

        /* App Header */
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

        /* Left */
        .left-section {
            display: flex;
            align-items: center;
            gap: 12px;
            min-width: 0;
        }

        .menu-button,
        .icon-button {
            width: 36px; height: 36px;
            border-radius: 8px;
            border: 0;
            background: transparent;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: transform .1s ease, background-color .15s ease;
        }
        .menu-button:hover,
        .icon-button:hover { background: #f3f4f6; transform: scale(.96); }

        .menu-icon, .button-icon { width: 20px; height: 20px; }

        .logo {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            min-width: 0;
        }
        .logo img {
            width: 44px; height: 44px; border-radius: 4px; flex: 0 0 auto;
        }
        .logo-text {
            font-size: 26px;
            font-weight: 800;
            color: var(--brand);
            line-height: 1;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        /* Center (Search) */
        .search-wrap {
            flex: 1 1 auto;
            min-width: 160px;
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
            font-size: 14px;
            color: #111827;
            outline: none;
        }
        .search-input::placeholder { color: var(--muted); }
        .search-input:focus { border-color: var(--ring); background: #fff; }

        .search-icon {
            position: absolute;
            left: 12px; top: 50%;
            transform: translateY(-50%);
            width: 16px; height: 16px;
            opacity: .9;
            pointer-events: none;
        }

        /* Right */
        .right-section {
            display: flex; align-items: center; gap: 10px;
            flex: 0 0 auto;
        }

        .notification-badge {
            position: absolute;
            top: 4px; right: 4px;
            width: 8px; height: 8px;
            background: #fb2c36; border-radius: 999px;
        }

        .avatar-button {
            width: 40px; height: 40px; padding: 1px;
            border-radius: 999px; border: 1px solid #ffd6a7;
            background: transparent; cursor: pointer; overflow: hidden;
            transition: transform .1s ease, opacity .15s ease;
        }
        .avatar-button:hover { transform: scale(.96); opacity: .9; }
        .avatar-image { width: 100%; height: 100%; object-fit: cover; border-radius: 999px; }

        /* A11y helper */
        .sr-only {
            position: absolute; width: 1px; height: 1px;
            padding: 0; margin: -1px; overflow: hidden; clip: rect(0,0,0,0);
            white-space: nowrap; border: 0;
        }

        .auth-buttons {
            display: flex;
            align-items: center;
            gap: 8px; /* Tailwind의 gap-2 */
        }

        /* 공통 버튼 스타일 */
        .auth-buttons button {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        /* 아이콘 공통 크기 */
        .auth-buttons .icon {
            width: 16px;
            height: 16px;
        }




        /* Responsive */
        @media (max-width: 1024px) {
            .logo-text { font-size: 22px; }
            .search-container { width: min(480px, 100%); }
        }
        @media (max-width: 768px) {
            .header-content { gap: 8px; padding: 0 12px; }
            .logo-text { display: none; } /* 로고 텍스트 축약 */
            .search-container { width: 100%; }
        }
        @media (max-width: 480px) {
            .menu-button, .icon-button { width: 34px; height: 34px; }
            .search-input { height: 38px; }
            .search-wrap { order: 3; } /* 작은 화면에서 검색창을 오른쪽 버튼 뒤로 보낼 수도 있음 */
        }

        /* Optional: 다크 모드 토글 시 */
        .dark body, .dark .app-header { background: #0b0f1a; color: #e5e7eb; }
        .dark .app-header { border-bottom-color: #263043; }
        .dark .search-input { background: #131a2a; border-color: #2a3650; color: #e5e7eb; }
        .dark .search-input::placeholder { color: #9aa3b2; }
        .dark .menu-button:hover,
        .dark .icon-button:hover { background: #101727; }
    </style>
</head>
<body>
<header class="app-header" role="banner">
    <div class="header-content">
        <!-- Left: Menu + Logo -->
        <div class="left-section">
            <a href="<c:url value='/'/>" class="logo" aria-label="홈으로 이동">
                <img src="<c:url value='/resources/images/logo.png'/>" alt="CREP 로고" />
                <span class="logo-text">CREP</span>
            </a>
        </div>
<c:choose>
    <c:when test="${empty sessionScope.loginMember}">

        <!-- Right: Actions -->
        <div class="right-section">
            <button class="icon-button" type="button" aria-label="테마 전환" id="themeToggleBtn">
                <img class="button-icon" src="<c:url value='/resources/images/moon_icon.png'/>" alt="" />
            </button>
            <div class="d-flex align-items-center gap-2">
                <a href="${pageContext.request.contextPath}/loginForm.me"
                   class="btn btn-outline-primary btn-sm d-flex align-items-center gap-1">
                    <i data-lucide="log-in" class="icon"></i>
                    <span>로그인</span>
                </a>

                <a href="${pageContext.request.contextPath}/enrollForm.me"
                   class="btn btn-primary btn-sm d-flex align-items-center gap-1">
                    <i data-lucide="user-plus" class="icon"></i>
                    <span>회원가입</span>
                </a>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <!-- Center: Search -->
        <div class="search-wrap">
            <form class="search-container" role="search" action="" method="get">
                <label for="globalSearch" class="sr-only">검색</label>
                <input id="globalSearch" name="q" type="search" class="search-input" placeholder="검색..." autocomplete="off" />
                <img class="search-icon" src="<c:url value='/resources/images/search_icon.png'/>" alt="" aria-hidden="true" />
            </form>
        </div>

        <!-- Right: Actions -->
        <div class="right-section">
            <button class="icon-button" type="button" aria-label="테마 전환" id="themeToggleBtn">
                <img class="button-icon" src="<c:url value='/resources/images/moon_icon.png'/>" alt="" />
            </button>

            <button class="icon-button" type="button" aria-label="알림 열기" id="notifyBtn" style="position: relative;">
                <img class="button-icon" src="<c:url value='/resources/images/bell_icon.png'/>" alt="" />
                <span class="notification-badge" aria-hidden="true"></span>
            </button>

            <button class="avatar-button" type="button" aria-label="프로필 메뉴 열기" id="profileBtn">
                <img class="avatar-image" src="<c:url value='/resources/images/avatar_image.png'/>" alt="사용자 프로필" />
            </button>
        </div>
        </c:otherwise>
    </c:choose>
    </div>
</header>
<!-- Lucide Icons -->
<script src="https://unpkg.com/lucide@latest"></script>
<script>

    if (window.lucide) lucide.createIcons();

    document.getElementById('themeToggleBtn')?.addEventListener('click', () => {
        document.documentElement.classList.toggle('dark');
    });
    // 사이드바 토글 (프로젝트에 맞게 이벤트/클래스 연결)
    document.getElementById('menuToggleBtn')?.addEventListener('click', function () {
        // 예: document.body.classList.toggle('sidebar-open');
        console.log('사이드바 토글');
    });

    // 검색 입력 변화 로깅
    document.getElementById('globalSearch')?.addEventListener('input', function (e) {
        // 디바운싱 / 자동완성 로직을 여기에 연결 가능
        // console.log('검색어:', e.target.value);
    });

    // 다크 모드 토글 (간단 구현: html 최상단에 .dark 토글)
    document.getElementById('themeToggleBtn')?.addEventListener('click', function () {
        const root = document.documentElement;
        root.classList.toggle('dark');
        // 아이콘 교체가 필요하면 여기서 처리 (예: moon <-> sun)
    });

    // 알림 버튼
    document.getElementById('notifyBtn')?.addEventListener('click', function () {
        // 알림 드롭다운 열기/닫기 로직 연결
        console.log('알림 클릭');
    });

    // 프로필 버튼
    document.getElementById('profileBtn')?.addEventListener('click', function () {
        // 프로필 메뉴 열기/닫기 로직 연결
        console.log('프로필 메뉴');
    });

    // 모바일에서 Enter 제출 시 빈 검색 방지
    document.querySelector('.search-container')?.addEventListener('submit', function (e) {
        const v = (document.getElementById('globalSearch')?.value || '').trim();
        if (!v) e.preventDefault();
    });
</script>
<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
