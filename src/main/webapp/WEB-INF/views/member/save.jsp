<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
    <h1>회원가입 폼</h1>

    <form>
        <div class="form-group">
            <label for="email">이메일:</label>
            <input type="text" class="form-control" id="email" placeholder="이메일을 입력하세요">
        </div>

        <div class="form-group">
            <label for="password">비밀번호:</label>
            <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요">
        </div>

        <div class="form-group">
            <label for="name">이름:</label>
            <input type="text" class="form-control" id="name" placeholder="이름을 입력하세요">
        </div>

        <button type="button" class="btn btn-primary" id="save-btn">회원가입</button>
    </form>
</div>

<script>
    document.getElementById('save-btn').addEventListener('click',function (){
        const memberSaveRequestObj = {
            email : $('#email').val(),
            password : $('#password').val(),
            name : $('#name').val()
        }
        console.log(memberSaveRequestObj);

        $.ajax({
            type: 'post',
            url: '/member/save',
            data: JSON.stringify(memberSaveRequestObj),
            contentType: 'application/json; charset=utf-8',
            success: function (res){
                console.log(res)
                location.href = '/member/login'
            },
            error: function (err){
                console.log(err)
            }
        })
    })
</script>
</body>
</html>
