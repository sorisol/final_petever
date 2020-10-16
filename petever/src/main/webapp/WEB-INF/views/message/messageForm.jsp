<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>message</title>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<style>
form .form-icons {
  text-align: center;
}
form .form-icons .input-group-field {
  border-color: #1779ba;
}

form .form-icons .fa {
  color: white;
  width: 1rem;
}

#msg-content {
	text-align: center;
}
</style>

</head>


	
	
<body>
	
	
<div id="message-main">

<form name="messageForm" id="messageForm" method = "post" 
		action = "${pageContext.request.contextPath}/message/insertmessage"
		enctype="multipart/form-data">

    <input type="hidden" name="userId" value="${loginUser.userId}" />
    <input type="hidden" name="receiveId" value="${receiveId}" />
	<div class="messageBoard">
	<h2>반갑습니다. 메세지 페이지입니다.</h2>
	<hr>
	<hr>
	</div>
	
    <div class="content">
      <span class="input-group-label">
        <i class="fa fa-user"></i>
      </span>
      
      <span  > ${receiveId} 님에게</span>
      
    <div id="msg-content">
      <br>
     <textarea id="msgContent" name="msgContent" rows="20" cols="50" required></textarea>
    </div>
    </div>

   
  <button class="button expanded" id="msgSubmitBtn">쪽지 보내기</button>
  <button class="button expanded" id="msgCloseBtn">닫기</button>
</form>

</div>
<script>
$("#msgSubmitBtn").click(function(){
	//컨텐츠 없으면 안보내지기
	var $userId = $("[name=loginUser.userId]").val();
	 
	//내용 유효성검사
	if( msgContent == ""  || msgContent == null || msgContent == '&nbsp;' || msgContent == '<p>&nbsp;</p>')  {
          alert("내용을 입력하세요.");
          return;
     }
		

	$("#boardFrm").submit();

})

$("#msgCloseBtn").click(function(){
	
	self.close();
	
	
})

</script>

	

</body>
</html>