<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shelterAnimal.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<script>

$(function () {
    

    
});

</script>

    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>유기동물 게시판</h1>
            <p>남은 겨울이 라이너 별 어머니, 불러 덮어 이름과, 까닭입니다.</p>
            <div class="content">
                <div class="border">
                    <table class="preference">
                        
                    </table>
                    <hr style="height: 1px; border:none; background-color: #373b44; width: 860px; margin: 35px 50px;">

                    <div class="post-wrap">
                    	<c:forEach items="${ shelterBoardList }" var="sbl">
                    		<div class="post">
                    			<img src="${ sbl.popfile }" alt="" />
                    			<br />
                    			<p>종류 : <b>${ sbl.kindCd }</b></p>
                    			<p>지역 : <b>${ sbl.orgNm }</b></p>
                    			<p>나이 : <b>${ sbl.age }</b></p>
                    			<button id="ani-search-detail" onclick="shelterAnidetail('${ sbl.desertionNo }')">조회</button>
                    			<hr />
                    			<span>공고번호 : ${ sbl.noticeNo }</span>
                    		</div>
                    	</c:forEach>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>