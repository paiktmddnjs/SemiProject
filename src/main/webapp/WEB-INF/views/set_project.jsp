<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value='/resources/static/css/new.css'/>">
<%-- 모달 내부에 삽입될 프로젝트 설정 폼 --%>
<div class="header">
    <div class="header_title">
        <div class="header_title_main">
            프로젝트 설정
        </div>
        <div class="header_title_sub">
            프로젝트의 이름과 설명을 수정합니다.
        </div>
    </div>
</div>
<form action="<c:url value='/project/update'/>" method="post">
    <input type="hidden" name="projectId" value="${project.projectId}">

    <div class="input">
        <div class="input_title">
            프로젝트 이름
        </div>
        <div class="input_body">
            <input type="text" name="projectName" value="<c:out value='${project.projectName}'/>" required>
        </div>
    </div>
    <div class="input">
        <div class="input_title">프로젝트 설명</div>
        <div class="input_body">
            <textarea name="projectExplain" rows="2" required><c:out value='${project.projectExplain}'/></textarea>
        </div>
    </div>
    <div class="input">
        <div class="input_body">
            <button type="submit" class="button">저장</button>
        </div>
    </div>
</form>
