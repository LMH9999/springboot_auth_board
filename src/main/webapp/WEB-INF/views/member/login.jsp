<%--
  Created by IntelliJ IDEA.
  User: LMH
  Date: 2024-02-10
  Time: 오후 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
    <h2>로그인 화면</h2>
    <form action="/member/login" method="post">
        이메일: <input type="text" name="memberEmail"> <br>
        비밀번호: <input type="password" name="memberPassword"> <br>
        <input type="submit" value="로그인">
    </form>
</body>
</html>
