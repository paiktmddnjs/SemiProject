<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header">
    <div class="header_title">
        <div class="header_title_main">
            새 워크스페이스 생성
        </div>
        <div class="header_title_sub">
            새로운 워크스페이스를 만들 채널을 선택하세요.
        </div>
    </div>
</div>
<form action="<c:url value='/workspace/create'/>" method="post" id="newWorkspaceForm">
    <div class="input">
        <div class="input_title">
            채널 선택
        </div>
        <div class="input_body">
            <select name="channelId" required>
                <option value="">-- 채널을 선택하세요 --</option>
                <c:forEach var="channel" items="${channels}">
                    <option value="${channel.channelId}">${channel.channelName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="input">
        <div class="input_title">
            워크스페이스 이름
        </div>
        <div class="input_body">
            <input type="text" name="workspaceName" placeholder="워크스페이스의 이름을 입력하세요" required>
        </div>
    </div>
    <div class="input">
        <div class="input_title">워크스페이스 설명</div>
        <div class="input_body">
            <textarea name="workspaceExplain" rows="2" placeholder="이 워크스페이스에 대한 간단한 설명"></textarea>
        </div>
    </div>
    <div class="input">
        <div class="input_body">
            <button type="submit" class="button">생성하기</button>
        </div>
    </div>
</form>
