<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value="/resources/static/css/default.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/static/css/project.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/static/css/new.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/static/css/invite.css"/>">
    <script src="<c:url value="/resources/static/js/project.js"/>" defer></script>
    <script src="<c:url value="/resources/static/js/newProject.js"/>" defer></script>
    <script src="<c:url value="/resources/static/js/inviteMember.js"/>" defer></script>
    <script src="<c:url value="/resources/static/js/setWorkspace.js"/>" defer></script>
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
                            <input type="button" value="+ 새 프로젝트" class="button" id="createProjectButton">
                        </div>
                        <div class="header_button">
                            <input type="button" value="워크스페이스 설정" class="button" id="setWorkspaceButton">
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
                        <%-- 링크 경로 수정 --%>
                        <a href="<c:url value='/project/detail?projectId=${p.projectId}'/>" class="box-link">
                            <div class="box">
                                <div class="box_body">
                                    <div class="title">
                                        <div>이미지</div>
                                        <div class="title_name">
                                            <div><c:out value="${p.projectName}"/></div>
                                        </div>
                                    </div>
                                    <div class="box_describe">
                                        <div><c:out value="${p.projectExplain}"/></div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                    <c:if test="${empty projects}">
                        <p style="text-align: center; padding: 20px;">이 워크스페이스에는 아직 프로젝트가 없습니다.</p>
                    </c:if>
                </div>

                <div class="team_border" id="teamManageContent" style="display: none">
                    <div class="team_all">
                        <div class="team_menu">
                            <div class="team_title_left">
                                <div>
                                    팀 멤버
                                </div>
                                <div>
                                    팀원을 초대하고 역할을 관리하세요
                                </div>
                            </div>
                            <div class="team_title_right">
                                <button class="button" id="inviteMemberButton">+ 멤버초대</button>
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
                                                    <div class="team_account_img">이미지</div>
                                                    <div class="team_account_info">
                                                        <div class="team_account_name"><c:out value="${member.memberVo.memberName}"/></div>
                                                        <div class="team_account_email"><c:out value="${member.memberVo.memberEmail}"/></div>
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
                                            <td><c:out value="${member.enrollDate}"/></td>
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

    <div id="modalOverlay" class="modal-overlay"></div>
    <div id="newProjectModal" class="modal-container">
        <div class="modal-content">
            <button class ="modal-close-button">&times;</button>
            <div id = "newProjectContent" class="new_Content"></div>
        </div>
    </div>

    <div id="inviteMemberModal" class="modal-container">
        <div class="modal-content">
            <button class ="modal-close-button">&times;</button>
            <div id = "inviteMemberContent" class="new_Content"></div>
        </div>
    </div>

    <div id="setWorkspaceModal" class="modal-container">
        <div class="modal-content">
            <button class ="modal-close-button">&times;</button>
            <div id = "setWorkspaceContent" class="new_Content"></div>
        </div>
    </div>

</body>
</html>
