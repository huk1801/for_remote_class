<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: GDJ30
  Date: 2020-11-16
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>emp 테이블 읽어 화면에 출력하기</title>
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%
    //드라이버 설정
    Class.forName("org.mariadb.jdbc.Driver");
    //Connection 생성
    Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb","scott","1234");
    //sql 구문 전달 객체 생성
    Statement stmt = conn.createStatement();
    //sql 구문 실행
    ResultSet rs = stmt.executeQuery("select * from student");
    //ResultSetMetaData : 조회된 레코드의 정보 저장
    ResultSetMetaData rsmt = rs.getMetaData();
%>
<table><tr>

<%  //getColumnCount() : 조회된 컬럼의 갯수
    //getColumnCount(1) : 첫번째 조회된 컬럼의 이름
for(int i = 1; i < rsmt.getColumnCount(); i++) { %>
  <th><%=rsmt.getColumnName(i)%></th>
<%} %><tr>
<% while(rs.next()) { //읽어온 레코드 한개씩 리턴 %>
<tr>
    <%
        //getString(1) : 첫번째 컬럼의 값
        for(int i = 1; i < rsmt.getColumnCount(); i++) { %>
      <td><%=rs.getString(i)%></td>
    <%} %>
</tr>
<% } %>
</table>
</body>
</html>
