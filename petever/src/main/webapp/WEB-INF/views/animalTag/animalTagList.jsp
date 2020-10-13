<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animalTagList.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Sunflower:wght@500&display=swap" rel="stylesheet">
<script>
$(function(){
	$(".ani-info-tag1").each(function () {
		var $color = $(".ani-info-tag1").attr('value');
		console.log($(".ani-info-tag1").val());

        if ($color == 'silver') {
            $(".ani-info-tag1").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_silver_2.png)');
            $(".ani-info-tag2").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_silver_2.png)');
        } else if ($color == 'gold') {
            $(".ani-info-tag1").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_gold_2.png)');
            $(".ani-info-tag2").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_gold_2.png)');
        } else if ($color == 'rosegold') {
            $(".ani-info-tag1").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_rosegold_2.png)');
            $(".ani-info-tag2").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_rosegold_2.png)');
        }
    });

    $(".aniaml-tag-img").each(function() {
    	var $kind = $(".aniaml-tag-img").attr('value');
    	console.log($kind);
        
		if($kind == '포메라니안'){
			$(".aniaml-tag-img").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/ani_pome.png)');
		} else if($kind == '진돗개'){
			$(".aniaml-tag-img").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/ani_jindo.png)');
		} else if($kind == '시바견'){
			$(".aniaml-tag-img").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/ani_siba.png)');
		}
    });

	
});
	    
</script>
    <div id="main-wrap">
        <section class="main"></section>
        <section class="content-wrap">
            <h1>동물 인식표(결제내역)</h1>
            <p>펫에버에서는 이러한 일들을 합니다.</p>
            <div class="content">
            	<c:forEach items="${ list }" var="list">
	                <div class="tag-wrap">
	                    <div class="animal-tag-preview">
	                    	<div class="ani-tag-front">
		                        <div class="ani-info-tag1" value="${ list.tagColor }">
		                        	<div class="aniaml-tag-img" value="${ list.tagAniKind }" onload="color(${ list.tagAniKind })">${ list.tagAniKind }</div><br />
		                        	<script></script>
		                        	<label class="animal-tag-font" id="preview-name" for="">${ list.tagAniName }</label>
		                        </div>
	                        <label class="preview-label preview-front" for="">앞면</label>
	                    	</div>
	                    	<div class="ani-tag-front">
		                        <div class="ani-info-tag2">
		                            <label class="animal-tag-font" id="preview-ssn" for="">${ list.tagAniSsn }</label><br>
		                            <label class="animal-tag-font" id="preview-person-name" for="">${ list.tagPersonName }</label><br>
		                            <label class="animal-tag-font" id="preview-person-phone" for="">${ list.tagPersonPhone }</label><br>
		                        </div>
		                        <label class="preview-label preview-back" for="">뒷면</label>
	                    	</div>
	                    </div>
	                    <div>
	                    	<label for=""></label>
	                    </div>
	                </div>
            	</c:forEach>
               
                
                
            </div>
        </section>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>