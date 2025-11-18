<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 11. 4.
  Time: 오전 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<<<<<<< .merge_file_eKM3UK

<jsp:include page="/WEB-INF/views/components/layout.jsp" />
=======
    <c:if test="${not empty sessionScope.alertMsg}">
        <script>
             alert("${sessionScope.alertMsg}");
        </script>
        <c:remove var="alertMsg" scope="session"/>
    </c:if>
    <%@ include file="/WEB-INF/views/components/layout.jsp" %>
>>>>>>> .merge_file_jbTJ0W


</body>
</html>
