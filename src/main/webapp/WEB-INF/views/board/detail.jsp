<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 상세보기</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
    <h1>게시글 상세보기</h1> <br>

<table>
    <tr>
        <th>title</th>
        <td>${board.title}</td>
    </tr>
    <tr>
        <th>writer</th>
        <td>${board.email}</td>
    </tr>
    <tr>
        <th>date</th>
        <td>${board.createdTime}</td>
    </tr>
    <tr>
        <th>hits</th>
        <td>${board.hits}</td>
    </tr>
    <tr>
        <th>contents</th>
        <td>${board.contents}</td>
    </tr>
</table>
    <br>
<button onclick="listReq()">목록</button>
<button onclick="updateReq()">수정</button>
<button onclick="deleteReq()">삭제</button>


<script>
    const listReq = () => {
        console.log('목록 요청')
        location.href = '/board/?page=${page}'
    }
    const updateReq = () => {
        console.log('수정 요청')
        const id = '${board.id}'
        location.href = '/board/update/' + id
    }
    const deleteReq = () => {
        console.log("삭제 요청")
        const id = '${board.id}'

        $.ajax({
            type: 'delete',
            url: '/board/delete',
            data: {
                'id': id
            },
            success: function (res){
                console.log(res)
                location.href = '/board'
            },
            error: function (err){
                console.log(err)
            }
        })
    }
</script>
</body>
</html>
