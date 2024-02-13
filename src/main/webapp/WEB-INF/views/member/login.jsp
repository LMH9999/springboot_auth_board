<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container mt-5">
    <h2>로그인 화면</h2>

    <form>
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="text" class="form-control" id="email" placeholder="이메일을 입력하세요">
        </div>

        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요">
        </div>

        <button type="button" class="btn btn-primary" id="login-btn">로그인</button>
    </form>
</div>

    <script>
        document.getElementById('login-btn').addEventListener('click',function (){
            const memberLoginRequestObj = {
                email : $('#email').val(),
                password : $('#password').val()
            }
            console.log(memberLoginRequestObj);

            $.ajax({
                type: 'post',
                url: '/member/login',
                data: JSON.stringify(memberLoginRequestObj),
                contentType: 'application/json; charset=utf-8',
                success: function (res){
                    console.log(res)
                    location.href = '/'
                },
                error: function (err){
                    console.log(err)
                    alert("이메일이나 비밀번호가 잘못되었습니다.")
                }
            })
        })
    </script>
</body>
</html>
