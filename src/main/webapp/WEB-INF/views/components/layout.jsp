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
    <script src="/js/fullcalendar/index.global.min.js"></script>
    <style>
        .form-container{
            display: flex;
            background: #f9fafb;
            max-width: 1200px;
            margin: 0 auto;
            padding-top: 0.5em;
            padding-bottom: 0.5em;
        }

        .form-row {
            margin-bottom: 1em;
        }

        /*introduce*/
        .introduce{
            margin: 10px;
            margin-top: 0px;
            border: 0px solid;
        }

        .introduce h1{
            margin: 0px;
            color: #ea580c;
        }

        .introduce p{
            margin: 0px;
            color: #868e96;
        }

        /* 흰색 배경 */
        .whitebox{
            background: #ffffff;
            margin: 0 auto;
            border: 1px solid;
            border-color: #ffedd4;
            border-radius: 10px;
            padding-left:20px;
            padding-right: 20px;
            padding-top:10px;
            padding-bottom:10px;
            overflow: hidden;
            position: relative;
        }

        .whitebox h6{
            margin: 5px;
            color: #ea580c;
        }

        .whitebox p{
            margin: 5px;
            color: #868e96;
        }

        .titlebox{
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .buttonCollection{
            display: flex;
            margin: 5px;
            margin-top: 10px;
            gap: 10px;
        }

        .buttonCollection button.disactive{
            background: white;
            padding-top: 5px;
            padding-bottom: 5px;
            padding-left: 15px;
            padding-right: 15px;
            border: 1px solid;
            border-color: #ffd6a7;
            border-radius: 10px;
            color:black;
        }

        .buttonCollection button.activated{
            background: #ea580c;
            padding-top: 5px;
            padding-bottom: 5px;
            padding-left: 15px;
            padding-right: 15px;
            border: 1px solid;
            border-color: #ffd6a7;
            border-radius: 10px;
            color:white;
        }

        .dataCollection{
            display: flex;
            margin: 5px;
            margin-top: 10px;
        }

        .dataBlock{
            display:flex;
            margin:10px;
            background: grey;
            border: 0px solid;
            border-radius: 10px;
            justify-content: center;
            align-items: center;
        }

        .dataBlockType{
            height:70px;
            width:70px;
            background: black;
            border: 0px solid;
            border-radius: 50%;
            margin:5px;
        }

        .imageContainer img {
            width: 100%;   /* 부모 div에 맞게 가로 꽉 채움 */
            height: auto;  /* 비율 유지 */
        }

        /* 달력 div 설정 */ /*====================================================================================================*/
        #calendar{
            width: 800px;
            margin: 0 auto;
            border: 0px solid;
            border-radius: 6px;
        }


        /*달력 전체 스타일*/
        .fc{
            background: #fff2e7;
            color: #ea580c;
        }

        /* 요일 헤더 스타일 */
        .fc .fc-col-header-cell {
            /*background: #ffffff;*/
        }

        /* 요일 헤더 텍스트 */
        .fc .fc-col-header-cell-cushion {
            color: #ea580c;
        }

        .fc-header-toolbar{
            margin-bottom: 0.5em !important;
            padding-botton: 0.5em !important;
            padding-top: 0.5em !important;
        }

        .fc .fc-header-toolbar{
            font-size: 12px;
        }

        .fc .fc-toolbar button{
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 0 0;
            height: 30px;
            width: 30px;
            margin: 0 5px;
            color: #ea580c;
            font-size: 10px;
            background-color: rgba(255, 255, 255, 1);
            border: 2px solid;
            border-radius: 6px;
            border-color: #ea580c;
        }

        .fc .fc-toolbar button:active {
            background-color: #ea580c !important;
            color: #ffffff !important;
            border-color: #ea580c !important;
        }

        .fc .fc-toolbar button:focus{
            outline: none !important;
            box-shadow: none !important;
        }

        .fc .fc-toolbar button:hover{
            border-color: rgba(100, 10, 10, 0.3);
            background-color: rgba(100, 10, 10, 0.1);
            transition: background-color 0.2s ease;
        }

        /* .fc-daygrid-day : .fc(FullCalender)의 각 셀을 지정 */
        .fc .fc-daygrid-day{
            background-color: rgba(255, 255, 255, 1);
            height: 100px;
            width: 100px;
            color: white;
        }

        .fc .fc-daygrid-day-top a {
            color: #868e96;
        }

        .fc .fc-daygrid-day:hover{
            background-color: rgba(0, 0, 0, 0.1); /*검정에 투명도 0.1로 설정*/
            transition: background-color 0.2s ease; /*색 부드럽게 변화 */
        }

        /* .fc-daygrid-day:hover:not(.fc-day-other) 같은 달, 다른 날 날짜에 마우스를 올릴때 적용*/

        /* 다른 달의 날에 적용 */
        .fc .fc-daygrid-day.fc-day-other{
            background-color: rgba(240, 240, 240, 1);
        }

        .fc-event{
            background-color: #ea580c;
            border: 0px;
        }

        .first-event{
            background-color: #893101 !important;
        }

        .second-event{
            background-color: #fa8128 !important;
        }

        .third-event{
            background-color: #fcae1e !important;
        }

        .fc .fc-more-link{
            color: #bfb6b0;
        }

        /* dayCellDidMount가 기존 셀 이벤트를 덮어씌워서 그 위에 씌울 이벤트 */
        /*
        .event-other-month{background-color: #d9c4a9 !important;}
        .event-current-month{background-color: #ffedd5 !important;}

        .event-current-month:hover {
        	background-color: #ffd7b5 !important;
        	transition: background-color 0.2s ease;
        }
        */

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
