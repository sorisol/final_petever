<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <section>
        <div class="login">
            <form action="${pageContext.request.contextPath}/user/mailPwdChange.do" method="POST" id="deleteFrm">
               	<div class="login-body">
	                <input type="hidden" name="userId" id="userId" value="${ userId }">
	                <input type="hidden" name="sigNo" id="sigNo" value="${ sigNo }">
	                
	                <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호">
	                <input type="password" name="userPwd2" id="userPwd2" placeholder="비밀번호">
	                <button type="button" id="pwdSubmit">PASSWORD 변경</button>
                </div>
            </form>
        </div>
    </section>
<script>
$(function() {
	$("#pwdSubmit").click(function() {
		var pwd1 = $("#userPwd").val();
		var pwd2 = $("#userPwd2").val();
		if(pwd1 != pwd2) {
			alert("PASSWORD를 다시 확인해주세요.");
			return false;
		}
		$("#deleteFrm").submit();
	});
});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>