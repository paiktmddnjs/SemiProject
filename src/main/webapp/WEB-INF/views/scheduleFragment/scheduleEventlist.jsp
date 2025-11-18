<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 11. 17.
  Time: 오전 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="whitebox" style="width: calc(98% - 800px); padding:0px;">
    <div class="headline" style="height:70px;">
        <h3>10월 27일</h3>
        <p>2개의 일정</p>
    </div>
    <ol class="eventList" id="eventList">
        <c:forEach var="d" items="${dailyTask}">
            <li>
                <div class="keywordContainer">
                    <div class="keyword_type">${d.workspaceName}</div>
                    <div class="keyword_event">${d.projectName}</div>
                    <div class="keyword_state">진행중</div>
                </div>
                <h3>&nbsp;${d.taskName}</h3>
                <p>${d.taskAssign}</p>
            </li>
        </c:forEach>
    </ol>
</div>