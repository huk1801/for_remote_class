<%@ page import="model.MemberDAO" %><%--
  /web/model1/member/join.jsp
  1. 파라미터 정보를 Member 객체에 저장 => useBean 액션태그
        model.Member
  2. Member 객체 정보를 db에 추가. member 테이블 데이터 저장
  3. 가입성공 : loginForm.jsp 페이지 이동
     가입실패 : joinForm.jsp 페이지 이동
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="model.Member"/>
<%-- 파라미터와 Member 객체의 프로퍼티가 같은 경우 setProperty를 이용하여
     Member 객체에 파라미터 값이 저장됨. --%>
<jsp:setProperty name="member" property="*"/>
<%
    MemberDAO dao = new MemberDAO();
    // insert 구문이성공시 양수값 리턴.
    int result = dao.insert(member);
    String msg = "회원가입 실패";
    String url = "joinForm.jsp";
    if(result > 0) {
        msg = member.getName() + "님 회원가입 완료";
        url = "loginForm.jsp";
    }
%>
<script type="text/javascript">
    alert("<%=msg%>")
    location.href = "<%=url%>";
</script>