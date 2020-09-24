<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>



    <section>
        <div class="logo"></div>
        <div class="signup">
            <form id="userSignupFrm" action="signup.do" method="post">>
                <label for="">아이디 <span class="id-check">중복확인</span></label>
                <input type="text" name="userId" id="" placeholder="4자리 이상">
                <label for="">비밀번호</label>
                <input type="password" name="password" id="" placeholder="4자리 이상">
                 <label for="">이메일</label>
                <input type="text" name="email" id="">
                <label for="">생년월일</label>
                <input type="date" name="birthDay" id="">     
                <label for="">전화번호</label>
                <input type="tel" name="phone" id="">
                <label for="">주소</label>
                <input type="text" name="address" id="addr">
                <button class="addr-search">검색</button> -->
                <input type="submit" value="회원가입" onclick="button1_click();">
         
            </form>
        </div>
    </section>
  
    <script>
    $("#userSignupFrm").submit(function(){

        return true;

    });

    function button1_click() {
    	alert("회원가입이 완료되었습니다.");
    }
 
    </script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>