<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 11. 5.
  Time: 오전 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Schedule</title>
    <script src="/js/fullcalendar/index.global.min.js"></script>
    <style>
        .container{
            width:100%;
        }

        .full-container{
            display: flex;
        }
        .form-container{
            display: flex;
            background: #f9fafb;
            /* max-width: 1200px; */
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

        .whitebox h3{
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
            padding:10px;
            background: grey;
            border: 0px solid;
            border-radius: 10px;
            justify-content: center;
            align-items: center;
        }

        .dataBlockType{
            width:70px;
            height:70px;
            background: black;
            border: 0px solid;
            border-radius: 50%;
            margin:5px;
            flex-shrink: 0;
            flex-grow: 0;
        }

        .dataBlockText {
            width: calc(100% - 60px);
            padding: 10px;
        }

        .dataBlockText p{
            margin: 0 0;
            color:#868e96;
        }

        .dataBlockText h1{
            margin-left:10px;
        }

        .imageContainer img {
            width: 100%;   /* 부모 div에 맞게 가로 꽉 채움 */
            height: auto;  /* 비율 유지 */
        }

        .headline{
            width:100%;
            background-color:#fff7ed;
            padding: 5px 10px 10px;
        }

        .headline h3{
            margin:0 0;
        }

        .headline p{
            margin: 0 0;
        }

        .eventList{
            margin:10px;
            list-style-type: none;
            padding-left: 0;
        }

        .eventList li{
            width:95%;
            height:100px;
            margin:10px auto;
            background-color:#fff7ed;
            border: 1px solid;
            border-color: #ea580c;
            border-radius: 10px;
            padding:10px;
        }

        .eventList li h3{
            color: black;
            margin: 5px 0 0;
        }

        .eventList li p{
            color: grey;
            margin: 0 0 10px;
        }

        .keywordContainer{
            display:flex;
            margin: 0 0;
            padding-left: 10px;
        }

        .keyword_type{
            margin:0 5px;
            background-color:#ffddd4;
            border: 1px solid;
            border-color: #ea580c;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-left:10px;
            padding-right:10px;
            color:#ea580c;
            font-size:80%;
        }

        .keyword_event{
            margin:0 5px;
            background-color:lightgrey;
            border: 1px solid;
            border-color: lightgrey;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-left:10px;
            padding-right:10px;
            color:dimgrey;
            font-size:80%;
        }

        .keyword_state{
            margin:0 5px;
            background-color:#ea580c;
            border: 1px solid;
            border-color: #ea580c;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-left:10px;
            padding-right:10px;
            color:white;
            font-size:80%;
        }

        .eventSemiList{
            margin:10px;
            list-style-type: none;
            padding-left: 0;
        }

        .eventSemiList li{
            width:95%;
            margin:10px auto;
            background-color:#fff7ed;
            border: 1px solid;
            border-color: #ea580c;
            border-radius: 10px;
            padding: 5px;
        }

        .eventSemiHead{
            display:flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            margin-bottom: 5px;
        }

        .eventSemiHead h3{
            color:black;
            margin:0 0;
        }

        .eventSemiMany{
            margin:0 5px;
            background-color:#fff7ed;
            border: 1px solid;
            border-color: #ea580c;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-left:10px;
            padding-right:10px;
            color:#ea580c;
            font-size:80%;
        }

        .eventSemiBody{
            display:flex;
            justify-content: flex-start;
            align-items: center;
            width: 100%;
            margin: 0 0;
            gap: 20px;
        }

        .eventSemiProgress{
            color:orangered;
            margin:0 0;
        }

        .eventSemiExpected{
            color:grey;
            margin:0 0;
        }

        .eventCompleted{
            color:mediumseagreen;
            margin:0 0;
        }

        /* 달력 div 설정 */ /*=======================================================================================================================================*/
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
    <div class="full-container"><%@ include file="/WEB-INF/views/components/header.jsp" %></div>
    <div class="full-container">

        <%@ include file="/WEB-INF/views/components/sidebar.jsp" %>
    <div class="container">
        <div class="form-container">
            <div class="introduce">
                <h1>일정 관리</h1>
                <p>워크스페이스와 프로젝트별 제작 일정을 효율적으로 관리하세요</p>
            </div>
        </div>
        <div class="form-container">
            <div class="whitebox" style="width: 49%;">
                <div class="titlebox">
                    <div class="imageContainer" style="width:30px;"><img src="<%= request.getContextPath() %>/images/workspace.PNG" alt="워크스페이스"></div>
                    <h3>워크스페이스 선택</h3>
                </div>
                <p>먼저 워크스페이스를 선택하세요</p>
                <div class="buttonCollection">
                    <button id="workspace-whole" class="disactive">전체</button>
                    <button id="workspace-first" class="activated">유튜브 채널 운영</button>
                    <button id="workspace-second" class="disactive">소셜 미디어 마케팅</button>
                    <button id="workspace-third" class="disactive">브랜드 협업</button>
                </div>
            </div>
            <div class="whitebox" style="width: 49%;">
                <div class="titlebox">
                    <div class="imageContainer" style="width:30px;"><img src="<%= request.getContextPath() %>/images/project.PNG" alt="프로젝트"></div>
                    <h3>프로젝트 선택</h3>
                </div>
                <p>프로젝트 필터링</p>
                <div class="buttonCollection">
                    <button id="project-whole" class="disactive">전체</button>
                    <button id="project-first" class="activated">신제품 리뷰 시리즈</button>
                    <button id="project-second" class="disactive">브이로그 컨텐츠</button>
                    <button id="project-third" class="disactive">튜토리얼 제작</button>
                </div>
            </div>
        </div>
        <div class="form-container">
            <div class="whitebox" style="width: 99%;">
                <h3>전체 진행현황</h3>

                <p>유튜브 채널 전체 일정</p>
                <div class="dataCollection">
                    <div class="dataBlock" style="height:100px; width: 32%; background-color:#fff7ed;">
                        <div class="dataBlockType" style="background-color:#f54900">
                            <div class="imageContainer"><img src="<%= request.getContextPath() %>/images/aleart.PNG" alt="경고"></div>
                        </div>
                        <div class="dataBlockText">
                            <p>진행중</p>
                            <h1 id="whole-progress" style="color:#f54900">3건</h1>
                        </div>
                    </div>
                    <div class="dataBlock" style="height:100px; width: 32%; background-color:#f9fafb;">
                        <div class="dataBlockType" style="background-color:#4a5565">
                            <div class="imageContainer"><img src="<%= request.getContextPath() %>/images/circle.PNG" alt="빈원"></div>
                        </div>
                        <div class="dataBlockText">
                            <p>예정</p>
                            <h1 id="whole-expected" style="color:#4a5565">4건</h1>
                        </div>
                    </div>
                    <div class="dataBlock" style="height:100px; width: 32%; background-color:#f0fdf4;">
                        <div class="dataBlockType" style="background-color:#00a63e">
                            <div class="imageContainer"><img src="<%= request.getContextPath() %>/images/checke.PNG" alt="체크"></div>
                        </div>
                        <div class="dataBlockText">
                            <p>완료</p>
                            <h1 id="whole-completed" style="color:#00a63e">0건</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-container">
            <!-- 달력 div 생성 -->
            <div id="calendar"></div>
            <div class="whitebox" style="width: calc(98% - 800px); padding:0px;">
                <div class="headline" style="height:70px;">
                    <h3>10월 27일</h3>
                    <p>2개의 일정</p>
                </div>
                <ol class="eventList">
                    <li>
                        <div class="keywordContainer">
                            <div class="keyword_type">유튜브 채널 운영</div>
                            <div class="keyword_event">튜토리얼 제작</div>
                            <div class="keyword_state">진행중</div>
                        </div>
                        <h3>스크립트 작성</h3>
                        <p>튜토리얼 스크립트 및 자료 준비</p>
                    </li>
                    <li>
                        <div class="keywordContainer">
                            <div class="keyword_type">유튜브 채널 운영</div>
                            <div class="keyword_event">신제품 리뷰 시리즈</div>
                            <div class="keyword_state">진행중</div>
                        </div>
                        <h3>제품 테스트</h3>
                        <p>신제품 성능 테스트 및 데이터 수집</p>
                    </li>
                </ol>
            </div>
        </div>
        <div class="form-container">
            <div class="whitebox" style="width: 49%;">
                <div class="titlebox">
                    <div class="imageContainer" style="width:30px;"><img src="<%= request.getContextPath() %>/images/workspace.PNG" alt="워크스페이스"></div>
                    <h3>워크스페이스별 일청</h3>
                </div>
                <p>각 워크스페이스의 일정 현황</p>
                <ol class="eventSemiList">
                    <li>
                        <div class="eventSemiHead">
                            <h3>유튜브 채널 운영</h3>
                            <div class="eventSemiMany">7건</div>
                        </div>
                        <div class="eventSemiBody">
                            <div class="eventSemiProgress">진행중 : 3</div>
                            <div class="eventSemiExpected">예정 : 4</div>
                            <div class="eventCompleted">완료 : 0</div>
                        </div>
                    </li>
                    <li>
                        <div class="eventSemiHead">
                            <h3>소셜 미디어 마케팅</h3>
                            <div class="eventSemiMany">2건</div>
                        </div>
                        <div class="eventSemiBody">
                            <div class="eventSemiProgress">진행중 : 0</div>
                            <div class="eventSemiExpected">예정 : 2</div>
                            <div class="eventCompleted">완료 : 0</div>
                        </div>
                    </li>
                    <li>
                        <div class="eventSemiHead">
                            <h3>브랜드 협업</h3>
                            <div class="eventSemiMany">2건</div>
                        </div>
                        <div class="eventSemiBody">
                            <div class="eventSemiProgress">진행중 : 0</div>
                            <div class="eventSemiExpected">예정 : 2</div>
                            <div class="eventCompleted">완료 : 0</div>
                        </div>
                    </li>
                </ol>
            </div>
            <div class="whitebox" style="width: 49%;">
                <div class="titlebox">
                    <div class="imageContainer" style="width:30px;"><img src="<%= request.getContextPath() %>/images/project.PNG" alt="프로젝트"></div>
                    <h3>프로젝트별 일정</h3>
                </div>
                <p>Youtube 채널의 프로젝트별 일정</p>
                <ol class="eventSemiList">
                    <li>
                        <div class="eventSemiHead">
                            <h3>신제품 리뷰 시리즈</h3>
                            <div class="eventSemiMany">3건</div>
                        </div>
                        <div class="eventSemiBody">
                            <div class="eventSemiProgress">진행중 : 1</div>
                            <div class="eventSemiExpected">예정 : 2</div>
                            <div class="eventCompleted">완료 : 0</div>
                        </div>
                    </li>
                    <li>
                        <div class="eventSemiHead">
                            <h3>브이로그 콘텐츠</h3>
                            <div class="eventSemiMany">2건</div>
                        </div>
                        <div class="eventSemiBody">
                            <div class="eventSemiProgress">진행중 : 1</div>
                            <div class="eventSemiExpected">예정 : 1</div>
                            <div class="eventCompleted">완료 : 0</div>
                        </div>
                    </li>
                    <li>
                        <div class="eventSemiHead">
                            <h3>튜토리얼 제작</h3>
                            <div class="eventSemiMany">7건</div>
                        </div>
                        <div class="eventSemiBody">
                            <div class="eventSemiProgress">진행중 : 1</div>
                            <div class="eventSemiExpected">예정 : 1</div>
                            <div class="eventCompleted">완료 : 0</div>
                        </div>
                    </li>
                </ol>
            </div>
        </div>

        <script>
            // 홈페이지 로드 완료시 자동 실행 설정
            document.addEventListener('DOMContentLoaded', function() {

                <!-- 변수 calendarEl 에 calendar id의 dom 요소를 가져와 저장한다. -->
                <!-- calendarEl은 FullCalendar의 캘린더 컨테이너가 된다. -->
                const calendarEl = document.getElementById('calendar');
                <!-- 새로운 FullCalendar 객체인 calendar 객체를 생성한다 -->
                <!-- calendarEl의 dom 요소를 기반으로 생성 (첫번째 매개변수) -->
                <!-- 캘린더 옵션을 설정 가능 (두번쨰 매개변수) -->
                const calendar = new FullCalendar.Calendar(calendarEl, {
                    <!-- initialView : 기본 뷰 설정 (dayGridMonth는 월간 달력 뷰) -->
                    <!-- timeGridWeek, timeGridDay, listWeek 등이 존재 -->
                    initialView: 'dayGridMonth',
                    dayMaxEvents: 2, // 한 날짜에 보이는 최대 이벤트 수 제한
                    eventTextColor: '#ffffff', //이벤트 색상 지정

                    /*날짜표시 한글로 변경*/
                    titleFormat: function(date){
                        const year = date.date.year;
                        const month = date.date.month+1;
                        return year + '년 ' + month + '월'
                    },

                    /*날짜변경 버튼 텍스트 변경*/
                    buttonText:{
                        prev: '◀',
                        next: '▶',
                    },

                    /* headerToolbar를 조정하는것으로 버튼 순서 변경이 가능 */
                    headerToolbar:{
                        left: 'prev',
                        center: 'title',
                        right: 'next'
                    },

                    height: 700,          // 높이를 700으로 고정
                    contentHeight: 600,
                    <!-- events : 일정 설정 -->
                    <!-- title: 일정명, start: 시작일, end: 마감일 -->
                    events: [
                        { title: '업무1', start: '2025-11-05', end: '2025-11-11', className: 'first-event' },
                        { title: '업무2', start: '2025-11-08', end: '2025-11-11', className: 'second-event' },
                        { title: '업무3', start: '2025-11-09', end: '2025-11-15', className: 'third-event' },
                    ],

                    /*
                    dayCellDidMount: function(info){

                        const date = info.date;
                        const events = info.view.calendar.getEvents();

                        //현재 날짜와 같은 start를 가진 이벤트가 있는지 확인
                        const hasEvent = events.some(event => {
                            const start = event.start;
                            const end = event.end || start;  // end가 없으면 단일 날짜 이벤트
                            const adjustedEnd = new Date(end);
                            adjustedEnd.setDate(adjustedEnd.getDate() - 1);

                            return date >= start && date <= adjustedEnd;
                        });

                        //이벤트가 있으면 스타일 적용
                        if(hasEvent){

                            //이 날짜가 이번달이 아니라면
                            if(info.el.classList.contains('fc-day-other')){
                                info.el.classList.add('event-other-month');
                            } else{
                                info.el.classList.add('event-current-month');
                            }
                        }
                    }
                    */
                });
                <!-- 캘린더를 실제 화면에 렌더링 -->
                calendar.render();
            });
        </script>
    </div>
    </div>
    <%@ include file="/WEB-INF/views/components/footer.jsp" %>
</body>
</html>
