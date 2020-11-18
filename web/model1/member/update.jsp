<%@ page import="model.MemberDAO" %>
<%@ page import="model.Member" %><%--
    /web/model1/member/update.jsp
    1. 모든 파라미터 정보를 Member 객체에 저장 => useBean 태그
    2. 입력된 비밀번호와, db에 저장된 비밀번호 비교
        관리자인 경우 관리자비밀번호로 비교하기.
        - 같지 않은 경우 : "비밀번호 오류" 메세지 출력 updateForm.jsp 페이지 이동
    3. 파라미터를 저장하고 있는 Member 객체를 이용하여 db 정보 수정.
        int MemberDAO.update(Member)
    결과가 0 이하면 수정실패 메세지 출력후, updateForm.jsp 페이지 이동
        1 이상이면 수정 성공    info.jsp 페이지 이동
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="member" class="model.Member"/>
<jsp:setProperty name="member" property="*"/>
<%
    MemberDAO dao = new MemberDAO();
    String login = (String) session.getAttribute("login");
    //비밀번호 검증을 위해 db 정보 조회
    Member dbmember = null;
    if(login.equals("admin")) // 관리자 로그인
        dbmember = dao.selectOne(login);
    else //일반사용자 로그인
        dbmember = dao.selectOne(member.getId());
    String msg = "비밀번호가 틀렸습니다.";
    String url = "updateForm.jsp?id=" + member.getId();
    if(member.getPass().equals(dbmember.getPass())) {
        int result = dao.update(member); //입력된 내용을 db에 수정
        if (result > 0) {
            msg = "수정성공";
            url = "info.jsp?id=" + member.getId();
        } else {
            msg = "수정실패";
        }
    }
%>
<script>
    alert("<%=msg%>")
    location.href="<%=url%>";
</script>