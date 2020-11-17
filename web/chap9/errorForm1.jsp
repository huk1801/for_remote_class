<%--
  /web/chap9/errorForm1.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- errorPage="error.jsp" : 현재 페이지에서 오류 발생시 error.jsp 이동 --%>
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <title>오류 발생 페이지</title>
</head>
<body>
<% int num = Integer.parseInt("abc"); %>
<%= request.getParameter("name").trim()%>
</body>
</html>
<%--
    error 페이지 설정시 우선 순위
    1. 해당 페이지에서 오류 페이지 설정시
        <% page errorPage="error.jsp" %>
    2. web.xml 에서 예외클래스별로 설정
        <error-page><exception-type>...
    3. web.xml 에서 Http 오류 코드로 설정
        <error-page><error-code>...
    4. 톰캣(웹컨테이너, 웹어플리케이션서버)에서 기본으로 제공하는 에러 페이지.
--%>