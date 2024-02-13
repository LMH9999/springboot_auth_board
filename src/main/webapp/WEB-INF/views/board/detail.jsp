<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 상세보기</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h1>게시글 상세보기</h1> <br>

    <table class="table">
        <tr>
            <th>제목</th>
            <td>${board.title}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.email}</td>
        </tr>
        <tr>
            <th>게시일</th>
            <td>${board.createdTime.toLocalDate()}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.hits}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td style="overflow: auto;height: 100px"><pre><c:out value="${board.contents}"/></pre></td>
        </tr>
    </table>
        <br>
    <div class="d-flex justify-content-center mb-3">
        <button class="btn btn-primary" onclick="listReq()">목록</button>&nbsp;
        <button class="btn btn-warning" onclick="updateReq()">수정</button>&nbsp;
        <button class="btn btn-danger" onclick="deleteReq()">삭제</button>
    </div>

</div>

<script>
    const listReq = () => {
        console.log('목록 요청')
        location.href = '/board/?page=${page}'
    }
    const updateReq = () => {
        console.log('수정 요청')
        const id = '${board.id}'
        const page = '${page}'
        location.href = '/board/update/' + id + '/' + page
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
