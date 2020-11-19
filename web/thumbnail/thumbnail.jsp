<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.awt.*" %><%--
  /web/thumbnail/thumbnail.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>원본이미지와 썸네일 이미지 보기</title>
</head>
<body>
<%
    String path = application.getRealPath("/") + "thumbnail/";
    int size = 10 * 1024 * 1024; // 최대 업로드 크기
    //업로드 실행
    MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8");
    //fnmae : <input type="file" name="picture"> 선택한 파일의 이름
    //          업로드된 파일의 이름
    String fname = multi.getFilesystemName("picture");
    //new File(path + fname) : 업로드된 파일의 절대 경로.
    //bi : 이미지 파일을 읽어서 메모리에 로드 => 원본이미지
    BufferedImage bi = ImageIO.read(new File(path + fname));
    int width = bi.getWidth()/5; //원본이미지 가로크기의 5분의 1
    int height = bi.getHeight()/5; //원본이미지 세로크기의 5분의 1
    //thumb : 원본이미지 크기의 5분의1 크기의 도화지(이미지없음) 생성.
    BufferedImage thumb = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
    //g : 그리기 도구
    Graphics2D g = thumb.createGraphics();
    //g.drawImage : 이미지 그리기
    g.drawImage(bi,0,0,width,height,null);
    //f : 원본이미지와 같은 폴더에 sm_원본이미지파일명 파일 선택.
    File f = new File(path + "sm_" + fname);
    ImageIO.write(thumb,"jpg",f);
%>
<h3>원본이미지</h3><img src="<%=fname%>"><p>
<h3>썸네일이미지</h3><img src="sm_<%=fname%>"><p>
</body>
</html>
