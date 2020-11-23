<%@ page import="model.Board" %>
<%@ page import="model.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: Muro
  Date: 2020-11-23
  Time: 오후 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    1. num 값에 해당하는 게시물을 조회
    2. 조회된 게시물을 화면에 출력
--%>
<%
    int num = Integer.parseInt(request.getParameter("num"));
    Board board = new BoardDAO().selectOne(num);

%>
<html>
<head>
    <title>제시판 수정화면</title>
    <link rel="stylesheet" href="../../css/main.css">
    <script>
        function file_delete() {
            document.f.file2.value="";
            file_desc.style.display="none";
        }
    </script>
</head>
<body>
<form action="update.jsp" method="post" enctype="multipart/form-data" name="f">
    <input type="hidden" name="num" value="<%=board.getNum()%>">
    <input type="hidden" name="file2" value="<%=board.getFile1()==null?"":board.getFile1()%>">
    <table><caption>게시판 수정 화면</caption>
        <tr>
            <td>글쓴이</td>
            <td><input type="text" name="name" value="<%=board.getName()%>"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type="text" name="subject" value="<%=board.getSubject()%>"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea name="content" rows="15"><%=board.getContent()%></textarea></td>
        </tr>
        <tr>
            <td>첨부파일</td>
            <td style="text-align: left">
                <% if (board.getFile1() != null && (!board.getFile1().equals(""))) { %>
                    <div id="file_desc"><%=board.getFile1()%>
                        <a href="javascript:file_delete()">[첨부파일 삭제]</a>
                    </div>
                <% } %>
                <input type="file" name="file1">
            </td>
        </tr>
        <tr>
            <td colspan="2"><a href="javascript:document.f.submit()">[게시물 수정]</a></td>
        </tr>
    </table>
</form>
</body>
</html>
