<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>받은 초대 목록</title>
    <link rel="stylesheet" href="<c:url value='/resources/static/css/default.css'/>">
    <style>
        .container { max-width: 800px; margin: 20px auto; padding: 20px; }
        .header { margin-bottom: 20px; }
        .header_title_main { font-size: 24px; font-weight: bold; }
        .request-list { list-style: none; padding: 0; }
        .request-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            margin-bottom: 10px;
        }
        .request-info { display: flex; flex-direction: column; }
        .workspace-name { font-weight: bold; }
        .sender-info { font-size: 14px; color: #6b7280; }
        .request-actions .button {
            margin-left: 10px;
            padding: 8px 12px;
            font-size: 14px;
        }
        .button.accept { background-color: #10b981; color: white; }
        .button.reject { background-color: #ef4444; color: white; }
        .no-requests { text-align: center; padding: 40px; color: #6b7280; }
        .debug-id { font-size: 10px; color: #9ca3af; margin-left: 5px; }
    </style>
</head>
<body>
    <div class="navigator">
        <jsp:include page="/WEB-INF/views/components/header.jsp"/>
    </div>
    <div class="body">
        <div class="sidebar">
            <jsp:include page="/WEB-INF/views/components/sidebar.jsp"/>
        </div>
        <div class="content">
            <div class="container">
                <div class="header">
                    <div class="header_title">
                        <div class="header_title_main">받은 초대</div>
                        <div class="header_title_sub">워크스페이스 참여 요청을 확인하고 수락 또는 거절할 수 있습니다.</div>
                    </div>
                </div>

                <ul class="request-list">
                    <c:forEach var="req" items="${requests}">
                        <li class="request-item">
                            <div class="request-info">
                                <span class="workspace-name">'${req.workspaceName}' 워크스페이스</span>
                                <span class="sender-info">'${req.senderName}'님이 초대했습니다.</span>
                            </div>
                            <div class="request-actions">
                                <form action="<c:url value='/request/accept'/>" method="post" style="display: inline;">
                                    <input type="hidden" name="requestId" value="${req.requestId}">
                                    <button type="submit" class="button accept">
                                        수락 <span class="debug-id">(ID: ${req.requestId})</span>
                                    </button>
                                </form>
                                <form action="<c:url value='/request/reject'/>" method="post" style="display: inline;">
                                    <input type="hidden" name="requestId" value="${req.requestId}">
                                    <button type="submit" class="button reject">
                                        거절 <span class="debug-id">(ID: ${req.requestId})</span>
                                    </button>
                                </form>
                            </div>
                        </li>
                    </c:forEach>
                    <c:if test="${empty requests}">
                        <li class="no-requests">받은 초대가 없습니다.</li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer">
        <jsp:include page="/WEB-INF/views/components/footer.jsp"/>
    </div>
</body>
</html>
