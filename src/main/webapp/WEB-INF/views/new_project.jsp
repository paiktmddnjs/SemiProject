<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 모달 내부에 삽입될 내용 --%>
<div class="header">
    <div class="header_title">
        <div class="header_title_main">
            새 프로젝트 등록
        </div>
        <div class="header_title_sub">
            새로운 프로젝트 내역을 등록하세요
        </div>
    </div>
</div>
<form action="<c:url value='/project/create'/>" method="post">
    <input type="hidden" name="workspaceId" value="${workspaceId}">

    <div class="input">
        <div class="input_title">
            프로젝트 이름
        </div>
        <div class="input_body">
            <input type="text" name="projectName" placeholder="프로젝트의 이름을 입력하세요" required>
        </div>
    </div>
    <div class="input">
        <div class="input_title">메모</div>
        <div class="input_body">
            <%-- projectExplain -> projectMemo --%>
            <textarea name="projectMemo" rows="2" placeholder="추가 메모"></textarea>
        </div>
    </div>
    <div class="input">
        <div class="input_body">
            <button type="submit" class="button">저장</button>
        </div>
    </div>
</form>
