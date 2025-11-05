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
