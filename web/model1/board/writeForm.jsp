<%--
  Created by IntelliJ IDEA.
  User: GDJ30
  Date: 2020-11-20
  Time: 오후 1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판 글쓰기</title>
    <link rel="stylesheet" href="../../css/main.css">
    <script>
        function inputcheck() {
            f = document.f;
            if (f.name.value==""){
                alert("글쓴이를 입력하세요");
                f.name.focus();
                return ;
            }
            if (f.pass.value==""){
                alert("비밀번호를 입력하세요");
                f.pass.focus();
                return ;
            }
            if (f.subject.value==""){
                alert("비밀번호를 입력하세요");
                f.subject.focus();
                return ;

            }
            if (f.content.value==""){
                alert("비밀번호를 입력하세요");
                f.content.focus();
                return ;
            }
            f.submit();

        }
    </script>
</head>
<body>
<form action="write.jsp" method="post" enctype="multipart/form-data" name="f">
    <table>
        <tr>
            <td>글쓴이</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type="text" name="subject"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea name="content" id="content" rows="15"></textarea></td>
        </tr>
        <tr>
            <td>첨부파일</td>
            <td><input type="file" name="file1"></td>
        </tr>
        <tr>
            <td colspan="2"><a href="javascript:inputcheck()">[게시물 등록]</a></td>
        </tr>
    </table>
</form>
</body>
</html>
