<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>치지직 로그인 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
        }
        .info-section {
            background-color: #f5f5f5;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
        }
        .info-section h3 {
            margin-top: 0;
            color: #333;
        }
        .info-item {
            margin: 8px 0;
        }
        .info-label {
            font-weight: bold;
            color: #666;
        }
        .info-value {
            color: #000;
        }
        .token {
            word-break: break-all;
            font-family: monospace;
            font-size: 12px;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #ddd;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h2>✅ 치지직 로그인 성공!</h2>

<div class="info-section">
    <h3>유저 정보</h3>
    <div class="info-item">
        <span class="info-label">채널 ID:</span>
        <span class="info-value">${channelId}</span>
    </div>
    <div class="info-item">
        <span class="info-label">채널 이름:</span>
        <span class="info-value">${channelName}</span>
    </div>
    <c:if test="${not empty userInfo.nickname}">
        <div class="info-item">
            <span class="info-label">닉네임:</span>
            <span class="info-value">${userInfo.nickname}</span>
        </div>
    </c:if>
</div>

<c:if test="${not empty channelInfo}">
    <div class="info-section">
        <h3>채널 상세 정보</h3>
        <c:if test="${not empty channelInfo.channelName}">
            <div class="info-item">
                <span class="info-label">채널명:</span>
                <span class="info-value">${channelInfo.channelName}</span>
            </div>
        </c:if>
        <c:if test="${not empty channelInfo.followerCount}">
            <div class="info-item">
                <span class="info-label">팔로워 수:</span>
                <span class="info-value">${channelInfo.followerCount}</span>
            </div>
        </c:if>
        <c:if test="${not empty channelInfo.channelImageUrl}">
            <div class="info-item">
                <span class="info-label">채널 이미지:</span>
                <span class="info-value"><img src="${channelInfo.channelImageUrl}" alt="채널 이미지" style="max-width: 200px;"></span>
            </div>
        </c:if>
    </div>
</c:if>

<div class="info-section">
    <h3>최근 구독자 목록</h3>

    <c:choose>
        <%-- 구독자 리스트(subscribers)가 비어있지 않을 때 (when) --%>
        <c:when test="${not empty subscribers}">
            <c:forEach var="subscriber" items="${subscribers}">
                <div class="info-item">
                    <span class="info-label">구독자:</span>
                    <span class="info-value">${subscriber.channelName}</span>
                    <c:if test="${not empty subscriber.month}">
                        <span class="info-value" style="margin-left: 8px; color: #2e7d32;">${subscriber.month}개월</span>
                    </c:if>
                    <c:if test="${not empty subscriber.tierNo}">
                        <span class="info-value" style="margin-left: 8px;">티어 ${subscriber.tierNo}</span>
                    </c:if>
                    <c:if test="${not empty subscriber.createdDate}">
                        <span class="info-value" style="margin-left: 8px; color: #666;">구독일: ${subscriber.createdDate}</span>
                    </c:if>
                </div>
            </c:forEach>
        </c:when>

        <%-- 그 외 모든 경우 (otherwise), 즉 리스트가 비었을 때 --%>
        <c:otherwise>
            <div class="info-item">
                <span class="info-value">최근 구독자가 없습니다.</span>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<div class="info-section">
    <h3>Access Token</h3>
    <div class="token">${accessToken}</div>
</div>

<a href="/chzzk/">돌아가기</a>
</body>
</html>
