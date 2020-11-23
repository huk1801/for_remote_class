<%@ page import="model.BoardDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Board" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: GDJ30
  Date: 2020-11-20
  Time: 오후 3:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    1. 한페이지당 10건의 게시물을 출력하기.
       pageNum 파라미터 값을 저장 => 없는 경우는 1로 설정하기
    2. 최근 등록된 게시물이 가장 위에 배치함
    3. db에서 해당 페이지에 출력될 내용을 조회하여 화면에 출력.
       게시물을 출력부분.
       페이지 구분 출력부분.

       20201123 문제
       1. 첨부파일이 있는경우 @표시하기
       2. 오늘 등록된 게시물은 시:분:초로 출력하고, 오늘 등록된 게시물이 아닌글은 년-월-일 시:분으로 출력하기
       3. 답글인 경우 들여쓰기 └
       4. 페이지별 조회번호가 출력되도록 출력하기.
--%>
<%
    int pageNum = 1;

    try {
        pageNum = Integer.parseInt(request.getParameter("pageNum"));
    }catch (NumberFormatException e){}

    int limit = 10;
    BoardDAO dao = new BoardDAO();
    int boardCount = dao.boardCount(); // 전체 게시물 등록 건수 리턴
    //pageNum 에 출력될 게시물 10개를 List 객체로 리턴
    List<Board> list = dao.list(pageNum, limit);
    // 페이지 목록
    /*
        maxpage : 전체 필요한 페이지 갯수. 총 페이지 갯수
        게시물 건수  페이지
            11건     :   2
                         11.0/10 => 1.1 + 0.95 => (int)(2.05) => 2
            30건     :   3
                        30.0/10 => 3.0 + 0.95 => (int)(3.95) => 3
            301건    :   31
                        301.0/10 => 30.1 + 0.95 => (int)(31.05) => 3
     */
    int maxPage = (int)((double)boardCount/limit + 0.95);
    /*
        startpage : 화면에 출력될 시작 페이지 번호
            현재페이지   시작페이지
                2   :   1
                2/10.0 => 0.2 + 0.9 => (int)(1.1) -1 => 0 * 10 => 0+1 => 1
                10  :   1
                10/10.0 => 1.0 + 0.9 => (int)(1.9) -1 => 0 * 10 => 0+1 => 1
                25  :   21
                25/10.0 => 2.5 + 0.9 => (int)(3.4) -1 => 2 * 10 => 20+1 => 21
                505  :   501
                505/10.0 => 50.5 + 0.9 => (int)(51.4) -1 => 50 * 10 => 500+1 => 500 + 1
     */
    int startPage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
    /*
        endpage :   화면에 출력될 마지막 페이지 번호.
                    최대 페이지 보다 클 수 없다.
          시작페이지 : 마지막 페이지
               1   :   10
               11  :   20
     */
    int endPage = startPage + 9;
    if (endPage > maxPage) endPage = maxPage;

    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
    String today = sf.format(new Date());
    SimpleDateFormat todayf = new SimpleDateFormat("HH:mm:ss");
    SimpleDateFormat otherf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    int boardNum = boardCount - (pageNum -1) * limit;
%>
<html>
<head>
    <title>게시물 목록보기</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>게시판 목록</caption>
    <% if (boardCount == 0){%>
    <tr>
        <td colspan="5"> 등록된 게시글이 없습니다. </td>
    </tr>
    <% } else { %>
    <tr>
        <td colspan="5" style="text-align: right">글개수 : <%=boardCount%></td>
    </tr>
    <tr>
        <th width="8%">번호</th>
        <th width="50%">제목</th>
        <th width="14%">작성자</th>
        <th width="17%">등록일</th>
        <th width="11%">조회수</th>
    </tr>
    <% for (Board b : list) { //게시글 조회 시작%>
    <tr>
        <td><%=boardNum--%></td>
        <td style="text-align: left">
            <% if (b.getFile1() != null && !b.getFile1().trim().equals("")) {%>
            <a href="file/<%=b.getFile1()%>" style="text-decoration: none">@</a>
            <% } else { %> &nbsp;&nbsp;&nbsp; <% } %>

            <%-- 답글의 level 만큼 들여쓰기 --%>
            <% if (b.getGrpstep() > 0) {
                for (int i = 1; i < b.getGrpstep(); i++) { %>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <% } %> └
            <% } %>
            <a href="info.jsp?num=<%=b.getNum()%>"><%=b.getSubject()%></a>
        </td>
        <td><%=b.getName()%></td>
        <td>
            <% if (today.equals(sf.format(b.getRegdate()))) { %>
            <%=todayf.format(b.getRegdate())%>
            <% } else { %><%=otherf.format(b.getRegdate())%> <% } %>
        </td>
        <td><%=b.getReadcnt()%></td>
    </tr>
    <%}%>
    <tr>
        <td colspan="5"><%-- 페이지 처리하기 --%>
            <% if (pageNum <= 1){%>[이전] <% } else { %>
            <a href="list.jsp?pageNum=<%=pageNum - 1%>">[이전]</a><% } %>
            <% for (int a = startPage; a<=endPage; a++){%>
                <% if (a==pageNum) { %> [<%=a%>]<%} else { %>
                    <a href="list.jsp?pageNum=<%=a%>">[<%=a%>]</a>
                <% }
            } %>
           <% if (pageNum >= maxPage) { %>[다음] <% } else { %>
            <a href="list.jsp?pageNum=<%=pageNum + 1%>">[다음]</a>
            <% } %>
        </td>
    </tr>
    <%}%>
    <tr>
        <td colspan="5" style="text-align: right">
            <a href="writeForm.jsp">[글쓰기]</a>
        </td>
    </tr>
</table>
</body>
</html>