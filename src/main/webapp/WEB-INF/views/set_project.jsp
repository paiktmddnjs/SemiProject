<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <head> 태그 제거 --%>

<div class="header">
    <div class="header_title">
        <div class="header_title_main">
            프로젝트 설정
        </div>
        <div class="header_title_sub">
            프로젝트의 상세 정보를 수정합니다.
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
        <div class="input_title">
            마감일
        </div>
        <div class="input_body">
            <%-- 날짜 형식에 맞게 value 포맷팅 --%>
            <input type="date" name="projectDeadline" value="<fmt:formatDate value="${project.projectDeadline}" pattern="yyyy-MM-dd"/>">
        </div>
    </div>
    <div class="input">
        <div class="input_title">
            유형
        </div>
        <div class="input_body">
            <input type="text" name="projectType" value="<c:out value='${project.projectType}'/>" placeholder="예: 리뷰, 브이로그">
        </div>
    </div>
    <div class="input">
        <div class="input_title">
            상태
        </div>
        <div class="input_body">
            <select name="projectStatus">
                <option value="Y" ${project.projectStatus == 'Y' ? 'selected' : ''}>진행중</option>
                <option value="N" ${project.projectStatus == 'N' ? 'selected' : ''}>종료</option>
                <option value="D" ${project.projectStatus == 'D' ? 'selected' : ''}>삭제</option>
            </select>
        </div>
    </div>
    <div class="input">
        <div class="input_title">프로젝트 메모</div>
        <div class="input_body">
            <textarea name="projectMemo" rows="3" required><c:out value='${project.projectMemo}'/></textarea>
        </div>
    </div>
    <div class="input">
        <div class="input_body">
            <button type="submit" class="button">저장</button>
        </div>
    </div>
</form>
