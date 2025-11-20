<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <head> 태그 제거 --%>

<div class="header">
    <div class="header_title">
        <div class="header_title_main">
            새 작업 추가
        </div>
        <div class="header_title_sub">
            프로젝트에 새로운 작업을 추가합니다.
        </div>
    </div>
</div>
<form action="<c:url value='/task/create'/>" method="post" id="newTaskForm">
    <input type="hidden" name="projectId" value="${projectId}">

    <div class="input">
        <div class="input_title">
            작업 이름
        </div>
        <div class="input_body">
            <input type="text" name="taskName" placeholder="작업의 이름을 입력하세요" required>
        </div>
    </div>
    <div class="input">
        <div class="input_title">
            담당자
        </div>
        <div class="input_body">
            <select name="workspaceMemberId">
                <option value="">-- 담당자 선택 --</option>
                <c:forEach var="member" items="${workspaceMembers}">
                    <option value="${member.workspaceMemberId}">${member.memberVo.memberName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="input">
        <div class="input_title">
            요구사항
        </div>
        <div class="input_body">
            <textarea name="taskAssign" rows="2" placeholder="작업에 대한 요구사항을 입력하세요"></textarea>
        </div>
    </div>
    <div class="input">
        <div class="input_title">
            마감일
        </div>
        <div class="input_body">
            <input type="date" name="taskDeadline">
        </div>
    </div>
    <div class="input">
        <div class="input_body">
            <button type="submit" class="button">작업 추가</button>
        </div>
    </div>
</form>
