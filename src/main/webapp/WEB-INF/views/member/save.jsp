<%--
  Created by IntelliJ IDEA.
  User: LMH
  Date: 2024-02-10
  Time: 오후 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
    <h1>회원가입 폼</h1>

    이메일: <input type="text" id="email"> <br>
    비밀번호: <input type="password" id="password"> <br>
    이름: <input type="text" id="name"> <br>
    <button id="save-btn">회원가입</button>
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
                console.log(res,'aaa')

            },
            error: function (err){
                console.log(err,'bbb')
            }
        })
    })
</script>
</body>
</html>
