<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spring Boot Auth Board</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
    <h2>메인 페이지</h2>
    <c:if test="${login eq null}">
        <a href="/member/save">회원가입</a>
        <a href="/member/login">로그인</a>
    </c:if>
    <c:if test="${login ne null}">
        <button id="logout-btn" onclick="logout()">로그아웃</button>
    </c:if>

<script>
    function logout(){
        $.ajax({
            type: 'post',
            url: '/member/logout',
            success: function (res){
                console.log(res)
                location.href = '/'
            },
            error: function (err){
                console.log(err)
                console.log("로그아웃이 실패했습니다.")
            }
        })
    }
</script>
</body>
</html>
