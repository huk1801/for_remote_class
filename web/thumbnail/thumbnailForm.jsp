<%--
  /web/thumbnail/thumbnailForm.jsp
  thumbnail 이미지 예제 : 큰이미지를 작은 이미지로 생성.
  => 이미지 업로드하면서, 작은이미지 생성
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>원본이미지 올리기</title>
</head>
<body>
<form action="thumbnail.jsp" method="post" enctype="multipart/form-data">
    원본이미지 : <input type="file" name="picture">
    <input type="submit" value="썸네일이미지생성">
</form>
</body>
</html>
