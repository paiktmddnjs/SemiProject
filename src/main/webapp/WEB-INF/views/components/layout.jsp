<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>CREP</title>
  <style>
    /* 기본 리셋 */
    * { box-sizing: border-box; }
    html, body { height: 100%; }
    body {
      margin: 0;
      color: #111827;
      background: #f9fafb;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    }

    /* 레이아웃 그리드 */
    .layout {
      min-height: 100vh;               /* 화면 높이에 맞춤 */
      display: grid;
      grid-template-columns: 256px 1fr; /* 왼쪽 고정폭 사이드바, 오른쪽 가변 본문 */
      grid-template-rows: auto 1fr auto;/* 헤더 자동높이, 본문 채우기, 푸터 자동높이 */
      grid-template-areas:
        "header header"
        "sidebar main"
        "footer footer";
    }

    /* 영역 배치 */
    header.layout__header { grid-area: header; background:#fff; border-bottom:1px solid #e5e7eb; }
    aside.layout__sidebar { grid-area: sidebar; background:#fff; border-right:1px solid #e5e7eb; }
    main.layout__main     { grid-area: main;   background:#f9fafb; }
    footer.layout__footer { grid-area: footer; background:#fff; border-top:1px solid #e5e7eb; }

    /* 스크롤/패딩 처리: 본문만 스크롤 */
    .layout__sidebar, .layout__main {
      min-height: 0;       /* grid 아이템 스크롤 위해 필요 */
    }
    .layout__main {
      overflow: auto;
      padding: 24px;       /* 본문 여백 */
    }

    /* 사이드바 내부가 길어질 경우만 자체 스크롤(헤더 아래에서 시작) */
    .layout__sidebar {
      overflow: auto;
    }

    /* 푸터를 얇고 고정 높이처럼 보이게 */
    .layout__footer .footer-inner {
      max-width: 1280px;
      margin: 0 auto;
      padding: 16px 24px;
      font-size: 14px;
      color:#6b7280;
    }

    /* 간단한 반응형: 폭이 좁으면 사이드바 살짝 줄이기(옵션) */
    @media (max-width: 1024px) {
      .layout {
        grid-template-columns: 200px 1fr;
      }
    }
    @media (max-width: 768px) { /* 모바일에서는 위아래 스택(필요시) */
      .layout {
        grid-template-columns: 1fr;
        grid-template-rows: auto auto 1fr auto;
        grid-template-areas:
          "header"
          "sidebar"
          "main"
          "footer";
      }
      .layout__sidebar { border-right: none; border-bottom: 1px solid #e5e7eb; }
    }
  </style>
</head>
<body>
  <div class="layout">
    <!-- 헤더 -->
    <header class="layout__header">
      <jsp:include page="/WEB-INF/views/components/header.jsp"/>
    </header>

    <!-- 사이드바 -->
    <aside class="layout__sidebar">
      <jsp:include page="/WEB-INF/views/components/sidebar.jsp"/>
    </aside>

    <!-- 본문 -->
    <main class="layout__main">
      <!-- 이 영역에 각 페이지 화면만 추가하면 됩니다 -->
      <h1>내용</h1>
    </main>

    <!-- 푸터 -->
    <footer class="layout__footer">
      <div class="footer-inner">
        <jsp:include page="/WEB-INF/views/components/footer.jsp"/>
      </div>
    </footer>
  </div>
</body>
</html>
