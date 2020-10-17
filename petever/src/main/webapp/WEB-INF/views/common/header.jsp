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
	    <%--RedirectAttributes에 등록된 msg값 존재여부 확인 후 출력 --%>
	    <c:if test="${not empty msg }">
	    	alert('${ msg }');
	    </c:if>
    </script>
    <script>
    function sendMessage(param){
        var url = "${pageContext.request.contextPath}/message/messageForm.do?receiveId=";
        var name = "popup test";
        var option = "width = 500, height = 500, top = 100, left = 200, location = no";
    	//var receiveId = param;
        
    	url += param;
    	
        window.open(url, name, option);

    }
    
    </script>
</head>


<body>
    <header>
        <div class="main-bar">
            <ul>
            <c:if test="${ empty loginUser }">
                <li><a href="${ pageContext.request.contextPath }/user/login.do">로그인</a></li>
                &nbsp;
                <li><a href="${ pageContext.request.contextPath }/user/signup.do">회원가입</a></li>
                </c:if>
                <c:if test="${not empty loginUser}">
                <a href="#">${loginUser.userId }</a>님, 환영합니다!
                &nbsp;
                
                 <li><a href="${ pageContext.request.contextPath }/user/logout.do">로그아웃</a></li>
                
                </c:if>
                <li><a href="${ pageContext.request.contextPath }/message/messageList.do">메세지</a></li>
                <li><a href="${ pageContext.request.contextPath }/user/userDetail.do">마이페이지</a></li>
                <li><a href="">고객센터</a></li>
                <li><a href="${ pageContext.request.contextPath }/admin/adminUser.do">관리자</a></li>
            </ul>
        </div>
    </header>
    <div class="menu main-bar">
        <ul>
            <li><a href="">사이트소개</a></li>
            <div class="logo" onclick="location.href='${ pageContext.request.contextPath }'">
            </div>
            <li><a href="${ pageContext.request.contextPath }/animalboard">유기동물</a></li>
            <li><a href="${ pageContext.request.contextPath }/shelterBoard/shelterBoard.do">보호소동물</a></li>
            <li><a href="${ pageContext.request.contextPath }/reviewBoard/reviewBoardPhoto.do">입양후기</a></li>
            <li><a href="${ pageContext.request.contextPath }/animalTag/animalTag.do">인식표</a></li>
            <li><a href="${ pageContext.request.contextPath }/shelter/shelterAnimalBoard.do">보호소</a></li>
<%--             <li><a href="${ pageContext.request.contextPath }/shelterInfoBoard/shelterInfoBoard.do">보호소</a></li> --%>
            <li><a href="${ pageContext.request.contextPath }/statis/statis.do">통계</a></li>
        </ul>
    </div>