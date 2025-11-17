<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 11. 17.
  Time: 오전 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="whitebox" style="width: 49%;">
                <div class="titlebox">
                    <div class="imageContainer" style="width:30px;"><img src="<%= request.getContextPath() %>/images/workspace.PNG" alt="워크스페이스"></div>
                    <h3>워크스페이스별 일청</h3>
                </div>
                <p>각 워크스페이스의 일정 현황</p>
                <ol class="eventSemiList">
                    <c:forEach var="ws" items="${workspaceStatus}">
                        <li>
                            <div class="eventSemiHead">
                                <h3>${ws.statusName}</h3>
                                <div class="eventSemiMany">${ws.statusSum}건</div>
                            </div>
                            <div class="eventSemiBody">
                                <div class="eventSemiProgress">진행중 : ${ws.statusProgress}</div>
                                <div class="eventSemiExpected">예정 : ${ws.statusTodo}</div>
                                <div class="eventCompleted">완료 : ${ws.statusComplete}</div>
                            </div>
                        </li>
                    </c:forEach>
                </ol>
            </div>