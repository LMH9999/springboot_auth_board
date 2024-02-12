<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
    <h1>게시판</h1>
    <a href="/board/save">글작성</a>

    <div>
        <table>
            <tr>
                <th>id</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>게시일</th>
                <th>조회수</th>
            </tr>
            <c:forEach items="${boardList}" var="board">
            <tr>
                    <td>${board.id}</td>
                    <td><a href="/board/${board.id}/${paging.page}">${board.title}</a></td>
                    <td>${board.email}</td>
                    <td>${board.updatedTime}</td>
                    <td>${board.hits}</td>
            </tr>
            </c:forEach>
        </table>
    </div>
    <div>
        <c:choose>
            <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
            <c:when test="${paging.page<=1}">
                <span>[이전]</span>
            </c:when>
            <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
            <c:otherwise>
                <a href="/board/?page=${paging.page-1}">[이전]</a>
            </c:otherwise>
        </c:choose>

        <%--  for(int i=startPage; i<=endPage; i++)      --%>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                <c:when test="${i eq paging.page}">
                    <span>${i}</span>
                </c:when>

                <c:otherwise>
                    <a href="/board/?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <span>[다음]</span>
            </c:when>
            <c:otherwise>
                <a href="/board/?page=${paging.page+1}">[다음]</a>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
