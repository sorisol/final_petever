<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--한글 인코딩처리 --%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review-board-view.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick-theme.css"/>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
	    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>입양후기 디테일페이지입니다~~</h1>
            <div class="content">
                <div class="board-container">
                    <div class="board-header">
                    <span class="board-title">${reviewBoard.rewBoTitle}</span>
                    <br>
                    <span class="writer">${reviewBoard.userId}</span>
                        <div class="writer-menu">
                            <ul>
                                <li><a href="">쪽지보내기</a></li>
                            </ul>
                        </div>
                        
                        <span class="write-time">
                        	<fmt:parseDate value="${reviewBoard.rewBoRegDate}" var="rewBoRegDate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${regDate}" pattern="yyyy.MM.dd HH:mm"/>
                        </span>
                        <a href="#board-comment-container" class="header-comment-view">댓글 ${totalComment}</a>
                    </div>
                    <div class="pet-info">

                    </div>
                    <div class="board-content">
						${reviewBoard.rewBoContent }
                    </div>
                    

                    <div id="board-comment-container">
                        <div class="comment-header">
                            <span class="comment-view">댓글 ${totalComment}</span>
                            <a class="report-btn" onclick="javascript:openReport();">신고</a>
                        </div>
                        <c:if test="${ not empty commentList }">
                        	<c:forEach items="${commentList}" var="cl">
                        		<c:if test="${cl.aniCoLevel == 1 }">
			                        <div class="board-comment">
			                            <span class="id-box">${cl.userId}</span>
		                            	<c:if test="${not empty loginUser}">
		                            		<c:if test="${loginUser.userId eq cl.userId || loginUser.userId == 'admin'}">
			                           		 	<img class="icon" src="${pageContext.request.contextPath}/resources/images/icon.png"/>
					                            <div class="comment-menu">
						                            <ul>
						                                <li class="comment-edit" value="${cl.aniCoId}">수정</li>
						                                <li class="comment-delete" value="${cl.aniCoId}">삭제</li>
						                            </ul>
						                        </div>
			                            	</c:if>
			                            </c:if>
			                            <p>${cl.aniCoContent}</p>
			                            <span class="comment-time">
			                            	<fmt:parseDate value="${cl.aniCoDate}" var="aniCoDate" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${aniCoDate}" pattern="yyyy.MM.dd HH:mm"/>
			                            </span>
			                            
										<c:if test="${not empty loginUser}">
				                            <button type="button" class="reply-btn" value="${cl.aniCoId}">답글쓰기</button>
				                            <div class="comment-reply-write" style="display: none;"></div>
										</c:if>
			                        </div>
	                        	</c:if>
                        		<c:if test="${cl.aniCoLevel == 2}">
			                        <div class="board-comment-reply">
			                            <span class="id-box">&#8627; ${cl.userId}</span>
		                            	<c:if test="${not empty loginUser}">
				                            <img class="icon" src="${pageContext.request.contextPath}/resources/images/icon.png"/>
				                            <div class="comment-menu">
			                            		<c:if test="${loginUser.userId eq cl.userId || loginUser.userId == 'admin'}">
						                            <ul>
						                                <li class="comment-edit" value="${cl.aniCoId}">수정</li>
						                                <li class="comment-delete" value="${cl.aniCoId}">삭제</li>
						                            </ul>
				                            	</c:if>
					                        </div>
		                            	</c:if>
			                            <p>${cl.aniCoContent}</p>
			                            <span class="comment-time">
			                            	<fmt:parseDate value="${cl.aniCoDate}" var="aniCoDate" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${aniCoDate}" pattern="yyyy.MM.dd HH:mm"/>
										</span>
			                        </div>
	                        	</c:if>
                        	</c:forEach>
                        </c:if>
                    </div>
                    <c:if test="${not empty loginUser}">
	                    <div class="comment-write">
	                    	<form action="${pageContext.request.contextPath}/animalboard/insertComment" method="post">
		                        <input type="hidden" name="userId" value="${loginUser.userId}"/>
		                        <input type="hidden" name="aniCoLevel" value="1"/>
		                        <input type="hidden" name="aniBoId" value="${animalBoard.aniBoId}" />
		                        <input type="hidden" name="aniCoRef" value="0"/>
		                        <span>${loginUser.userId}</span>
		                        <textarea rows="1" class="comment_inbox_text" placeholder="댓글을 입력하세요" name="aniCoContent"
		                            onkeyup="xSize(this)"></textarea>
		                        <div class="btn-align">
		                            <button class="comment-reg-btn">등록</button>
		                        </div>
	                    	</form>
	                    </div>
                    </c:if>
                </div>
                <div class="btn-wrap">
	                <button type="button" class="board-list-btn" onclick="location.href='${pageContext.request.contextPath}/reviewBoard'">글 목록</button>
	                <c:if test="${loginUser.userId == animalBoard.userId || loginUser.userId == 'admin'}">
		                <button type="button" class="board-delete-btn">삭제</button>
		                <button type="button"class="board-edit-btn" onclick="location.href='${pageContext.request.contextPath}/animalboard/updateBoardFrm?no=${animalBoard.aniBoId}'">수정</button>
	                </c:if>
                </div>
            </div>
        </section>
    </div>
