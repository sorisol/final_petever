<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
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
	margin: 10px 50px;
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
		<p>회원정보에 등록한 전화 번호와 입력한 전화 번호가 같아야,<br /> 인증번호를 받을 수 있습니다.</p>
		<div class="first">
			<label for="userPhone">전화번호</label>
			<input type="tel" id="userPhone" />
			<input type="button" value="인증번호 받기" name="phoneNum" id="send-sms"/>
		</div>
		<div class="second">
			<input type="tel" placeholder="인증번호 6자리 숫자 입력" id="userInput"/>
			<input type="button" value="확인" id="verification-check"/>
		</div>
	</div>
<script>
var verificationCode;
$("#send-sms").on("click", function() {
	$.ajax({
		url: '${pageContext.request.contextPath}/user/sendMsg.do',
		data: {
			userPhone: $("#userPhone").val()
		},
		method: 'post',
		success: function(data) {
			alert(data.msg);
			console.log(data.verificationCode);
			verificationCode = data.verificationCode;
		}
	});
});
 $("#verification-check").on("click", function(){
	//console.log(verificationCode);
	var $input = $("#userInput").val();
	//console.log($input);
	if($input != verificationCode) {
		alert("인증번호가 일치하지 않습니다.");
	}
	else {
		$.ajax({
			url: '${pageContext.request.contextPath}/user/selectOneUser.do',
			data: {
				userPhone: $("#userPhone").val()
			},
			method: 'post',
			success: function(data) {
				//console.log(data);
				var html = '';
				if(data == null || data == '') {
					html += '<p>고객님의 정보와 일치하는 아이디가 없습니다.</p>';
				} else {
					html += '<p>고객님의 정보와 일치하는 아이디 목록입니다.</p>';
					for(var i in data) {
						html += '<input type="radio" value="'+data[i].userId+'" name="cuserId" />';
						html += '<label for="userId">'+data[i].userId+'</label></br>';
					}
					html += '<input type="button" value="로그인하기" id="login" onclick="moveLogin();" />'
				}
				$(".content-wrap").html(html);
			}
		});
	}
}); 
function moveLogin(){
	opener.document.getElementById("userId").value = $("input:radio[name='cuserId']:checked").val();;
	window.close();
}
</script>
</body>
</html>