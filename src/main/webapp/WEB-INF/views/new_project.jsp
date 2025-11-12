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
                            새 프로젝트 등록
                        </div>
                        <div class="header_title_sub">
                            새로운 프로젝트 내역을 등록하세요
                        </div>
                    </div>
                </div>
                <form action="<c:url value='/project/create'/>" method="post">
                    <%-- 어떤 워크스페이스에 속하는지 ID를 숨겨서 전송 --%>
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
                            <textarea name="projectExplain" rows="2" placeholder="추가 메모"></textarea>
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
