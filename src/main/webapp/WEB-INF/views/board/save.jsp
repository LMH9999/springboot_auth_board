<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글작성</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h1>글작성</h1>
    <br>
    <div class="form-group">
        <label for="title">제목</label>
        <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요.">
    </div>
    <div class="form-group">
        <label for="contents">내용</label>
        <textarea class="form-control" id="contents" cols="30" rows="10" placeholder="내용을 입력해주세요."></textarea>
    </div>
    <button type="button" class="btn btn-primary" id="save-btn">글작성</button>
    <button class="btn btn-danger" onclick="location.href='/board'">취소</button>
</div>
<script>
    document.getElementById('save-btn').addEventListener('click',function (){
        validationCheck()

        const boardSaveRequestObj = {
            email : '${login}',
            title : $('#title').val(),
            contents : $('#contents').val()
        }
        console.log(boardSaveRequestObj);

        $.ajax({
            type: 'post',
            url: '/board/save',
            data: JSON.stringify(boardSaveRequestObj),
            contentType: 'application/json; charset=utf-8',
            success: function (res){
                console.log(res)
                location.href = '/board'
            },
            error: function (err){
                console.log(err)
            }
        })
    })
</script>
<script>
    function validationCheck() {
        const title = $('#title').val()
        const contents = $('#contents').val();

        if (!title) {
            alert('제목을 입력해주세요.');
            return false;
        }
        if (!contents) {
            alert('내용을 입력해주세요');
            return false;
        }
        return true;
    }
</script>
</body>
</html>