<script>
	$(".board-delete-btn").on("click", function() {
		if(!confirm("게시글을 삭제하시겠습니까?"))
			return;
		location.href="${pageContext.request.contextPath}/animalboard/deleteBoard?no="+${animalBoard.aniBoId};
	});
    function openReport() {
        window.open("${pageContext.request.contextPath}/animalboard/reportFrm?no=${animalBoard.aniBoId}&&doUser=${loginUser.userId}", "신고하기",
            "width=500, height=330, toolbar=no, menubar=no, scrollbars=no, resizable=yes, top=300, left=500");
    }

     //댓글입력창 자동 높이조절
     function xSize(e) {
         e.style.height = '1px';
         e.style.height = (e.scrollHeight) + 'px';
     }
        
     $(".reply-btn").on('click', function() {
    	 /* $(".comment-reply-write") */
    	 $(this).next().toggle();
         var reply = '<form action="${pageContext.request.contextPath}/animalboard/insertComment" method="post">';
         reply += '<input type="hidden" name="userId" value="${loginUser.userId}"/>';
         reply += '<input type="hidden" name="aniCoLevel" value="2"/>';
         reply += '<input type="hidden" name="aniBoId" value="${animalBoard.aniBoId}" />';
         reply += '<input type="hidden" name="aniCoRef" value="'+$(this).val()+'"/>';
         reply += '<span class="id-box">${loginUser.userId}</span>';
         reply += '<textarea rows="1" class="comment_inbox_text" placeholder="댓글을 입력하세요" onkeyup="xSize(this)" name="aniCoContent"></textarea>';
         reply += '<div class="btn-align">';
         reply += '<button type="button" class="comment-cancle-btn" onclick="cancleBtn(this);">취소</button>';
         reply += '<button class="comment-reg-btn">등록</button>';
         reply += '</div>';
         reply += '</form>';
          $(this).next().html(reply);
      });
       
	//태그 색상
    $(function() {
        var $tag = $(".board-title-tag");
        if($tag.text().includes('실종'))
            $tag.css('color', '#F08080');
        else if($tag.text().includes('목격'))
            $tag.css('color', '#F0EF97');
        else if($tag.text().includes('보호'))
            $tag.css('color', '#5F9EA0');
    });
       
	//아이디 클릭시 메뉴
    $(".writer").click(function() {
        $(".writer-menu").toggle();
    });
	//댓글 이미지 클릭시
    $(".icon").click(function() {
        $(this).next().toggle();
    });
    //댓글 삭제 클릭시
    $(".comment-delete").on("click",  function() {
    	if(!confirm("댓글을 삭제하시겠습니까?"))
			return;
		location.href="${pageContext.request.contextPath}/animalboard/deleteComment?no=${animalBoard.aniBoId}&commentNo="+$(this).val();
    });
    $(".comment-edit").on("click",  function() {
        $(this).parent().parent().toggle();
        var val = $(this).parent().parent().next().html();
        var ht = '<form action="${pageContext.request.contextPath}/animalboard/editComment" method="post">'
            	+'<textarea rows="1" class="edit comment_inbox_text" placeholder="댓글을 입력하세요" onkeyup="xSize(this)" name="aniCoContent">'+val+'</textarea>'
        		+'<button type="submit" class="comment-edit-btn">수정</button>'
        		+'<input type="hidden" name="aniCoId" value="'+$(this).val()+'" />'
        		+'<input type="hidden" name="aniBoId" value="${animalBoard.aniBoId}" />'
        		+'</form>';
        $(this).parent().parent().next().html(ht);
        $(".edit").focus();
        
    });
    $(".comment-edit-btn").on("click", function() {
    });
    
    function cancleBtn(btn) {
		var $btn = $(btn);
      	$btn.parent().parent().parent().toggle();
    }
    
    $('.slider').slick({
    	  infinite: true,
    	  slidesToShow: 4,
    	  slidesToScroll: 4
    });
    		
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
