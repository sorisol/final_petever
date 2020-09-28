<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>base::</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/footer.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <style>
        .main {
            width: 1440px;
            height: 716px;
            background: url("img/sub1.jpg") no-repeat center;
            background-size: 1440px;
            margin: 0 auto;
        }

        
    </style>
</head>

<body>
 
    <div class="menu main-bar">
        <ul>
            <div class="logo"></div>
            <li>사이트소개</li>
            <li>유실유기동물</li>
            <li>임시보호처</li>
            <li>입양후기</li>
            <li>인식표</li>
            <li>보호소</li>
            <li>통계</li>
        </ul>
    </div>
    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>입양하기</h1>
            <p>펫에버에서는 이러한 일들을 합니다.</p>
            <div class="content">
                <!-- 여기서 부터 작성 !-->
            </div>
        </section>


</html>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>