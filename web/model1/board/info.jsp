<%@ page import="model.BoardDAO" %>
<%@ page import="model.Board" %><%--
  Created by IntelliJ IDEA.
  User: GDJ30
  Date: 2020-11-20
  Time: 오후 4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
2. 게시판의 info.jsp 페이지 구현하기

1. num 파라미터 저장

2. num값의 게시물을 db에서 조회.

    Board BoardDao.selectOne(num)

3. num값의 게시물의 조회수 증가시키기

    void BoardDao.readcntAdd(num)

4. 조회된 게시물 화면에 출력.
--%>
<%
    int num = Integer.parseInt(request.getParameter("num"));
    BoardDAO dao = new BoardDAO();
    Board board = dao.selectOne(num);   //num에 해당하는 게시물 조회
    dao.readcntAdd(num);    //조회수 증가
%>
<html>
<head>
    <title>게시물 상세보기</title>
    <link rel="stylesheet" href="../../css/main.css">
    <style>
        td {text-align: left}
        th { width: 25%}
        #content {vertical-align: text-top; text-align: left; height: 250px}
        #option,#file {text-align: center}
    </style>
</head>
<body>
<table><caption>게시물 상세보기</caption>
    <tr>
        <th>글쓴이</th>
        <td><%=board.getName()%></td>
    </tr>
    <tr>
        <th>제목</th>
        <td><%=board.getName()%></td>
    </tr>
    <tr>
        <th>내용</th>
        <td id="content"><%=board.getContent()%></td>
    </tr>
    <tr>
        <th>첨부파일</th>
        <td id="file"><% if (board.getFile1()==null || board.getFile1().equals("")){%>
            &nbsp;
            <% } else { %>
            <a href="./file/<%=board.getFile1()%>"><%=board.getFile1()%></a>
            <% } %>
        </td>
    </tr>
    <tr>
        <td id="option" colspan="2">
            <a href="replyForm.jsp?num=<%=board.getNum()%>">[답변]</a>
            <a href="updateForm.jsp?num=<%=board.getNum()%>">[수정]</a>
            <a href="deleteForm.jsp?num=<%=board.getNum()%>">[삭제]</a>
            <a href="list.jsp">[목록]</a>
        </td>
    </tr>
</table>
</body>
</html>
