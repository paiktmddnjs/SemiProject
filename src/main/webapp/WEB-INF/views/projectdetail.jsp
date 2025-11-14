<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType ="text/html; charset=UTF-8"
    pageEncoding ="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="<c:url value="/resources/static/css/projectdetail.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/static/css/default.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/static/css/new.css"/>">
        <script src="<c:url value="/resources/static/js/newProject.js"/>" defer></script>
        <script src="<c:url value="/resources/static/js/setProject.js"/>" defer></script>
        <script src="<c:url value="/resources/static/js/newTask.js"/>" defer></script>
        <script src="<c:url value="/resources/static/js/taskCard.js"/>" defer></script>
        </head>
        <body>
        <div class ="navigator">
            <jsp:include page="/WEB-INF/views/components/header.jsp"/>
        </div>
        <div class ="body">
            <div class ="sidebar">
                <jsp:include page="/WEB-INF/views/components/sidebar.jsp"/>
            </div>
            <div class = "content">
                <div class="container" data-project-id="${project.projectId}" data-workspace-id="${project.workspaceId}">
                    <div class = "header">
                        <div class = "header_title">
                            <div class = "header_title_main">
                                <c:out value="${project.projectName}"/>
                            </div>
                            <div class = "header_title_sub">
                                <c:out value="${project.projectMemo}"/>
                            </div>
                        </div>
                        <div class ="header_button">
                            <input type="button" value ="프로젝트 설정" class = "button" id="setProjectButton">
                        </div>
                    </div>
                    
                    <div class = "content_box">
                        <%-- 진행률 섹션 수정 --%>
                        <div class ="detail_box">
                            <div class = "box_body">
                                <div class = "title">
                                    <div>진행률</div>
                                </div>
                                <div class="progress-bar-container">
                                    <div class="progress-bar-fill" style="width: ${calculatedProgress}%;"></div>
                                    <span class="progress-bar-text">${calculatedProgress}%</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "title">
                                        <div>시작일</div>
                                    </div>
                                    <div class ="describe">
                                            <div><fmt:formatDate value="${project.projectStart}" pattern="yyyy-MM-dd"/></div>
                                    </div>
                                </div>
                            </div>
                                <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "title">
                                        <div>마감일</div>
                                    </div>
                                    <div class ="describe">
                                            <div><fmt:formatDate value="${project.projectDeadline}" pattern="yyyy-MM-dd"/></div>
                                    </div>
                                </div>
                            </div>
                                    <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "title">
                                        <div>플랫폼</div>
                                    </div>
                                    <div class ="describe">
                                            <div><c:out value="${project.projectType}"/></div>
                                    </div>
                                </div>
                            </div>
                    </div>
                    </div>
                    <div class = "content">
                    <div class="container">
                    
                    <div class = "header">
                        <div class = "header_title">
                            <div class = "header_title_main">
                                작업 목록
                            </div>
                            <div class = "header_title_sub">
                               ${fn:length(taskList)}개 작업
                            </div>
                        </div>
                        <div class ="header_button">
                            <input type="button" value ="+ 새 작업" class = "button" id="createTaskButton">
                        </div>
                    </div>
                    
                    <div class="task-status-container">
                        
                        <div class="task-column">
                            <div class="task-column-header">할 일</div>
                            <div class="task-list" id="worktodo-list">
                                <c:forEach var="task" items="${taskList}">
                                    <c:if test="${task.taskStatus == 'worktodo'}">
                                        <%@ include file="components/task_card.jsp" %>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="task-column">
                            <div class="task-column-header">진행 중</div>
                            <div class="task-list" id="progress-list">
                                <c:forEach var="task" items="${taskList}">
                                    <c:if test="${task.taskStatus == 'progress'}">
                                        <%@ include file="components/task_card.jsp" %>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="task-column">
                            <div class="task-column-header">완료</div>
                            <div class="task-list" id="complete-list">
                                <c:forEach var="task" items="${taskList}">
                                    <c:if test="${task.taskStatus == 'complete'}">
                                        <%@ include file="components/task_card.jsp" %>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>

                    </div>
                    <c:if test="${empty taskList}">
                        <p style="text-align: center; padding: 20px;">이 프로젝트에는 아직 작업이 없습니다.</p>
                    </c:if>

                    </div>
                    </div>
                    </div>  
                </div>  
                </div>
            </div>
        
            <div class ="footer">
                <jsp:include page="/WEB-INF/views/components/footer.jsp"/>
            </div>
            <div id ="modalOverlay" class="modal-overlay"></div>
                 <div id="setProjectModal" class="modal-container">
                <div class="modal-content">
                    <button class ="modal-close-button">&times;</button>
                    <div id = "setProjectContent" class="new_Content"></div>
                </div>
</div>
            <div id="newProjectModal" class="modal-container">
                <div class="modal-content">
                    <button class ="modal-close-button">&times;</button>
                    <div id = "newProjectContent" class="new_Content"></div>
                </div>
</div>
            <div id="newTaskModal" class="modal-container">
                <div class="modal-content">
                    <button class ="modal-close-button">&times;</button>
                    <div id = "newTaskContent" class="new_Content"></div>
                </div>
</div>
        </body>
    </html>