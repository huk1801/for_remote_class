<%--

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 내용 보기</title>
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="join" class="chap7.Member"/>
<jsp:setProperty name="join" property="*"/>
<table>
    <caption>회원정보</caption>
    <tr><td>아이디</td>
        <td><jsp:getProperty name="join" property="id"/></td>
    </tr>
    <tr><td>비밀번호</td>
        <td><jsp:getProperty name="join" property="pass"/></td>
    </tr>
    <tr><td>이름</td>
        <td><jsp:getProperty name="join" property="name"/></td>
    </tr>
    <tr><td>성별</td>
        <td><jsp:getProperty name="join" property="gender"/>,
        <%=join.getGender()==1?"남자":"여자"%></td>
    </tr>
    <tr><td>성별</td>
        <td><jsp:getProperty name="join" property="gender2"/></td>
    </tr>
    <tr><td>나이</td>
        <td><jsp:getProperty name="join" property="age"/></td>
    </tr>
    <tr><td>이메일</td>
        <td><jsp:getProperty name="join" property="email"/></td>
    </tr>

</table>
</body>
</html>
