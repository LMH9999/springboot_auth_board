<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글수정</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h1>글수정</h1><br>

    <input type="hidden" name="id" value="${board.id}">
    <input type="hidden" id="writer" value="${board.email}">
    <div class="form-group">
        <label for="title">제목</label>
        <input type="text" class="form-control" id="title" value="${board.title}">
    </div>
    <div class="form-group">
        <label for="contents">내용</label>
        <textarea class="form-control" id="contents" cols="30" rows="10">${board.contents}</textarea>
    </div>
    <input type="hidden" id="hits" value="${board.hits}">
    <br>
    <input type="button" class="btn btn-primary"  value="글수정" onclick="update()">
    <button class="btn btn-danger" onclick="location.href='/board/${board.id}/${page}'">취소</button>
</div>
<script>
    const update = () => {
        validationCheck()

        const boardUpdateRequestObj = {
            id : '${board.id}',
            title : $('#title').val(),
            contents : $('#contents').val()
        }
        console.log(boardUpdateRequestObj);

        $.ajax({
            type: 'put',
            url: '/board/update',
            data: JSON.stringify(boardUpdateRequestObj),
            contentType: 'application/json; charset=utf-8',
            success: function (res){
                console.log(res)
                location.href = '/board/${board.id}'
            },
            error: function (err){
                console.log(err)
            }
        })
    }
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
