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
            <div class="imageContainer" style="width:30px;"><img src="<%= request.getContextPath() %>/images/workspace.PNG" alt="워크스페이스"></div>
            <h3>워크스페이스 선택</h3>
        </div>
        <p>먼저 워크스페이스를 선택하세요</p>
        <div class="buttonCollection" id="WorkspaceButtonContainer">
            <button type="button" value="0" class="activated">전체</button>
            <c:forEach var="w" items="${scheduleWorkspaces}">
                <button type="button"
                        value="${w.workspaceId}"
                        class='disactive'>
                        ${w.workspaceName}
                </button>
            </c:forEach>
        </div>
    </div>