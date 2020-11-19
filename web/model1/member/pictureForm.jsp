<%--
  /web/model1/member/pictureForm.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원사진 등록</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<h3>사진업로드</h3>
<table>
    <tr>
        <td><img id="preview" src=""></td>
    </tr>
    <tr>
        <td>
            <form action="picture.jsp" method="post" enctype="multipart/form-data">
                <input type="file" name="picture" id="imageFile" accept="img*/">
                <input type="submit" value="사진등록">
            </form>
        </td>
    </tr>
</table>
<script>
    // <input type="file" id="imageFile" ...>
    let imagefile = document.querySelector('#imageFile');
    //<img id="preview" ...>
    let preview = document.querySelector('#preview');

    //addEventListener
    imagefile.addEventListener('change', function (e) {
        let get_file = e.target.files; // 선택된 이미지 파일
        let reader = new FileReader(); // 파일선택.
        reader.onload = (function (Img) {
            return function (e) {
                Img.src = e.target.result;
            }
        })(preview); //여기다 이미지를 집어넣은 것
        if (get_file) {
            reader.readAsDataURL(get_file[0]);
        }
    });
</script>
</body>
</html>
