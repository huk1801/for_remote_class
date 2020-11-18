<%@ page import="model.Member" %>
<%@ page import="model.MemberDAO" %>
<%--
  /web/model1/member/info.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String login = (String)session.getAttribute("login");
    String id = request.getParameter("id");
    if(login == null) {
%>
<script>
    alert("로그인 하세요");
    location.href="loginForm.jsp";
</script>
<%
    }
    else if(!id.equals(login) && !login.equals("admin")) { %>
<script>
    alert("내 정보 조회만 가능합니다.");
    location.href ="main.jsp";
</script>
<%
    } else { //정상적인 경우.
    Member member = new MemberDAO().selectOne(id);
%>
<html>
<head>
    <title>회원 정보 보기</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="info.jsp" name="f" method="post">
    <input type="hidden" name="picture" value="">
    <table>
        <caption>회원정보보기</caption>
        <tr>
            <td rowspan="6" width="30%">
                <img src="picture/<%=member.getPicture()%>" width="200" height="200" id="pic"><br>
                </td>
            <th width="20%">아이디</th>
            <td><%=member.getId()%></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><%=member.getName()%></td>
        </tr>
        <tr>
            <th>성별</th>
            <td><%=(member.getGender()==1)?"남":"여"%></td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td><%=member.getTel()%></td>
        </tr>
        <tr>
            <th>이메일</th>
            <td><%=member.getEmail()%></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="updateForm.jsp?id=<%=member.getId()%>">[수정]</a>
                <% if(!id.equals("admin") && !login.equals("admin")) { %>
                <a href="deleteForm.jsp?id=<%=member.getId()%>">[탈퇴]</a>
                <% } %>
            </td>
        </tr>
    </table>
</form>
<% } %>
</body>
</html>
