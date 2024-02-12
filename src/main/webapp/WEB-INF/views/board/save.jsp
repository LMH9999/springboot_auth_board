<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글작성</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
    <h1>글작성</h1>
    <br>
    제목: <input type="text" id="title"> <br>
    내용: <textarea id="contents" cols="30" rows="10"></textarea> <br>
<%--    file: <input type="file" name="file"> <br>--%>
    <button id="save-btn">글작성</button>

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
