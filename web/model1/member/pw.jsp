<%@ page import="model.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: GDJ30
  Date: 2020-11-20
  Time: 오후 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String msg = "정보에 맞는 password 를 찾을 수 없습니다.";
    String url = "pwForm.jsp";
    //1. 파라미터 저장
    String id = request.getParameter("id");
    String email = request.getParameter("email");
    String tel = request.getParameter("tel");

    MemberDAO dao = new MemberDAO();

    String pw = dao.pwSearch(id,email,tel);

    if (pw != null){
%>
<html>
<head>
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="../../css/main.css">
    <script>
        function closepw() {
            self.close();
        }
    </script>
</head>
<body>
<table>
    <tr>
        <th>비밀번호</th>
        <td><%=pw.substring(0,pw.length()-2)+"**"%></td>
    </tr>
    <tr>
        <td colspan="2"><input type="button" value="닫기" onclick="closepw()"></td>
    </tr>
</table>
</body>
</html>
<%} else { %>
<script>
    alert("<%=msg%>");
    location.href="<%=url%>";
</script>
<%}%>