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
            <label for="email">이메일</label>
            <input type="text" class="form-control" id="email" onblur="emailCheck()" placeholder="이메일을 입력하세요"><br>
            <span id="check-result"></span>
        </div>
        
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요"> <br>
        </div>

        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" class="form-control" id="name" placeholder="이름을 입력하세요">
        </div>
        <br>
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
<script>
    const emailCheck = () => {
        const email = $('#email').val()
        const checkResult = $('#check-result')
        console.log("입력값: ", email)

        $.ajax({
            type: 'post',
            url: '/member/email-check',
            data: {
                'email': email
            },
            success: function (res){
                console.log("요청성공",res)
                if (res == 'ok') {
                    console.log('사용 가능한 이메일')
                    checkResult.html('사용 가능한 이메일입니다.')
                    checkResult.css('color', 'green')
                } else {
                    console.log('이미 사용중인 이메일')
                    checkResult.html('이미 사용중인 이메일입니다.')
                    checkResult.css('color', 'red')
                }
            },
            error: function (err){
                console.log("에러발생",err)
            }
        })
    }
</script>
</body>
</html>
