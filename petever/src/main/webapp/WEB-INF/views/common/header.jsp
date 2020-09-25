<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>main::</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/base.css">
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
    <script>
		
    </script>
</head>


<body>
    <header>
        <div class="main-bar">
            <ul>
            <c:if test="${ empty loginUser }">
                <li><a href="${ pageContext.request.contextPath }/user/login.do">로그인</li>
                &nbsp;
                <li><a href="${ pageContext.request.contextPath }/user/signup.do">회원가입</li>
                </c:if>
                <c:if test="${not empty loginUser}">
                <a href="#">${loginUser.userId }</a>님, 환영합니다!
                &nbsp;
                
                  <li><a href="${ pageContext.request.contextPath }/user/signup.do">로그아웃</li>
                
                </c:if>
                <li><a href="${ pageContext.request.contextPath }/user/user.do">마이페이지</li>
                <li>고객센터</li>
            </ul>
        </div>
    </header>
    <div class="menu main-bar">
        <ul>
            <div class="logo"></div>
            <li>사이트소개</li>
            <li><a href="${ pageContext.request.contextPath }/animalboard">유기동물</a></li>
            <li><a href="${ pageContext.request.contextPath }/shelterBoard/shelterBoard.do">보호소동물</a></li>
            <li>입양후기</li>
            <li>인식표</li>
            <li><a href=""></a>보호소</li>
            <li><a href="${ pageContext.request.contextPath }/statis/statis.do">통계</a></li>
        </ul>
    </div>