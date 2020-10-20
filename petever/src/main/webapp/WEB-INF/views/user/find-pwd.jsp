<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petever 비밀번호 찾기</title>
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<style>
.content-wrap {
	padding: 10px;
}
.content-wrap p,label,input {
	text-align: center;
	margin-top: 20px;
}
.first {
	width: 412px;
    margin: 10px auto;
    text-align: center;
}
input[type=button] {
    width: 95px;
    height: 30px;
    border: 1px solid #FFDD93;
    background-color: #FFDD93;
    color: #373b44;
    font-weight: bold;
    border-radius: 30px;
}
input[type=tel] {
	width: 180px;
	margin: 0px 10px;
	height: 26px;
    padding: 0px 12px;
    border: 1px solid #ebecef;
    border-radius: 30px;
}
.second input[type=tel] {
	margin-top: 5px;
	margin-left: 130px;
}
.second input[type=button] {
	width: 50px;
	height: 26px;
}
</style>
</head>
<body>
	<div class="content-wrap">
		<p>아이디 찾기</p>
		<div class="first">
			<label for="userId">아이디</label>
			<input type="text" id="userId" />
			<br />
			<label for="userEmail">이메일</label>
			<input type="text" id="userEmail" />
			<br />
			<input type="button" value="확인" id="verification-check"/>
		</div>
		<div class="second"></div>
	</div>
<script>
 $("#verification-check").on("click", function(){
	
	var $userId = $("#userId").val();
	var $userEmail = $("#userEmail").val();
	//var $sigNo = new ObjectId().toString();
	
	console.log($userId);
	console.log($userEmail);
	
 	$.ajax({
		url: '${pageContext.request.contextPath}/user/selectSearchPwd.do',
		data: {
			userId: $userId,
			userEmail : $userEmail,
			//_id : ObjectId("507f191e810c19729de860ea")
		},
		method: 'post',
		success: function(data) {
			console.log(data);
			var html = '';
			if(data == null || data == '') {
				html += '<p>고객님의 정보와 일치하는 아이디가 없습니다.</p>';
			} else {
				html += '<p>고객님의 등록된 E-Mail로 비밀번호를 보냈습니다.</p>';
			}
			$(".second").html(html);
		}
	});
	
}); 
</script>
</body>
</html>