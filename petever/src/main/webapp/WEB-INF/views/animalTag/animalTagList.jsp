<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animalTagList.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Sunflower:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<script>
$(function(){
	
	$(".ani-info-tag1").each(function () {
		var $color = $(this).attr('value');

        if ($color == 'silver') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/aniTag_silver_3.png)');
        } else if ($color == 'gold') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/aniTag_gold_3.png)');
        } else if ($color == 'rosegold') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/aniTag_rosegold_3.png)');
        }
    });

	$(".ani-info-tag2").each(function () {
		var $color = $(this).attr('value');

        if ($color == 'silver') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/aniTag_silver_3.png)');
        } else if ($color == 'gold') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/aniTag_gold_3.png)');
        } else if ($color == 'rosegold') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/aniTag_rosegold_3.png)');
        }
    });

    $(".aniaml-tag-img").each(function() {
    	var $kind = $(this).attr('value');
        
		if($kind == '포메라니안'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/ani_pome.png)');
		} else if($kind == '진돗개'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/ani_jindo.png)');
		} else if($kind == '시바견'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/ani_siba.png)');
		} else if($kind == '리트리버'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/ani_retriver.png)');
		} else if($kind == '말티즈'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/ani_maitese.png)');
		} else if($kind == '보더콜리'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/ani_borderCollie.png)');
		} else if($kind == '불독'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/ani_bulldog.png)');
		} else if($kind == '비숑프리제'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/ani_bichon.png)');
		} else if($kind == '시츄'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/ani_shihTzu.png)');
		} else if($kind == '웰시코기'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/ani_welshCorgi.png)');
		} else if($kind == '요크셔테리어'){
    		$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/ani_yorkie.png)');
		} else if($kind == '치와와'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/ani_chihuahua.png)');
		} else if($kind == '푸들'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag/ani_pudel.png)');
		} 
    });

     $(".animal-tag-font").each(function() {
          var $font = $(this).attr('value');
          console.log($font);
          $(this).attr('style', 'font-family : '+ $font +'!important'); 
     });

	
});

	    
</script>
    <div id="main-wrap">
        <section class="main"></section>
        <section class="content-wrap">
            <h1>동물 인식표(결제내역)</h1>
            <p>원하는 데로 인식표를 커스텀 마이징 할 수 있습니다.</p>
            <div class="content">
                        <div class="sub-bar">
		        <ul>
		            <li><a href="${ pageContext.request.contextPath }/animalTag/animalTag.do">인식표</a></li>
		            <li style="border-left: 1px solid black;"><a href="${ pageContext.request.contextPath }/animalTag/animalTagList.do?userId=${ loginUser.userId }">결제내역</a></li>
		        </ul>
		    </div>
            	<c:forEach items="${ list }" var="list">
	                <div class="tag-wrap">
	                    <div class="animal-tag-preview">
	                    	<div class="ani-tag-front">
		                        <div class="ani-info-tag1" value="${ list.tagColor }">
		                        	<div class="aniaml-tag-img" id="ani-kind-${ list.tagAniKind }" value="${ list.tagAniKind }" ></div><br />
		                        	<label class="animal-tag-font" id="preview-name" value="${ list.tagFont }" for="">${ list.tagAniName }</label>
		                        </div>
	                        <label class="preview-label preview-front" for="">앞면</label>
	                    	</div>
	                    	<div class="ani-tag-front">
		                        <div class="ani-info-tag2" value="${ list.tagColor }">
		                            <label class="animal-tag-font" id="preview-ssn" value="${ list.tagFont }" for="">${ list.tagAniSsn }</label><br>
		                            <label class="animal-tag-font" id="preview-person-name" value="${ list.tagFont }" for="">${ list.tagPersonName }</label><br>
		                            <label class="animal-tag-font" id="preview-person-phone" value="${ list.tagFont }" for="">${ list.tagPersonPhone }</label><br>
		                        </div>
		                        <label class="preview-label preview-back" for="">뒷면</label>
	                    	</div>
		                    <div class="ani-tag-ssg">
		                    	<label class="ani-ssg1">수령인: </label><label class="ani-ssg2">${ list.ssgName }</label>
		                    	<label class="ani-ssg1">연락처: </label><label class="ani-ssg2">${ list.ssgTel }</label>
		                    	<label class="ani-ssg1">수령지: </label><label class="ani-ssg2"style="margin-bottom: 0px;">(${ list.ssgAddr0 }) ${ list.ssgAddr1 }</label>
		                    	<label class="ani-ssg1"></label><label class="ani-ssg2" style="margin: 0px;">${ list.ssgAddr2 }</label>
		                    	<fmt:parseDate value="${ list.buyDate }" pattern="yyyy-MM-dd HH:mm:ss" var="buyDate"/><br />
		                    	<label class="ani-ssg1">결제일시: </label><label class="ani-ssg2"><fmt:formatDate value="${ buyDate }" pattern="yyyy-MM-dd HH:mm"/></label>
		                    </div>
		                    
	                    </div>
	                </div>
            	</c:forEach>
                <div class="pageBar">
                    ${ pageBar }
                </div>
            </div>
        </section>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>