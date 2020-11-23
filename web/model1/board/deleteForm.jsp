<%@ page import="model.Board" %>
<%@ page import="model.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: Muro
  Date: 2020-11-23
  Time: 오후 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int num = Integer.parseInt(request.getParameter("num"));
    Board board = new BoardDAO().selectOne(num);
%>
<html>
<head>
    <title>게시글 삭제 비밀번호 입력</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="delete.jsp" name="f" method="post" onsubmit="return inputcheck(this)">
    <input type="hidden" name="num" value="<%=board.getNum()%>">
    <table>
        <caption>비밀번호 입력</caption>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="삭제하기"></td>
        </tr>
    </table>
</form>
<script>
    function inputcheck(f) {
        if (f.pass.value == "") {
            alert("비밀번호를 입력하세요");
            f.pass.focus();
            return false;
        }
        return true;
    }
</script>
</body>
</html>