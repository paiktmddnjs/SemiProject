<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value='/resources/static/css/new.css'/>">
</head>
<body>
    <div class="content">
        <div class="container">
            <div class="container_body">
                <div class="header">
                    <div class="header_title">
                        <div class="header_title_main">
                            새 워크스페이스 등록
                        </div>
                        <div class="header_title_sub">
                            새로운 워크스페이스 내역을 등록하세요
                        </div>
                    </div>
                </div>
                <form action="<c:url value='/workspace/create'/>" method="post">
                    <div class = img>
                        <input type = "file" id = "img" accept="jpg,jpeg,png,gif">
                    </div>
                    <div class="input">
                        <div class="input_title">
                            워크스페이스 이름
                        </div>
                        <div class="input_body">
                            <input type="text" name="workspaceName" placeholder="워크스페이스의 이름을 입력하세요" id="workspaceName" required>
                        </div>
                    </div>
                    <div class="input">
                        <div class="input_title">채널</div>
                        <div class="input_body">
                            <select name="channelId" id="channelSelect" required>
                                <option value="" disabled selected>채널을 선택하세요</option>
                                <c:forEach var="channel" items="${channels}">
                                    <option value="${channel.channelId}">${channel.channelName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="input">
                        <div class="input_title">메모</div>
                        <div class="input_body">
                            <textarea name="workspaceExplain" rows="2" placeholder="추가 메모" id="workspaceExplain"></textarea>
                        </div>
                    </div>
                    <div class="input">
                        <div class="input_body">
                            <button type="submit">저장</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
