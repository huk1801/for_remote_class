<%@ page import="java.sql.*" %><%--
  /web/test1116/test1.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>간단한 select 구문 실행 결과 확인하기</title>
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String sql = request.getParameter("sql");
%>
<form method="post">
    <textarea rows="5" cols="60" name="sql"><%=(sql == null) ? "" : sql%></textarea>
    <input type="submit" value="실행"><br>
</form>
<%
    Connection conn = null;
    if (sql != null && !sql.trim().equals("")) { //입력된 구문이 존재.
        try {
            //드라이버 설정
            Class.forName("org.mariadb.jdbc.Driver");
            //연결객체(Connection 객체)
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb", "scott", "1234");
//            PreparedStatement : Statement 하위 인터페이스
//                                  sql 구문을 미리 db 서버에 전송.
//                        Statement stmt = conn.createStatement();
//            ResultSet rs = stmt.executeQuery(sql);
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            ResultSetMetaData rsmt = rs.getMetaData();
            PreparedStatement pstmt2 = conn.prepareStatement("select count(*) from (" + sql + ") a");
            ResultSet rs2 = pstmt2.executeQuery();
            rs2.next();
            int cnt = rs2.getInt(1); // 조회된 레코드의 건수
%>
<table>
    <tr>
        <td colspan="<%=rsmt.getColumnCount()%> " style="text-align: right;">조회된 레코드 갯수:<%=cnt%>
        </td>
    </tr>
    <tr>
            <%  //getColumnCount() : 조회된 컬럼의 갯수
    //getColumnCount(1) : 첫번째 조회된 컬럼의 이름

for(int i = 1; i <= rsmt.getColumnCount(); i++) { %>
        <th><%=rsmt.getColumnName(i)%>
        </th>
            <%} %>
    <tr>
            <% while(rs.next()) { //읽어온 레코드 한개씩 리턴 %>
    <tr>
        <%
            //getString(1) : 첫번째 컬럼의 값
            for (int i = 1; i <= rsmt.getColumnCount(); i++) { %>
        <td><%=rs.getString(i)%>
        </td>
        <%} %>
    </tr>
    <% } %>
</table>
<%
} catch (Exception e) {%>
<h1>sql 구문 오류입니다.</h1>
<h1><%=e.getMessage()%>
</h1>
<h1>sql 구문 : <%=sql%>
</h1>
<% } finally {
    conn.close();
}
} %>
</body>
</html>