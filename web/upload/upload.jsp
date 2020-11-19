<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%--
  /web/upload/upload.jsp
  enctype="multipart/form-data"로 action 되었으므로
  request 객체를 직접 사용할 수 없다.
  => MultipartRequest 객체를 이용하여 사용됨.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>파일 업로드 결과</title>
</head>
<body>
<%
    //application.getRealPath("/") : 웹어플리케이션 폴더 경로.
    //uploadPath : 웹어플리케이션 폴더 경로/upload/
    //              => 서버의 업로드 파일이 저장되는 위치
    String uploadPath = application.getRealPath("/") + "upload/";
    int size = 10*1024*1024;
    File f = new File(uploadPath);
    if(!f.exists()) f.mkdirs();
    /*
    new MultipartRequest
    request: 파라미터정보, 파일 정보, 파일 내용 저장하고있는 요청객체.
    uploadPath: 업로드되는 폴더 정보
    size: 업로드 되는 최대 파일의 크기
    UTF-8: 파라미터 인코딩 설정
     */
    MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"UTF-8");
    String name = multi.getParameter("name"); //name 파라미터값
    String title = multi.getParameter("title");
    String fname = multi.getFilesystemName("file1"); //파일의 이름
%>
업로드 위치 : <%=uploadPath%><br>
올린사람 : <%=name%><br>
제목 : <%=title%><br>
파일 : <a href="<%=fname%>"><%=fname%></a><br>
</body>
</html>
