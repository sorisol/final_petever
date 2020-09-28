<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
/*글쓰기버튼*/
input#btn-add{float:right; margin: 0 0 15px;}

tr[data-board-no] {
	cursor: pointer;
}
</style>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>base::</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/footer.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <style>
        .main {
            width: 1440px;
            height: 716px;
            background: url("img/sub1.jpg") no-repeat center;
            background-size: 1440px;
            margin: 0 auto;
        }

        
    </style>
</head>

<body>
 
    <div class="menu main-bar">
        <ul>
            <div class="logo"></div>
            <li>사이트소개</li>
            <li>유실유기동물</li>
            <li>임시보호처</li>
            <li>입양후기</li>
            <li>인식표</li>
            <li>보호소</li>
            <li>통계</li>
        </ul>
    </div>
    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>입양하기</h1>
            <p>펫에버에서는 이러한 일들을 합니다.</p>
            <div class="content">
                
<script>
function goBoardForm(){
	location.href = "${pageContext.request.contextPath}/board/boardForm.do";
}

$(function(){

	$("tr[data-board-no]").click(function(){
		var no = $(this).attr("data-board-no");
		location.href = "${ pageContext.request.contextPath }/board/boardDetail.do?no=" + no;
	});
	
});

</script>
<section id="board-container" class="container">
	<p>총 ${ totalContents }건의 게시물이 있습니다.</p>
	<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="goBoardForm();"/>
	<table id="tbl-board" class="table table-striped table-hover">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>첨부파일</th> <!-- 첨푸파일 있을 경우, /resources/images/file.png 표시 -->
			<th>조회수</th>
		</tr>
		<c:forEach items="${ list }" var="b">
		<tr data-board-no="${ b.no }">
			<td>${ b.no }</td>
			<td>${ b.title }</td>
			<td>${ b.memberId }</td>
			<td><fmt:formatDate value="${ b.regDate }" type="both"/></td>
			<td align="center">
				<c:if test="${ b.attachmentCount > 0 }">
					<img alt="첨부파일"
					 	 src="${ pageContext.request.contextPath }/resources/images/file.png"
						 width="16px">
				</c:if>
			</td>
			<td>${ b.readCount }</td>
		</tr>
		</c:forEach>
	</table>
</section> 
                
                
            </div>
        </section>


</html>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>