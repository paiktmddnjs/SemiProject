<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 
    이 파일은 projectdetail.jsp에서 include되어 사용됩니다.
    'task' 변수와 'workspaceMembers' 변수가 projectdetail.jsp로부터 전달된다고 가정합니다.
    currentUserRole 변수도 projectdetail.jsp로부터 전달된다고 가정합니다.
--%>
<div class="task-card" data-task-id="${task.taskId}">
    <div class="task-card-title"><c:out value="${task.taskName}"/></div>
    
    <div class="task-card-details">
        <%-- 담당자 변경 드롭다운 --%>
        <div class="task-detail-item">
            <label for="assignee-select-${task.taskId}">담당자:</label>
            <select class="assignee-select" id="assignee-select-${task.taskId}" data-task-id="${task.taskId}"
                    ${currentUserRole == 'VIEWER' ? 'disabled' : ''}>
                <option value="">-- 없음 --</option>
                <c:forEach var="member" items="${workspaceMembers}">
                    <option value="${member.workspaceMemberId}" ${task.workspaceMemberId == member.workspaceMemberId ? 'selected' : ''}>
                        <c:out value="${member.memberVo.memberName}"/>
                    </option>
                </c:forEach>
            </select>
        </div>

        <%-- 상태 변경 드롭다운 --%>
        <div class="task-detail-item">
            <label for="status-select-${task.taskId}">상태:</label>
            <select class="status-select" id="status-select-${task.taskId}" data-task-id="${task.taskId}"
                    ${currentUserRole == 'VIEWER' ? 'disabled' : ''}>
                <option value="worktodo" ${task.taskStatus == 'worktodo' ? 'selected' : ''}>할 일</option>
                <option value="progress" ${task.taskStatus == 'progress' ? 'selected' : ''}>진행 중</option>
                <option value="complete" ${task.taskStatus == 'complete' ? 'selected' : ''}>완료</option>
            </select>
        </div>

        <%-- 마감일 --%>
        <div class="task-detail-item">
            <span>마감일:</span>
            <span class="task-card-deadline">
                <fmt:formatDate value="${task.taskDeadline}" pattern="MM-dd"/>
            </span>
        </div>
    </div>
</div>
