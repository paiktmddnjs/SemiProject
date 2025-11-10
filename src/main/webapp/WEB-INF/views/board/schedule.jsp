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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/scheduleStyle.css" />
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
                <h3>진행현황</h3>

                <p>'유튜브 채널 운영' 현황</p>
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

        <script src="<%= request.getContextPath() %>/resources/script/scheduleScript.js"></script>
    </div>
    </div>
    <%@ include file="/WEB-INF/views/components/footer.jsp" %>
</body>
</html>
