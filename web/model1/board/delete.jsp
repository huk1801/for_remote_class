<%@ page import="model.BoardDAO" %>
<%@ page import="model.Board" %><%--
  Created by IntelliJ IDEA.
  User: Muro
  Date: 2020-11-23
  Time: 오후 5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    Board board = new Board();
    board.setNum(Integer.parseInt(request.getParameter("num")));
    board.setPass(request.getParameter("pass"));
    BoardDAO dao = new BoardDAO();
    Board dbBoard = dao.selectOne(board.getNum());

    String msg = "게시글의 비밀번호가 틀렸습니다.";
    String url = "deleteForm.jsp?num=" + board.getNum();

    if (board.getPass().equals(dbBoard.getPass())){
        if (dao.delete(board)) {
            msg = "게시물 삭제 완료";
            url = "list.jsp";
        } else {
            msg = "게시물 삭제 실패";
        }
    }

%>
<script>
    alert("<%=msg%>")
    location.href="<%=url%>";
</script>
