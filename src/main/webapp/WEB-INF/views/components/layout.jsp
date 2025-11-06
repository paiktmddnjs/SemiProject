<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title><c:out value="${pageTitle != null ? pageTitle : 'CREP'}"/></title>
  <style>
    :root {
      --border:#e5e7eb;
      --bg:#f9fafb;
      --panel:#fff;
      --text:#111827;
    }
    * { box-sizing: border-box; }
    html, body { height: 100%; margin: 0; }
    body {
      background: var(--bg);
      color: var(--text);
      font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
    }

    /* 기본 구조: header → sidebar → main → footer */
    .layout {
      display: grid;
      grid-template-rows: auto auto 1fr auto; /* footer는 항상 아래 */
      min-height: 100vh;
      grid-template-areas:
        "header"
        "sidebar"
        "main"
        "footer";
    }

    header.layout__header { grid-area: header; background: var(--panel); border-bottom: 1px solid var(--border); }
    aside.layout__sidebar { grid-area: sidebar; background: var(--panel); border-bottom: 1px solid var(--border); }
    main.layout__main { grid-area: main; background: var(--bg); padding: 24px; min-height: 0; }
    footer.layout__footer { grid-area: footer; background: var(--panel); border-top: 1px solid var(--border); }

    /* ✅ 사이드바와 메인에 불필요한 내부 스크롤 방지 */
    .layout__sidebar, .layout__main { min-height: 0; }

    /* ✅ 사이드바 JSP 내부 루트가 그리드 높이를 채우도록 */
    .layout__sidebar > .sidebar {
      min-height: 100%;
      display: flex;
      flex-direction: column;
    }

    .footer-inner {
      max-width: 1280px;
      margin: 0 auto;
      padding: 16px 24px;
      color: #6b7280;
      font-size: 14px;
    }

    /* 넓은 화면: sidebar를 왼쪽에 붙이는 2열 구조 */
    @media (min-width: 768px) {
      .layout {
        grid-template-columns: max-content 1fr;
        grid-template-rows: auto 1fr auto;
        grid-template-areas:
          "header header"
          "sidebar main"
          "footer footer";
      }
      aside.layout__sidebar {
        border-bottom: none;
        border-right: 1px solid var(--border);
      }
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

          <jsp:include page=""/>

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
