<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>게시판</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
    <h1>게시판</h1> <br>
    <div class="d-flex justify-content-end mb-3">
        <a class="btn btn-primary" href="/board/save">글작성</a>
    </div>

    <div>
        <table class="table">
            <thead>
            <tr>
                <th>id</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>게시일</th>
                <th>조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${boardList}" var="board">
                <tr>
                    <td>${board.id}</td>
                    <td><a href="/board/${board.id}/${paging.page}">${board.title}</a></td>
                    <td>${board.email}</td>
                    <td>${board.createdTime.toLocalDate()}</td>
                    <td>${board.hits}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="d-flex justify-content-center">
        <c:choose>
            <c:when test="${paging.page <= 1}">
                <span class="btn btn-outline-secondary mr-2">[이전]</span>
            </c:when>
            <c:otherwise>
                <a class="btn btn-outline-secondary mr-2" href="/board/?page=${paging.page - 1}">[이전]</a>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <c:when test="${i eq paging.page}">
                    <span class="btn btn-secondary mr-2">${i}</span>
                </c:when>
                <c:otherwise>
                    <a class="btn btn-outline-secondary mr-2" href="/board/?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.page >= paging.maxPage}">
                <span class="btn btn-outline-secondary ml-2">[다음]</span>
            </c:when>
            <c:otherwise>
                <a class="btn btn-outline-secondary ml-2" href="/board/?page=${paging.page + 1}">[다음]</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>