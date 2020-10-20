<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <section>
        <div class="login">
              	<div class="login-body">
                <input type="text" name="userId" placeholder="아이디">
                <input type="text" name="userEmail" placeholder="E-Mail">
                <button id="verification-check">확인</button>
               </div>
               <div class="second"><p style="text-align: center;">최신 key가 아니므로 다시 진행해주세요.</p></div>
        </div>
    </section>
<script>
 $("#verification-check").on("click", function(){
	
	var $userId = $("[name=userId]").val();
	var $userEmail = $("[name=userEmail]").val();
	//var $sigNo = new ObjectId().toString();
	
	console.log($userId);
	console.log($userEmail);
	
 	$.ajax({
		url: '${pageContext.request.contextPath}/user/selectSearchPwd.do',
		data: {
			userId: $userId,
			userEmail : $userEmail,
		},
		method: 'post',
		success: function(data) {
			console.log(data);
			var html = '';
			if(data == null || data == '') {
				html += '<p style="text-align: center;">고객님의 정보와 일치하는 아이디가 없습니다.</p>';
			} else {
				html += '<p style="text-align: center;">고객님의 등록된 E-Mail로 비밀번호를 보냈습니다.</p>';
			}
			$(".second").html(html);
		}
	});
	
}); 

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>