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
    <script src="<%= request.getContextPath() %>/resources/script/scheduleAjax.js"></script>
    <script> var W_id = ${W_id}; var P_id = ${P_id}; let memberId = ${memberId}</script>
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
            <%@ include file="/WEB-INF/views/scheduleFragment/scheduleWorkspace.jsp" %>
            <%@ include file="/WEB-INF/views/scheduleFragment/scheduleProject.jsp" %>
        </div>
        <div class="form-container">
            <%@ include file="/WEB-INF/views/scheduleFragment/scheduleStatus.jsp" %>
        </div>
        <div class="form-container">
            <%@ include file="/WEB-INF/views/scheduleFragment/scheduleCalendar.jsp" %>
            <%@ include file="/WEB-INF/views/scheduleFragment/scheduleEventlist.jsp" %>
        </div>
        <div class="form-container">
            <%@ include file="/WEB-INF/views/scheduleFragment/scheduleSemiWorkspace.jsp" %>
            <%@ include file="/WEB-INF/views/scheduleFragment/scheduleSemiProject.jsp" %>
        </div>

    </div>
    </div>
    <%@ include file="/WEB-INF/views/components/footer.jsp" %>
</body>
</html>
