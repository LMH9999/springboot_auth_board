<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
    <h2>로그인 화면</h2>
    이메일: <input type="text" id="email"> <br>
    비밀번호: <input type="password" id="password"> <br>
    <button id="login-btn" >로그인</button>

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
