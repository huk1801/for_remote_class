<%--
  /web/chap9/error404.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>요청 페이지 없음</title>
</head>
<body>
<h1>요청하신 페이지는 존재하지 않습니다.</h1>
<h2>URL 주소가 올바른지 확인해 주세요</h2>
<h3>요청된 URL : <%=request.getRequestURL()%></h3>
<h3>요청된 URL : <%=request.getRequestURI()%></h3>
</body>
</html>
