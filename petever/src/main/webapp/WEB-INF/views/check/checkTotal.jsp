<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/check.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<style>
	#con{
		width:1140px;
		height:690px;
	    padding:0;
	    margin:80px auto 0;
	}
	.thar-three {
	    font-size: 24px;
	    font-weight: bold;
	    text-decoration: none;
	    text-align: center;
	    background-color: white;
	    cursor: pointer;
		display: block;
		position: relative;
		border: 2px solid white;
		transition: all 0.4s cubic-bezier(0.42, 0, 0.58, 1);
	}
	a.animated-button.thar-three:hover {
		color: white !important;
		background-color: transparent;
		text-shadow: nthree;
	}
	a.animated-button.thar-three:hover:before {
		left: 0%;
		right: auto;
		width: 100%;
	}
	a.animated-button.thar-three:before {
		display: block;
		position: absolute;
		top: 0px;
		right: 0px;
		height: 100%;
		width: 0px;
		z-index: -1;
		content: '';
		background: #d7dcf0;
		transition: all 0.4s cubic-bezier(0.42, 0, 0.58, 1);
		color: white !important;
	}
</style>
<body id="total">
<c:if test="${total >=80 }">
	<style>
		#total{
			background-color:#d7dcf0 !important;
		}
		#con{
			background:url('${pageContext.request.contextPath }/resources/images/100.png');
			background-size: 100%;
		    background-repeat: no-repeat;
		    background-position: top center;
		    background-color: white;
		}
		.thar-three{
		    width: 200px;
		    height: 45px;
		    top:345px;
		    left:450px;
		    color: #d7dcf0;
		}
		.score{
			width: 410px;
		    position: relative;
		    top: 220px;
		    left: 344px;
		    font-size: 60px;
		    text-align: center;
		}
	</style>
</c:if>
<c:if test="${total < 80 && total >= 60}">
	<style>
		#total{
			background-color:#b0dcff !important;
		}
		#con{
			background:url('${pageContext.request.contextPath }/resources/images/80.png');
			background-size: 100%;
		    background-repeat: no-repeat;
		    background-position: top center;
		    background-color: white;
		}
		.score{
			width: 410px;
		    position: relative;
		    top: 50px;
		    left: 344px;
		    font-size: 60px;
		    text-align: center;
		}
		.thar-three {
		    width: 150px;
		    height: 45px;
		    top: 160px;
		    left: 468px;
		    color: #b0dcff;
		}
	</style>
</c:if>
<c:if test="${total < 60}">
	<style>
		#total{
			background-color:#398dff !important;
		}		
		#con{
			background:url('${pageContext.request.contextPath }/resources/images/0.png');
			background-size: 100%;
		    background-repeat: no-repeat;
		    background-position: top center;
		    background-color: white;
		}
		.score{
			width: 410px;
		    position: relative;
		    top: 100px;
		    margin:0 auto;
		    font-size: 60px;
		    text-align: center;
		}
		.thar-three {
		    width: 400px;
		    height: 45px;
		    top: 525px;
		    margin:0 auto;
		    color: #398dff;
		}
	</style>
</c:if>
	<div id="con">
		<div class="score">${total }점</div>
		<a href="${pageContext.request.contextPath }/index.jsp" class="animated-button thar-three">Home ></a>
	</div>
</body>
</html>
	