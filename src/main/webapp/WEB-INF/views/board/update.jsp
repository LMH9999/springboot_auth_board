<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글수정</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
    <h1>글수정</h1><br>

    <input type="hidden" name="id" value="${board.id}">
    <input type="hidden" id="writer" value="${board.email}">
    제목: <input type="text" id="title" value="${board.title}"> <br>
    내용: <textarea id="contents" cols="30" rows="10">${board.contents}</textarea> <br>
    <input type="hidden" id="hits" value="${board.hits}">
    <br>
    <input type="button" value="글수정" onclick="update()">

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
