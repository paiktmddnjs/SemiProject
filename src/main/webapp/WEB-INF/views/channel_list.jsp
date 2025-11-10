<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- layout.jsp를 재사용하고 싶다면 include 대신 다른 레이아웃 기술(e.g., Tiles, Sitemesh)을 고려하는 것이 좋습니다. --%>
<%-- 여기서는 간단하게 단일 파일로 작성합니다. --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채널 목록</title>
    <style>
        body { font-family: sans-serif; }
        .container { max-width: 800px; margin: 20px auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; }
        h1 { text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        tr:nth-child(even) { background-color: #f9f9f9; }
    </style>
</head>
<body>
<div class="container">
    <h1>채널 목록</h1>
    <table>
        <thead>
        <tr>
            <th>채널 ID</th>
            <th>채널 이름</th>
            <th>플랫폼 타입</th>
            <th>구독자 수</th>
            <th>생성일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="channel" items="${channels}">
        <tr>
            <td><c:out value="${channels.channelId}"/></td>
            <td><c:out value="${channels.channelName}"/></td>

            </c:forEach>
            <c:if test="${empty channels}">
        <tr>
            <td colspan="5" style="text-align: center;">조회된 채널이 없습니다.</td>
        </tr>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>
