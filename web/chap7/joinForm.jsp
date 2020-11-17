<%--
  /web/chap7/joinForm.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="../css/main.css">
    <script type="text/javascript">
        function inputcheck(f) {
            if(isNaN(f.age.value)) {
                alert("나이는 숫자만 가능합니다.")
                f.age.value ="";
                f.age.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<%--
    입력된 내용을 join.jsp에 출력하기
        1. useBean, setProperty를 사용하기
        2. Bean 클래스의 이름은 chap7.Member로 하기
--%>
<form action="join.jsp" method="post" onsubmit="return inputcheck(this)">
    <table>
        <caption>회원가입</caption>
        <tr><td>아이디</td>
            <td><input type="text" name="id"></td>
        </tr>
        <tr><td>비밀번호</td>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr><td>이름</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr><td>성별</td>
            <td><input type="radio" name="gender" value="1" checked>남
            <input type="radio" name="gender" value="2">여</td>
        </tr>
        <tr><td>나이</td>
            <td><input type="text" name="age"></td>
        </tr>
        <tr><td>이메일</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr><td colspan="2"><input type="submit" value="회원가입"></td></tr>
    </table>
</form>
</body>
</html>
