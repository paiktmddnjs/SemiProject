<%@ page contentType ="text/html; charset=UTF-8"
         pageEncoding ="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value='/resources/static/css/default.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/static/css/new.css'/>">
    <script src="<c:url value='/resources/static/js/workspace.js'/>" defer></script>
</head>
<body>

<div class ="navigator">
    1
</div>
<div class ="body">
    <div class ="sidebar">
        1
    </div>
    <div class = "content">
        <div class="container">
            <div class = "header">
                <div class = "header_title">
                    <div class = "header_title_main">
                        워크스페이스
                    </div>
                    <div class = "header_title_sub">
                        워크스페이스를 생성하고 관리하세요
                    </div>
                </div>
                <div class="header_button">
                    <input type="button" value="+ 새 워크스페이스" class="button" id="createWorkspaceButton">
                </div>
            </div>
            <div class = "menu">
                <div class = "tab_list">
                    <div class = "tab choice" id="allViewTab" data-channel="all">
                        전체보기
                    </div>
                    <div class = "tab" id="channel1Tab" data-channel="channel1">
                        채널 1
                    </div>
                    <div class = "tab" id="channel2Tab" data-channel="channel2">
                        채널 2
                    </div>
                </div>
            </div>
            <div class = "content_box" id="contentBox">
                <c:forEach var="ws" items="${workspaces}">
                <div class ="box" data-channel="${ws.channelId}">
                    <div class = "box_body">
                        <div class = "title">
                            <div>이미지</div>
                            <div class = "title_name">
                                <div><c:out value="채널명"/></div>
                                <div><c:out value="채널 설명"/></div>
                            </div>
                        </div>
                        <div class ="box_describe">

                            <div>${ws.workspaceName}</div>
                            <div>${ws.workspaceExplain}</div>

                        </div>
                        <div class ="workspace_footer">
                            <div>5개 프로젝트</div>
                            <div>8명</div>
                        </div>
                        <div class ="workspace_deadline">
                            <fmt:formatDate value="${ws.enrollDate}" pattern="yyyy-MM-dd"/>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <c:if test="${empty workspaces}">
                    <p style="text-align: center; padding: 20px;">표시할 워크스페이스가 없습니다.</p>
                </c:if>
            </div>
        </div>
    </div>
</div>
<div class ="footer">
    1
</div>

<!-- 모달 오버레이 및 컨테이너 추가 -->
<div id="modalOverlay" class="modal-overlay"></div>
<div id="newWorkspaceModal" class="modal-container">
    <div class="modal-content">
        <button class="modal-close-button">&times;</button>
        <div id="newWorkspaceContent" class="new_Content">

        </div>
    </div>
</div>
</body>
</html>