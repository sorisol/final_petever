<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css">
</head>
<body>
	<div class="report">
        <h3>신고하기</h3>
    </div>
    <p><span>· 제목</span> : [${animal.aniBoTag}] ${animal.aniBoTitle}</p>
    <p><span>· 글쓴이</span> : ${animal.userId}</p>
    <hr width="485px" style="margin-left: 15px; height: 1px;border:none;background-color: #cac7c7;">
    <p style="font-size: 16px;">· 사유작성</p>
    <textarea name="repContent" id="repContent" cols="65" rows="10" required></textarea>
    <br>
    <div class="btn">
   		<input type="button" value="신고하기" id="submit-btn">
        <input type="button" value="취소" onclick="window.close();">
    </div>
<script>
$(function() {
	<c:if test="${doUser == null || doUser == ''}">
		alert("로그인 후 이용해주세요.");
		window.close();
	</c:if>
	<c:if test="${not empty rep}">
		alert("이미 신고처리된 게시물입니다.");
		window.close();
	</c:if>
});
$("#submit-btn").on("click", function() {
	var rep = {
		aniBoId: ${animal.aniBoId},
		userId: '${animal.userId}',
		repContent: $("#repContent").val(),
		repDoUser: '${doUser}'
	};
	console.log(rep);
	var jsonStr = JSON.stringify(rep);
	$.ajax({
		url: "${pageContext.request.contextPath}/animalboard/report",
		data: jsonStr, //controller의 @RequestBody가 처리함
		contentType: "application/json; charset=utf-8", //json전송시 필수
		method: "post",
		success: function(data) {
			alert(data.msg);
			window.close();
		},
		error: function(xhr, status, err) {
			console.log("처리실패", xhr, status, err);
		}
	});
});
</script>
</body>
</html>