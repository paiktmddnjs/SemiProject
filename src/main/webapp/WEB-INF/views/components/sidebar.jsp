<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>Sidebar</title>
    <style>
        :root{
            --sb-w: 256px;
            --sb-w-collapsed: 72px;
            --border: #e5e7eb;
            --text: #364153;
            --muted: #6a7282;
            --brand: #f54900;
            --hover: #ffedd4;
            --ring: #cbd5e1;
            --shadow: 0 1px 3px rgba(0,0,0,.06), 0 1px 2px rgba(0,0,0,.04);
            --radius: 10px;
            --bg: #fff;
            --muted-bg: #f3f4f6;
            --danger: #fb2c36;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }
        html, body { height: 100%; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif;
            color: #111827;
            background: #fff;
        }

        /* ===== Sidebar 기본 ===== */
        .sidebar {
            position: static;
            height: auto;
            min-height: 100%;           /* ✅ 그리드 셀 높이 채우기 */
            background: var(--bg);
            width: var(--sb-w);
            border-right: 1px solid var(--border);
            box-shadow: var(--shadow);
            display: flex;
            flex-direction: column;     /* ✅ footer를 아래로 밀기 */
            transition: width .2s ease;
        }

        .sidebar.is-collapsed { width: var(--sb-w-collapsed); }

        .sidebar__scroll {
            flex: 1 1 auto;             /* ✅ 남는 공간 채움 */
            height: auto;
            overflow: visible;          /* 내부 스크롤 제거 */
        }

        .sidebar__header {
            display: flex; align-items: center; justify-content: space-between;
            padding: 14px 12px 8px 12px;
            gap: 8px;
            flex-shrink: 0;
        }

        .menu-title {
            color: var(--brand);
            font-size: 16px; font-weight: 600; line-height: 24px;
            white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
        }

        .toggle-btn {
            width: 36px; height: 36px; border: 0; border-radius: 8px;
            background: transparent; cursor: pointer;
            display: inline-flex; align-items: center; justify-content: center;
            transition: background-color .15s ease, transform .1s ease;
        }
        .toggle-btn:hover { background: #f3f4f6; transform: scale(.98); }
        .toggle-btn img { width: 20px; height: 20px; }

        .sidebar.is-collapsed .menu-title { display: none; }

        nav.sidebar__nav {
            padding: 8px 8px 12px 8px;
            display: grid;
            gap: 6px;
        }

        .nav-link {
            display: grid;
            grid-template-columns: 24px 1fr auto;
            align-items: center;
            gap: 12px;
            width: 100%;
            min-height: 44px;
            padding: 10px 12px;
            border-radius: var(--radius);
            text-decoration: none;
            color: var(--text);
            transition: background-color .15s ease, transform .1s ease, color .15s ease;
            outline: none;
        }
        .nav-link:hover { background: var(--hover); }
        .nav-link:active { transform: scale(.99); }
        .nav-link:focus-visible { box-shadow: 0 0 0 2px var(--ring); }

        .nav-link__icon { width: 20px; height: 20px; display: inline-flex; align-items: center; justify-content: center; }
        .nav-link__icon img {
            width: 100%; height: 100%; object-fit: contain;
            filter: brightness(0) saturate(100%) invert(25%) sepia(9%) saturate(1069%) hue-rotate(177deg) brightness(93%) contrast(89%);
            transition: filter .15s ease;
        }
        .nav-link:hover .nav-link__icon img {
            filter: brightness(0) saturate(100%) invert(35%) sepia(93%) saturate(2447%) hue-rotate(6deg) brightness(101%) contrast(98%);
        }

        .nav-link__label { white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-size: 15px; line-height: 24px; }

        .sidebar.is-collapsed .nav-link { grid-template-columns: 1fr; justify-items: center; padding: 10px 8px; }
        .sidebar.is-collapsed .nav-link__label { display: none; }

        .nav-link.is-active { background: #ffe7cf; color: #d14500; }
        .nav-link.is-active .nav-link__icon img {
            filter: brightness(0) saturate(100%) invert(35%) sepia(93%) saturate(2447%) hue-rotate(6deg) brightness(101%) contrast(98%);
        }

        .sidebar__footer {
            margin-top: auto;
            padding: 10px 12px 12px 12px;
            border-top: 1px solid var(--border);
            background: #fff;
        }
        .version-card {
            background: var(--muted-bg);
            border-radius: var(--radius);
            min-height: 48px; padding: 10px 12px;
            display: flex; align-items: center; gap: 8px;
            transition: background-color .15s ease;
        }
        .version-card:hover { background: #e5e7eb; }
        .version-text-1 { font-size: 12px; line-height: 16px; color: #4a5565; }
        .version-text-2 { font-size: 12px; line-height: 16px; color: var(--muted); }
    </style>
</head>
<body>
<aside class="sidebar" id="sidebar" aria-label="주요 메뉴">
    <div class="sidebar__scroll">
        <div class="sidebar__header">
            <div class="menu-title">메뉴</div>
            <button class="toggle-btn" type="button" id="sbToggleBtn" aria-label="사이드바 접기/펼치기">
                <img src="<c:url value='/resources/images/sidebar_icon.png'/>" alt="사이드">
            </button>
        </div>

        <nav class="sidebar__nav" id="sidebarNav">
            <a class="nav-link" href="<c:url value='/WEB-INF/views/dashboard.jsp'/>" data-key="dashboard">
                <span class="nav-link__icon"><img src="<c:url value='/resources/images/dashboard_icon.png'/>" alt=""></span>
                <span class="nav-link__label">대시보드</span>
            </a>
            <a class="nav-link" href="#" data-key="calendar">
                <span class="nav-link__icon"><img src="<c:url value='/resources/images/calendar_icon.png'/>" alt=""></span>
                <span class="nav-link__label">일정 관리</span>
            </a>
            <a class="nav-link" href="#" data-key="contents">
                <span class="nav-link__icon"><img src="<c:url value='/resources/images/video_icon.png'/>" alt=""></span>
                <span class="nav-link__label">콘텐츠 관리</span>
            </a>
            <a class="nav-link" href="#" data-key="finance">
                <span class="nav-link__icon"><img src="<c:url value='/resources/images/report_icon.png'/>" alt=""></span>
                <span class="nav-link__label">재무 관리</span>
            </a>
            <a class="nav-link" href="#" data-key="sponsorship">
                <span class="nav-link__icon"><img src="<c:url value='/resources/images/handshake.png'/>" alt=""></span>
                <span class="nav-link__label">협찬 계약</span>
            </a>
        </nav>
    </div>
</aside>

<script>
    (function(){
        const sidebar  = document.getElementById('sidebar');
        const toggleBtn= document.getElementById('sbToggleBtn');
        const nav      = document.getElementById('sidebarNav');

        const STORAGE_COLLAPSE = 'crep.sidebar.collapsed';
        const STORAGE_ACTIVE   = 'crep.sidebar.activeKey';

        function applyCollapsed(fromStorage=true){
            const collapsed = fromStorage
                ? localStorage.getItem(STORAGE_COLLAPSE) === '1'
                : sidebar.classList.contains('is-collapsed');
            sidebar.classList.toggle('is-collapsed', collapsed);
        }

        function setActive(el, persist = true){
            if (!nav) return;
            nav.querySelectorAll('.nav-link.is-active').forEach(a => a.classList.remove('is-active'));
            el.classList.add('is-active');
            if (persist){
                const key = el.dataset.key || (el.getAttribute('href') || '').trim();
                localStorage.setItem(STORAGE_ACTIVE, key || '');
            }
        }

        function restoreActive(){
            if (!nav) return;
            const saved = localStorage.getItem(STORAGE_ACTIVE);
            let target = null;

            if (saved){
                target = Array.from(nav.querySelectorAll('.nav-link'))
                    .find(a => a.dataset.key === saved || (a.getAttribute('href') || '').trim() === saved);
            }
            if (!target) target = nav.querySelector('.nav-link');
            if (target) setActive(target, false);
        }

        applyCollapsed(true);
        restoreActive();

        nav.addEventListener('click', function(e){
            const a = e.target.closest('.nav-link');
            if (!a) return;
            const href = (a.getAttribute('href') || '').trim();
            if (href === '' || href === '#'){
                e.preventDefault();
                setActive(a, true);
            } else {
                const key = a.dataset.key || href;
                localStorage.setItem(STORAGE_ACTIVE, key);
            }
        });

        toggleBtn.addEventListener('click', function(){
            sidebar.classList.toggle('is-collapsed');
            const isCollapsed = sidebar.classList.contains('is-collapsed');
            localStorage.setItem(STORAGE_COLLAPSE, isCollapsed ? '1' : '0');
        });

        (function highlightByPath(){
            const path = location.pathname.replace(/\/+$/,'');
            const links = nav.querySelectorAll('.nav-link');
            let matched = null;
            links.forEach(a=>{
                try{
                    const href = new URL(a.getAttribute('href') || '#', location.origin).pathname.replace(/\/+$/,'');
                    if (href && href !== '/' && path.startsWith(href)) matched = a;
                }catch(e){}
            });
            if (matched) setActive(matched, true);
        })();
    })();
</script>
</body>
</html>
