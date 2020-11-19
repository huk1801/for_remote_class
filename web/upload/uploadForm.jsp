<%--
  /web/upload/uploadForm.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>파일 업로드 예제</title>
    <link rel="stylesheet" href="../css/main.css">
</head>
<!--
    enctype="multipart/form-data" : 파일 업로드시 선택된 파일의 내용까지 서버로 전송하도록 설정.
    파일 업로드를 하기 위해서는 enctype="multipart/form-data" 속성을 form에 설정해야 함.
    method="post"여야 함.
    -- 주의사항 --
        upload.jsp 페이지에서는 request 객체를 직접사용 불가.
        : cos.jar 파일에 설정된 MultipartRequest 객체를 사용해야함.
 -->
<body>
<form action="upload.jsp" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <th>올린사람</th>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th>제목</th>
            <td><input type="text" name="title"></td>
        </tr>
        <tr>
            <th>파일</th>
            <td><input type="file" name="file1"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="전송"></td>
        </tr>
    </table>
</form>
</body>
</html>
