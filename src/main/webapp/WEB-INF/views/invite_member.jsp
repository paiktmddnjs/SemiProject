<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <head> 태그 제거 --%>

<div class="header">
    <div class="header_title">
        <div class="header_title_main">
            팀 멤버 초대
        </div>
        <div class="header_title_sub">
            이메일을 사용하여 워크스페이스에 멤버를 초대하세요.
        </div>
    </div>
</div>
<form action="<c:url value='/member/invite'/>" method="post" id="inviteMemberForm">
    <input type="hidden" name="workspaceId" value="${workspaceId}">

    <div class="input">
        <div class="input_title">
            이메일 주소
        </div>
        <div class="input_body">
            <input type="email" name="email" placeholder="초대할 멤버의 이메일을 입력하세요" required>
        </div>
    </div>
    <div class="input">
        <div class="input_title">
            역할
        </div>
        <div class="input_body">
            <select name="role">
                <option value="EDITOR">편집자</option>
                <option value="VIEWER">뷰어</option>
                <option value="ADMIN">관리자</option>
            </select>
        </div>
    </div>
    <div class="input">
        <div class="input_body">
            <button type="submit" class="button">초대 보내기</button>
        </div>
    </div>
</form>
