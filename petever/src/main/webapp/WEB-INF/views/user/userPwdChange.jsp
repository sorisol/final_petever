<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <section>
        <div class="login">
            <form action="${pageContext.request.contextPath}/user/mailPwdChange.do" method="POST">
               	<div class="login-body">
	                <input type="hidden" name="userId" id="userId" value="${ userId }">
	                <input type="hidden" name="sigNo" id="sigNo" value="${ sigNo }">
	                
	                <input type="password" name="userPwd" placeholder="비밀번호">
	                <input type="password" name="userPwd2" placeholder="비밀번호">
	                <button>PASSWORD 변경</button>
                </div>
            </form>
        </div>
    </section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>