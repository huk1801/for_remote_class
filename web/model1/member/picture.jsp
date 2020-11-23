<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    //이미지 파일 업로드 위치 지정
    String path=application.getRealPath("")+"model1/member/picture/";
    String fname=null;
//업로드 실행
    MultipartRequest multi=new MultipartRequest(request, path, 10*1024*1024,"UTF-8");
//fname:<input type="file" name="picture">선택한 파일의 이름
//      업로드된 파일의 이름
    fname=multi.getFilesystemName("picture");
//new File(path+fname):업로드된 파일의 절대 경로.
//bi: 이미지 파일을 읽어서 메모리에 저장
    BufferedImage bi=ImageIO.read(new File(path+fname));
    int width=bi.getWidth()/3; //원본이미지 가로크기의 3분의1
    int height=bi.getHeight()/3; //원본이미지 세로크기의 3분의 1
//섬네일이미지를 그리기 위한 도화지
    BufferedImage thumb=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
//g: 그리기 도구
    Graphics2D g=thumb.createGraphics();
    g.drawImage(bi, 0, 0, width, height,null);
//f: 섬네일 이미지 저장을 위한 파일 설정
    File f=new File(path+"sm_"+fname);
    if(!f.exists()){
        f.mkdirs();
    }
    ImageIO.write(thumb, "jpg", f);
%>
<script type="text/javascript">
    img = opener.document.getElementById("pic");
    img.src="picture/<%=fname%>";
    //db 저장을 위한 파라미터 설정
    opener.document.f.picture.value="<%=fname%>";
    self.close();
</script>
<h3>사진 업로드</h3>
</body>
</html>