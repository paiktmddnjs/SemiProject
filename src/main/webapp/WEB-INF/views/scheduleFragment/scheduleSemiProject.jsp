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
                    <div class="imageContainer" style="width:30px;"><img src="<%= request.getContextPath() %>/images/project.PNG" alt="프로젝트"></div>
                    <h3>프로젝트별 일정</h3>
                </div>
                <p>Youtube 채널의 프로젝트별 일정</p>
                <ol class="eventSemiList">
                    <c:forEach var="ps" items="${projectStatus}">
                        <li>
                            <div class="eventSemiHead">
                                <h3>${ps.statusName}</h3>
                                <div class="eventSemiMany">${ps.statusSum}건</div>
                            </div>
                            <div class="eventSemiBody">
                                <div class="eventSemiProgress">진행중 : ${ps.statusProgress}</div>
                                <div class="eventSemiExpected">예정 : ${ps.statusTodo}</div>
                                <div class="eventCompleted">완료 : ${ps.statusComplete}</div>
                            </div>
                        </li>
                    </c:forEach>
                </ol>
            </div>