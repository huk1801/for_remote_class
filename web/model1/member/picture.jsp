<%--
  /web/model1/member/picture.jsp
  1. 이미지파일 업로드. request 객체 사용 불가
     이미지파일 업로드의 위치 : 현재 폴더/picture 폴더로 설정
  2. 이미지 파일의 3분의 1크기의 섬네일이미지 생성. 이름은 sm_파일이름으로 설정
  3. opener 화면에 결과 전달=>javascript
  4. 현재 화면 close() => javascript
--%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<%
    String path = application.getRealPath("/") + "model1/member/picture/";
    int size = 10 * 1024 * 1024;
    File f = new File(path);
    if (!f.exists()) f.mkdirs();
    MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8");
    String fname = multi.getFilesystemName("picture"); // 파일의 이름

    BufferedImage bi = ImageIO.read(new File(path + fname));
    int width = bi.getWidth() / 3;
    int height = bi.getHeight() / 3;
    BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

    Graphics2D g = thumb.createGraphics();
    g.drawImage(bi, 0, 0, width, height, null);
    File f1 = new File(path + "sm_" + fname);
    ImageIO.write(thumb, "jpg", f1);
%>

<script>
    alert("사진이 등록 되었습니다.");
    opener.document.getElementById("pic").src='./picture/<%=fname%>';
    self.close();
</script>
</body>
</html>
