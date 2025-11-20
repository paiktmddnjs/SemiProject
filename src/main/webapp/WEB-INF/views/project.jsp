<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value="/resources/static/css/default.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/static/css/project.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/static/css/invite.css"/>">
    <script src="<c:url value="/resources/static/js/project.js"/>" defer></script>
    <script src="<c:url value="/resources/static/js/modal.js"/>" defer></script>
    
    <script>
        // JSP에서 동적으로 생성되는 값들을 JavaScript 전역 변수로 정의
        const CONTEXT_PATH = '${pageContext.request.contextPath}';
        const SUCCESS_MESSAGE = '<c:out value="${successMessage}" />';
        const ERROR_MESSAGE = '<c:out value="${errorMessage}" />';
    </script>
    <%-- <script src="<c:url value="/resources/static/js/project_page.js"/>" defer></script> --%> <%-- 제거 --%>
    <style>
        .box {
            position: relative;
            display: flex;
            flex-direction: column;
        }
        .box_body {
            flex-grow: 1;
        }
        .delete-btn {
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
        .delete-btn:hover {
            background-color: #ef4444;
            color: white;
        }
        .project_type {
            margin-top: auto; /* 내용을 아래로 밀어냄 */
            padding: 8px 12px;
            font-size: 12px;
            color: #6b7280;
            border-top: 1px solid #f3f4f6;
            text-align: right;
        }
        .remove-member-btn {
            background-color: #ef4444;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <div class="body">

        <div class="content">
            <div class="container" data-workspace-id="${workspace.workspaceId}">
                <div class="header">
                    <div class="header_title">
                        <div class="header_title_main">
                            <c:out value="${workspace.workspaceName}"/>
                        </div>
                        <div class="header_title_sub">
                            <c:out value="${workspace.workspaceExplain}"/>
                        </div>
                    </div>
                    <div class = "header_button_container">
                        <c:if test="${currentUserRole != 'VIEWER'}">
                            <div class="header_button">
                                <input type="button" value="+ 새 프로젝트" class="button"
                                       data-modal-target="newProjectModal"
                                       data-modal-url="<c:url value='/project/new?workspaceId=${workspace.workspaceId}'/>">
                            </div>
                        </c:if>
                        <c:if test="${currentUserRole == 'ADMIN'}">
                            <div class="header_button">
                                <input type="button" value="워크스페이스 설정" class="button"
                                       data-modal-target="setWorkspaceModal"
                                       data-modal-url="<c:url value='/workspace/set?workspaceId=${workspace.workspaceId}'/>">
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="menu">
                    <div class="tab_list">
                        <div class="tab choice" id="projectTab">
                            프로젝트
                        </div>
                        <div class="tab" id="teamManageTab">
                            팀관리
                        </div>
                    </div>
                </div>
                
                <div id="projectContent" class="content_box">
                    <c:forEach var="p" items="${projects}">
                        <div class="box">
                            <c:if test="${currentUserRole != 'VIEWER'}">
                                <button class="delete-btn" onclick="deleteProject(event, '${p.projectId}', '${p.workspaceId}')">X</button>
                            </c:if>
                            <a href="<c:url value='/project/detail?projectId=${p.projectId}'/>" class="box-link" style="display: flex; flex-direction: column; height: 100%;">
                                <div class="box_body">
                                    <div class="title">
                                        <div class="title_name">
                                            <div><c:out value="${p.projectName}"/></div>
                                        </div>
                                    </div>
                                    <div class="box_describe">
                                        <div><c:out value="${p.projectMemo}"/></div>
                                    </div>
                                </div>
                                <div class="project_type">
                                    <c:out value="${p.projectType}"/>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                    <c:if test="${empty projects}">
                        <p style="text-align: center; padding: 20px;">이 워크스페이스에는 아직 프로젝트가 없습니다.</p>
                    </c:if>
                </div>

                <div class="team_border" id="teamManageContent" style="display: none">
                    <div class="team_all">
                        <div class="team_menu">
                            <div class="team_title_left">
                                <div>팀 멤버</div>
                                <div>팀원을 초대하고 역할을 관리하세요</div>
                            </div>
                            <div class="team_title_right">
                                <c:if test="${currentUserRole != 'VIEWER'}">
                                    <button class="button"
                                            data-modal-target="inviteMemberModal"
                                            data-modal-url="<c:url value='/request/invite?workspaceId=${workspace.workspaceId}'/>">+ 멤버초대</button>
                                </c:if>
                            </div>
                        </div>
                        <div class ="search">
                            <input type="text" id="teamSearchInput" placeholder="팀원 검색">
                        </div>
                        <div class ="team_content">
                            <table class="team_box">
                                <thead>
                                    <tr>
                                        <th>멤버</th>
                                        <th>역할</th>
                                        <th>가입일</th>
                                        <th>상태</th>
                                        <th>관리</th>
                                    </tr>
                                </thead>
                                <tbody id="teamMemberListBody">
                                    <jsp:include page="/WEB-INF/views/components/_teamMemberList.jsp" />
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/components/modals.jsp"/>

    <%-- 기존 스크립트 블록 제거 --%>
</body>
</html>