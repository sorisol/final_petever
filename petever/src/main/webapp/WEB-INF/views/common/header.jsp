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
    <link rel="stylesheet" href="./resources/css/common.css">
    <link rel="stylesheet" href="./resources/css/header.css">
    <link rel="stylesheet" href="./resources/css/base.css">
    <script src="./resources/js/jquery-3.3.1.min.js"></script>
    <script>
		
    </script>
</head>


<body>
    <header>
        <div class="main-bar">
            <ul>
                <li>로그인</li>
                <li>회원가입</li>
                <li>마이페이지</li>
                <li>고객센터</li>
            </ul>
        </div>
    </header>
    <div class="menu main-bar">
        <ul>
            <div class="logo"></div>
            <li>사이트소개</li>
            <li><a href="${ pageContext.request.contextPath }/animalboard">유실유기동물</a></li>
            <li>임시보호처</li>
            <li>유기동물</li>
            <li><a href="${ pageContext.request.contextPath }/shelterBoard/shelterBoard.do">보호소동물</a></li>
            <li>입양후기</li>
            <li>인식표</li>
            <li>보호소</li>
            <li>통계</li>
        </ul>
    </div>