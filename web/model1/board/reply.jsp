<%@ page import="model.BoardDAO" %>
<%@ page import="model.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    1. 파라미터 값을 Board 객체에 저장하기 => useBean 태그 사용.
        원글정보 : num, grp, grplevel, grpstep
        답글정보 : name, pass, subject, content => 등록정보

    2. 같은 grp 삾을 사용하는 게시물들의 grpstep 값을 1 증가시키기.
        void BoardDAO.grpStepAdd(grp, grpstep)

    3. Board 객체를 db에 insert 하기.
       num : maxnum + 1
       grp : 원글과 동일.
       grplevel : 원글 + 1
       grpstop : 원글 + 1

    4. 등록성공시 : "답변등록 완료" 메세지 출력 후, list.jsp로 페이지 이동.
       등록 실패시 : "답변등록시 오류 발생" 메세지 출력 후 , replyForm.jsp로 페이지 이동.
--%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="board" class="model.Board"/>
<jsp:setProperty name="board" property="*"/>

<%--
    board 객체 파라미터 정보
        num : 원글의 num 정보
        grp : 원글의 grp 정보
        grplevel : 원글의 grplevel 정보
        grpstep : 원글의 grpstep 정보

        name : 입려된 글쓴이 정보
        pass : 입력된 비밀번호 정보
        subject : 입력된 제목 정보
        content : 입력된 내용정보
--%>
<%
    BoardDAO dao = new BoardDAO();

    dao.grpStepAdd(board.getGrp(),board.getGrpstep());
    int grplevel = board.getGrplevel();
    int grpstep = board.getGrpstep();
    int num = dao.maxnum(); //최대 num 값 조회

    String msg = "답변 등록시 오류 발생";
    String url = "replyForm.jsp?num="+board.getNum();
    board.setNum(++num);    //답변글의 num 값. grp 값은 원글과 동일
    board.setGrplevel(grplevel + 1); //원글 +1
    board.setGrpstep(grpstep + 1); //원글 +1
    if (dao.insert(board)){
        msg = "답변등록 완료";
        url = "list.jsp";
    }
%>
<script>
    alert("<%=msg%>")
    location.href="<%=url%>";
</script>
