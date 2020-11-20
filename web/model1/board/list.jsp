<%@ page import="model.BoardDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Board" %><%--
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
    int maxPage = (int)((double)boardCount/limit + 0.95);
    int startPage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
    int endPage = startPage + 9;
    if (endPage > maxPage) endPage = maxPage;
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
        <td><%=b.getNum()%></td>
        <td style="text-align: left">
            <a href="info.jsp?num=<%=b.getNum()%>"><%=b.getSubject()%></a>
        </td>
        <td><%=b.getName()%></td>
        <td><%=b.getRegdate()%></td>
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