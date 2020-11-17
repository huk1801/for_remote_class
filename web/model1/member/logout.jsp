<%--
  /web/model1/member/logout.jsp
  // 1. session 로그인 정보 제거
  // 2. loginForm.jsp 페이지 이동

  1. session 로그인 정보 제거
  2. "로그아웃하셨습니다." 메세지 출력 후
    loginForm.jsp 페이지 이동


--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate(); // 기존의 session 만료, 새로운 session 변경
//    response.sendRedirect("loginForm.jsp");
%>
<script>
    alert("로그아웃하셨습니다.");
    location.href = "loginForm.jsp";
</script>
