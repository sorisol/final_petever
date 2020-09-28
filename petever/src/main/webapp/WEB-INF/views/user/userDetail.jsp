<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>




<body>
    <section>
        <div class="logo"></div>
        <div class="signup">
            <form action="">
                <label for="">아이디</label>
                <input type="text" class="form-control" name="userId" id=""  value="${loginUser.userId}" readonly required>
                <label for="">이메일</label>
                <input type="email" class="form-control" name="userEmail" id="email" value="${loginUser.userEmail}" required>
                <input type=text name="userPwd" id="" value="01058055778">
                <label for="">전화번호</label>
                <input type="tel" name="" id="" value="01058055778">
                <label for="">주소</label>
                <input type="text" name="" id="addr" value="강남구 역삼동">
                <button class="addr-search">검색</button>
                <button>회원정보수정</button>
            </form>
        </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>