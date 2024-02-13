<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Spring Boot Auth Board</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container mt-3">
    <h2>메인 페이지</h2>
    <br>
    <c:if test="${login eq null}">
        <a class="btn btn-primary mr-2" href="/member/save">회원가입</a>
        <a class="btn btn-success" href="/member/login">로그인</a>
    </c:if>
    <c:if test="${login ne null}">
        <button class="btn btn-danger" id="logout-btn" onclick="logout()">로그아웃</button><br><br>
        <a class="btn btn-secondary" href="/board">게시판</a>
    </c:if>
</div>

<script>
    function logout() {
        $.ajax({
            type: 'post',
            url: '/member/logout',
            success: function (res) {
                console.log(res);
                location.href = '/';
            },
            error: function (err) {
                console.log(err);
                console.log("로그아웃이 실패했습니다.");
            }
        });
    }
</script>
</body>
</html>