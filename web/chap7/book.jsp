<%--
  /web/chap7/book.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>방명록 내용 보기</title>
    <link rel="stylesheet" href="../css/main.css">
    <% request.setCharacterEncoding("UTF-8"); %>
<%--
    chap7.Book book = new chap7.Book();
    request.setAttribute("book", book);
    scope 속성이 생략 된 경우 : page 영역임
    pageContext.setAttribute("book", book);
    앞에 jsp:로 붙은 거는 액션태그다.
--%>
    <jsp:useBean id="book" class="chap7.Book" />
<%--
    property="*": 파라미터 이름과 프로퍼티 이름이 같은 값을 book 객체에 저장함.
    book.setName(request.getParameter("name"))
    book.setTitle(request.getParameter("title"))
    book.setContent(request.getParameter("content"))
--%>
    <jsp:setProperty name="book" property="*"/>
<%--
    파라미터와 프로퍼티가 다른 경우
    book.setName(request.getParameter("writer"))
--%>
    <jsp:setProperty name="book" param="writer" property="name"/>
</head>
<body>
<table>
    <caption>방명록 조회</caption>
    <tr><td>작성자</td>
        <td><jsp:getProperty name="book" property="name"/>
        ,<%=book.getName()%></td>
    </tr>
    <tr><td>제목</td>
        <td><jsp:getProperty name="book" property="title"/>
        ,<%=book.getTitle()%></td>
    </tr>
    <tr><td>내용</td>
        <td><jsp:getProperty name="book" property="content"/>
        ,<%=book.getContent()%></td>
    </tr>
</table>
</body>
</html>
