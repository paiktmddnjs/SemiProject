<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // URL 파라미터에서 페이지 이름(예: MoneyBarApi)을 가져옵니다.
    String pageName = request.getParameter("page");

    // 파일 경로를 구성합니다. /WEB-INF/views/ 경로가 정확해야 합니다.
    String path = "/WEB-INF/views/" + pageName + ".jsp";

    // 경로가 null이나 비어있지 않은지 검사 후 인클루드
    if (pageName != null && !pageName.isEmpty()) {
%>
<jsp:include page="<%= path %>" flush="true" />
<%
    } else {
        // 페이지 이름이 누락된 경우 서버 콘솔에 경고를 출력합니다.
        System.out.println("Loader Warning: 'page' parameter is missing.");
    }
%>