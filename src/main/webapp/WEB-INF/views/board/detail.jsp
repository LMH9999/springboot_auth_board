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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container mt-5">
    <h1>게시글 상세보기</h1> <br>

    <div class="d-flex justify-content-end mb-3">
        <button class="btn btn-primary" onclick="listReq()">목록</button>&nbsp;
        <button class="btn btn-warning" onclick="updateReq()">수정</button>&nbsp;
        <button class="btn btn-danger" onclick="deleteReq()">삭제</button>
    </div>
    <br>
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
</div>
<div>
<%--    <input type="text" id="writer" placeholder="작성자">--%>
    <input type="text" id="contents" placeholder="내용">
    <button id="comment-write-btn" onclick="commentWrite()">댓글작성</button>
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

    function validationCheck() {
        const writer = '${login}'
        const contents = $('#contents').val();

        if (!writer) {
            alert('댓글은 로그인 후 작성할 수 있습니다.');
            return false;
        }
        if (!contents) {
            alert('댓글 내용을 입력해주세요.');
            return false;
        }
        return true;
    }

    const commentWrite = () => {
        validationCheck()

        const commentSaveRequestObj = {
            writer : '${login}',
            contents :  $('#contents').val(),
            boardId : '${board.id}'
        }
        console.log(commentSaveRequestObj)

        $.ajax({
            type: 'post',
            url: '/comment/save',
            data: JSON.stringify(commentSaveRequestObj),
            contentType: 'application/json; charset=utf-8',
            success: function (res){
                console.log(res)
                console.log("댓글 작성 성공")
            },
            error: function (err){
                console.log(err)
                console.log("댓글 작성 실패")
            }
        })
    }
</script>
</body>
</html>
