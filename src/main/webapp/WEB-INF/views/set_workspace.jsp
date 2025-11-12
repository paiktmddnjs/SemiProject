<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value='/resources/static/css/new.css'/>">

<%-- 모달 내부에 삽입될 워크스페이스 설정 폼 --%>
<div class="header">
    <div class="header_title">
        <div class="header_title_main">
            워크스페이스 설정
        </div>
        <div class="header_title_sub">
            워크스페이스의 이름과 설명을 수정합니다.
        </div>
    </div>
</div>
<%-- form에 id 추가 --%>
<form action="<c:url value='/workspace/update'/>" method="post" id="setWorkspaceForm">
    <input type="hidden" name="workspaceId" value="${workspace.workspaceId}">
    <%-- 수정한 뒤 돌아갈 경로를 위한 hidden input --%>
    <input type="hidden" name="returnTo" value="${returnTo}">

    <div class="input">
        <div class="input_title">
            워크스페이스 이름
        </div>
        <div class="input_body">
            <input type="text" name="workspaceName" value="<c:out value='${workspace.workspaceName}'/>" required>
        </div>
    </div>
    <div class="input">
        <div class="input_title">워크스페이스 설명</div>
        <div class="input_body">
            <textarea name="workspaceExplain" rows="2" required><c:out value='${workspace.workspaceExplain}'/></textarea>
        </div>
    </div>
    <div class="input">
        <div class="input_body">
            <button type="submit" class="button">저장</button>
        </div>
    </div>
</form>
