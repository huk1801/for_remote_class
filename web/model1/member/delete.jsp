<%@ page import="model.Member" %>
<%@ page import="model.MemberDAO" %><%--
  /web/model1/member/delete.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String login = (String) session.getAttribute("login");
    MemberDAO dao = new MemberDAO();
    Member loginMember = null;
    if (login.equals("admin")) // 관리자 로그인
        loginMember = dao.selectOne(login);
    else //일반사용자 로그인
        loginMember = dao.selectOne(id);
    String msg = null; // 메시지
    String url = null; // 이동할 주소
    if (login == null) {
        msg = "로그인 하세요";
        url = "loginForm.jsp";
    } else if (!login.equals("admin") && !id.equals(login)) {
        msg = "본인만 탈퇴 가능합니다.";
        url = "main.jsp";
    } else if (id.equals("admin")) {
        msg = "탈퇴 불가";
        url = "list.jsp";
    } else if (!(loginMember.getPass().equals(pass))) { //비밀번호 검증 시작. 로그인이랑 id값이 다를수 있음
        msg = "비밀번호가 틀림";
        url = "deleteForm.jsp?id=" + id; //삭제할 id값 유지
    } else {
        int result = dao.delete(id);
        if (result > 0) { //탈퇴 성공
            msg = "삭제 성공";
            if (login.equals("admin"))
                url = "list.jsp";
            else
                url = "logout.jsp";
        } else { //탈퇴 실패한 경우
            if (login.equals("admin")) {
                msg = "삭제 실패";
                url = "list.jsp";
            } else {
                msg = "탈퇴 실패";
                url = "info.jsp";
            }
        }
    }
%>
<script>
    alert("<%=msg%>");
    location.href = "<%=url%>";
</script>