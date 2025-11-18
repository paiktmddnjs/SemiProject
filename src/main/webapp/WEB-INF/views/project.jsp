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
    </style>
</head>
<body>
    <div class="navigator">
        <jsp:include page="/WEB-INF/views/components/header.jsp"/>
    </div>
    <div class="body">
        <div class="sidebar">
            <jsp:include page="/WEB-INF/views/components/sidebar.jsp"/>
        </div>
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
                        <div class="header_button">
                            <input type="button" value="+ 새 프로젝트" class="button" 
                                   data-modal-target="newProjectModal"
                                   data-modal-url="<c:url value='/project/new?workspaceId=${workspace.workspaceId}'/>">
                        </div>
                        <div class="header_button">
                            <input type="button" value="워크스페이스 설정" class="button"
                                   data-modal-target="setWorkspaceModal"
                                   data-modal-url="<c:url value='/workspace/set?workspaceId=${workspace.workspaceId}'/>">
                        </div>
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
                            <button class="delete-btn" onclick="deleteProject(event, '${p.projectId}', '${p.workspaceId}')">X</button>
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
                                <button class="button"
                                        data-modal-target="inviteMemberModal"
                                        data-modal-url="<c:url value='/request/invite?workspaceId=${workspace.workspaceId}'/>">+ 멤버초대</button>
                            </div>
                        </div>
                        <div class ="search">
                            <input type="text" placeholder="팀원 검색">
                        </div>
                        <div class ="team_content">
                            <table class="team_box">
                                <thead>
                                    <tr>
                                        <th>멤버</th>
                                        <th>역할</th>
                                        <th>가입일</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="member" items="${workspaceMembers}">
                                        <tr>
                                            <td>
                                                <div class="team_account">
                                                    <div class="team_account_info">
                                                        <div class="team_account_name"><c:out value="${member.memberVo.memberName}"/></div>
                                                        <div class="team_account_email"><c:out value="${member.memberVo.email}"/></div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <select name="role" id="role-select-${member.memberId}">
                                                    <option value="ADMIN" ${member.workspaceMemberRole == 'ADMIN' ? 'selected' : ''}>관리자</option>
                                                    <option value="EDITOR" ${member.workspaceMemberRole == 'EDITOR' ? 'selected' : ''}>편집자</option>
                                                    <option value="VIEWER" ${member.workspaceMemberRole == 'VIEWER' ? 'selected' : ''}>뷰어</option>
                                                </select>
                                            </td>
                                            <td><c:out value="${member.memberVo.enrollDate}"/></td>
                                            <td>활성</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty workspaceMembers}">
                                        <tr>
                                            <td colspan="4" style="text-align: center; padding: 20px;">이 워크스페이스에는 아직 팀 멤버가 없습니다.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <jsp:include page="/WEB-INF/views/components/footer.jsp"/>
    </div>

    <jsp:include page="/WEB-INF/views/components/modals.jsp"/>

    <script>
        function deleteProject(event, projectId, workspaceId) {
            event.preventDefault();
            event.stopPropagation();

            if (confirm('정말 이 프로젝트를 삭제하시겠습니까?')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '${pageContext.request.contextPath}/project/delete';

                const idInput = document.createElement('input');
                idInput.type = 'hidden';
                idInput.name = 'projectId';
                idInput.value = projectId;
                form.appendChild(idInput);

                const wsIdInput = document.createElement('input');
                wsIdInput.type = 'hidden';
                wsIdInput.name = 'workspaceId';
                wsIdInput.value = workspaceId;
                form.appendChild(wsIdInput);

                document.body.appendChild(form);
                form.submit();
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            const successMessage = '<c:out value="${successMessage}" />';
            const errorMessage = '<c:out value="${errorMessage}" />';

            console.log("JSP 렌더링 시점의 successMessage:", successMessage);
            console.log("JSP 렌더링 시점의 errorMessage:", errorMessage);

            if (successMessage) {
                alert(successMessage);
            }
            if (errorMessage) {
                alert(errorMessage);
            }
        });
    </script>
</body>
</html>
