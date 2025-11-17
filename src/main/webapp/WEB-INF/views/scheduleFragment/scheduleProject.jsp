<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 11. 17.
  Time: 오전 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="whitebox" style="width: 49%;">
    <div class="titlebox">
        <div class="imageContainer" style="width:30px;"><img src="<%= request.getContextPath() %>/images/project.PNG" alt="프로젝트"></div>
        <h3>프로젝트 선택</h3>
    </div>
    <p>프로젝트 필터링</p>
    <div class="buttonCollection" id="ProjectButtonContainer">
        <c:forEach var="p" items="${scheduleProjects}">
            <button type="button"
                value="${p.projectId}"
                class='disactive'>
                ${p.projectName}
            </button>
        </c:forEach>
    </div>
</div>