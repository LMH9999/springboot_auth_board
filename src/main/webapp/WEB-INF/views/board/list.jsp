<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
    <h1>게시판</h1>
    <a href="/board/save">글작성</a>

    <table>
        <tr>
            <th>id</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>게시일</th>
            <th>조회수</th>
        </tr>
        <c:forEach items="${boardList}" var="board" varStatus="loop">
        <tr>
                <td>${board.id}</td>
                <td><a href="/board/${board.id}">${board.title}</a></td>
                <td>${board.email}</td>
                <td>${board.updatedTime}</td>
                <td>${board.hits}</td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>
