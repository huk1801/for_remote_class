<%@ page import="model.Member" %>
<%@ page import="model.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: GDJ30
  Date: 2020-11-20
  Time: 오전 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    1. 파라미터 저장.
    2. db애서 email과 tel을 이용하여 id값을 리턴
        id = MemberDao.idSearch(email, tel)
    3. id 값이 존재
        opener의 id에 값을 저장. 현재 화면 닫기
    4. id 값이 없는 경우
        정보에 맞는 id를 찾을 수 없습니다. 메세지 출력후
        idForm.jsp 페이지로 이동.
--%>
<%
    String msg = "정보에 맞는 id를 찾을 수 없습니다.";
    String url = "idForm.jsp";
    //1. 파라미터 저장
    String email = request.getParameter("email");
    String tel = request.getParameter("tel");

    MemberDAO dao = new MemberDAO();

    String id = dao.idSearch(email, tel);
    if (id != null){
%>
<html>
<head>
    <title>id 찾기</title>
    <link rel="stylesheet" href="../../css/main.css">
    <script>
        function idsend(id) {
            opener.document.f.id.value= id;
            self.close();
        }
    </script>
</head>
<body>
<table>
    <tr>
        <th>아이디</th>
        <td><%=id.substring(0,id.length()-2)+"**"%></td>
    </tr>
    <tr>
        <td colspan="2"><input type="button" value="아이디 전송" onclick="idsend('<%=id.substring(0,id.length()-2)%>')"></td>
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