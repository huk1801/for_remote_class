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
<%= id +","+ login%>
<script>
    alert("로그인 하세요");
    location.href="loginForm.jsp";
</script>
<%
    }
    if(login != null && !id.equals(login)) {
        if(!login.equals("admin")) { %>
<script>
    alert("내 정보 조회만 가능합니다.");
    location.href ="main.jsp";
</script>
<%
        }
    }
%>
<html>
<head>
    <title>회원 정보 보기</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<%
    Member member = new MemberDAO().selectOne(id);
%>
<form action="info.jsp" name="f" method="post">
    <input type="hidden" name="picture" value="">
    <table>
        <caption>회원정보보기</caption>
        <tr>
            <td rowspan="6" valign="bottom">
                <img src="" width="200" height="200" id="pic"><br>
                </td>
            <th>아이디</th>
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
                <a href="#">[수정]</a>
                <a href="#">[탈퇴]</a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
