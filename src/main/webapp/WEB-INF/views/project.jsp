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
    <script src="<c:url value="/resources/static/js/inviteMember.js"/>" defer></script>
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
            <div class="container" data-workspace-id="${workspaceId}">
                <div class="header">
                    <div class="header_title">
                        <div class="header_title_main">
                            프로젝트 (Workspace ID: ${workspaceId})
                        </div>
                        <div class="header_title_sub">
                            메인 유튜브 채널의 모든 콘텐츠 관리
                        </div>
                    </div>
                    <div class="header_button">
                        <input type="button" value="+ 새 프로젝트" class="button" id="createProjectButton">
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
                
                <%-- 프로젝트 목록을 표시하는 부분 --%>
                <div id="projectContent" class="content_box">
                    <c:forEach var="p" items="${projects}">
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
                    </c:forEach>
                    <c:if test="${empty projects}">
                        <p style="text-align: center; padding: 20px;">이 워크스페이스에는 아직 프로젝트가 없습니다.</p>
                    </c:if>
                </div>

                <%-- 팀 관리 내용은 일단 그대로 둡니다 --%>
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

                    <div class ="team_content"  id="teamManageContent">

                        <table class="team_box">
                            <tr>
                                <th>멤버</th>
                                <th>역할</th>
                                <th>가입일</th>
                                <th>상태</th>
                            </tr>
                            <tr>
                                <td>
                                    <div class="team_account">
                                        <div class="team_account_img">이미지</div>
                                        <div class="team_account_info">
                                            <div class="team_account_name">김크리에이터</div>
                                            <div class="team_account_email">creator@example.com</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <select name="" id="">
                                        <option value="">편집자</option>
                                        <option value="">썸네일러</option>
                                    </select>
                                </td>
                                <td>가입일</td>
                                <td>상태</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="team_account">
                                        <div class="team_account_img">이미지</div>
                                        <div class="team_account_info">
                                            <div class="team_account_name">박에디터</div>
                                            <div class="team_account_email">editor@example.com</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <select name="" id="">
                                        <option value="">편집자</option>
                                        <option value="">썸네일러</option>
                                    </select>
                                </td>
                                <td>가입일</td>
                                <td>상태</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="team_account">
                                        <div class="team_account_img">이미지</div>
                                        <div class="team_account_info">
                                            <div class="team_account_name">이매니저</div>
                                            <div class="team_account_email">manager@example.com</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <select name="" id="">
                                        <option value="">편집자</option>
                                        <option value="">썸네일러</option>
                                    </select>
                                </td>
                                <td>가입일</td>
                                <td>상태</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="team_account">
                                        <div class="team_account_img">이미지</div>
                                        <div class="team_account_info">
                                            <div class="team_account_name">최디자이너</div>
                                            <div class="team_account_email">designer@example.com</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <select name="" id="">
                                        <option value="">편집자</option>
                                        <option value="">썸네일러</option>
                                    </select>
                                </td>
                                <td>가입일</td>
                                <td>상태</td>
                            </tr>
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

</body>
</html>
