<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>워크스페이스</title>
    
    <link rel="stylesheet" href="<c:url value='/resources/static/css/default.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/static/css/workspace.css'/>">
    
    <script src="<c:url value='/resources/static/js/workspace.js'/>" defer></script>
    <script src="<c:url value='/resources/static/js/modal.js'/>" defer></script>
    <style>
        .box {
            position: relative;
        }
        .delete-workspace-btn {
            position: absolute;
            top: 8px;
            right: 8px;
            width: 24px;
            height: 24px;
            background-color: #fee2e2;
            color: #ef4444;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 10;
            transition: background-color 0.2s, color 0.2s;
        }
        .delete-workspace-btn:hover {
            background-color: #ef4444;
            color: white;
        }
    </style>
</head>
<body>
    <div class="body">
        <div class="content">
            <div class="container">
                <div class="header">
                    <div class="header_title">
                        <div class="header_title_main">
                            워크스페이스
                        </div>
                        <div class="header_title_sub">
                            워크스페이스를 생성하고 관리하세요
                        </div>
                    </div>
                    <div class="header_button">
                        <input type="button" value="+ 새 워크스페이스" class="button"
                               data-modal-target="newWorkspaceModal"
                               data-modal-url="<c:url value='/workspace/new'/>">
                    </div>
                </div>
                <div class="menu">
                    <div class="tab_list">
                        <div class="tab choice" id="allViewTab" data-channel="all">
                            전체보기
                        </div>
                        <c:forEach var="channel" items="${channels}">
                            <div class="tab" data-channel="${channel.channelId}">
                                <c:out value="${channel.channelName}"/>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="content_box" id="contentBox">
                    <c:forEach var="ws" items="${workspaces}">
                        <a href="<c:url value='/project?workspaceId=${ws.workspaceId}'/>" class="box-link">
                            <div class="box" data-channel="${ws.channelId}">
                                <button class="delete-workspace-btn" onclick="deleteWorkspace(event, '${ws.workspaceId}')">X</button>
                                <div class="box_body">
                                    <div class="title">
                                        <%-- 이미지 표시 부분 제거 --%>
                                        <div class="title_name">
                                            <div><c:out value="${ws.channelName}"/></div>
                                            <div>채널설명</div>
                                        </div>
                                    </div>
                                    <div class="box_describe">
                                        <div><c:out value="${ws.workspaceName}"/></div>
                                        <div><c:out value="${ws.workspaceExplain}"/></div>
                                    </div>
                                    <div class="workspace_footer">
                                        <div>${ws.projectCount}개 프로젝트</div>
                                        <div>${ws.memberCount}명</div>
                                    </div>
                                    <div class="workspace_deadline">
                                        <div>
                                            <fmt:formatDate value="${ws.enrollDate}" pattern="yyyy-MM-dd"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                    <c:if test="${empty workspaces}">
                        <p style="text-align: center; padding: 20px;">표시할 워크스페이스가 없습니다.</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/components/modals.jsp"/>

    <script>
        function deleteWorkspace(event, workspaceId) {
            event.preventDefault();
            event.stopPropagation();

            if (confirm('정말 이 워크스페이스를 삭제하시겠습니까? 관련된 모든 프로젝트와 데이터가 영구적으로 삭제됩니다.')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '${pageContext.request.contextPath}/workspace/delete';

                const idInput = document.createElement('input');
                idInput.type = 'hidden';
                idInput.name = 'workspaceId';
                idInput.value = workspaceId;
                form.appendChild(idInput);

                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</body>
</html>
