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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
                                <li onClick="sendMessage('${reviewBoard.userId}');" >쪽지보내기</li>
                            </ul>
                        </div>
                       
                        <span class="write-time">${reviewBoard.rewBoRegDate}</span>
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
                        		<c:if test="${cl.rewCoLevel == 1 }">
			                        <div class="board-comment">
			                        	<span class="user-thum ${fn:substring(cl.userId,0,1)}">${fn:substring(cl.userId,0,1)}</span>
			                        	<script>
					                        function setRandomColor(dec) {
					                        	
					                      	  $(".${fn:substring(cl.userId,0,1)}").css("background-color", '#'+dec);
					                      	}
					                      	var id = Number('${cl.userId}'.charCodeAt(0))*2;
					                      	var id1 = Number('${cl.userId}'.charCodeAt(1));
					                      	var id2 = Number('${cl.userId}'.charCodeAt(2));
					                      	var dec = ((id*id1*id2* ${fn:length(cl.userId)}).toString(16)).substring(0,6);
					                      	setRandomColor(dec);
				                        </script>
			                            <span class="id-box">${cl.userId}</span>
		                            	<c:if test="${not empty loginUser}">
		                            		<c:if test="${loginUser.userId eq cl.userId || loginUser.userId == 'admin'}">
			                           		 	<img class="icon" src="${pageContext.request.contextPath}/resources/images/icon.png"/>
					                            <div class="comment-menu">
						                            <ul>
						                                <li class="comment-edit" value="${cl.rewCoId}">수정</li>
						                                <li class="comment-delete" value="${cl.rewCoId}">삭제</li>
						                            </ul>
						                        </div>
			                            	</c:if>
			                            </c:if>
			                            <p>${cl.rewCoContent}</p>
			                            <span class="comment-time">
			                            	<fmt:parseDate value="${cl.rewCoDate}" var="rewCoDate" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${rewCoDate}" pattern="yyyy.MM.dd HH:mm"/>
			                            </span>
			                            
										<c:if test="${not empty loginUser}">
				                            <button type="button" class="reply-btn" value="${cl.rewCoId}">답글쓰기</button>
				                            <div class="comment-reply-write" style="display: none;"></div>
										</c:if>
			                        </div>
	                        	</c:if>
                        		<c:if test="${cl.rewCoLevel == 2}">
			                        <div class="board-comment-reply">
			                        <span class="user-thum thum-sub ${fn:substring(cl.userId,0,1)}">${fn:substring(cl.userId,0,1)}</span>
			                        <script>
				                        function setRandomColor(dec) {
				                        	
				                      	  $(".${fn:substring(cl.userId,0,1)}").css("background-color", '#'+dec);
				                      	}
				                      	var id = Number('${cl.userId}'.charCodeAt(0))*2;
				                      	var id1 = Number('${cl.userId}'.charCodeAt(1));
				                      	var id2 = Number('${cl.userId}'.charCodeAt(2));
				                      	var dec = ((id*id1*id2* ${fn:length(cl.userId)}).toString(16)).substring(0,6);
				                      	setRandomColor(dec);
			                        </script>
			                            <span class="id-box">
											<svg width="10" height="10" xmlns="http://www.w3.org/2000/svg">
											 <g>
											  <title>background</title>
											  <rect fill="none" id="canvas_background" height="12" width="12" y="-1" x="-1"/>
											 </g>
											 <g>
											  <title>Layer 1</title>
											  <path fill="#000000" fill-rule="evenodd" stroke-width="NaN" id="path4483" d="m0,3.627304l0,-3.627304l1.812638,0l0,3.627304c0,0.453444 0.453163,0.906861 0.906326,0.906861l4.531602,0l-2.718964,-2.720494l0.906313,-0.906849l4.531602,4.534153l-4.531602,4.534166l-0.906313,-0.906849l2.718964,-2.720494l-4.531602,0c-1.586057,0 -2.718964,-1.133545 -2.718964,-2.720494z"/>
											 </g>
											</svg>
											${cl.userId}
										</span>
		                            	<c:if test="${not empty loginUser}">
				                            <img class="icon" src="${pageContext.request.contextPath}/resources/images/icon.png"/>
				                            <div class="comment-menu">
			                            		<c:if test="${loginUser.userId eq cl.userId || loginUser.userId == 'admin'}">
						                            <ul>
						                                <li class="comment-edit" value="${cl.rewCoId}">수정</li>
						                                <li class="comment-delete" value="${cl.rewCoId}">삭제</li>
						                            </ul>
				                            	</c:if>
					                        </div>
		                            	</c:if>
			                            <p>${cl.rewCoContent}</p>
			                            <span class="comment-time">
			                            	<fmt:parseDate value="${cl.rewCoDate}" var="rewCoDate" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${rewCoDate}" pattern="yyyy.MM.dd HH:mm"/>
										</span>
			                        </div>
	                        	</c:if>
                        	</c:forEach>
                        </c:if>
                    </div>
                    <c:if test="${not empty loginUser}">
	                    <div class="comment-write">
	                    	<form action="${pageContext.request.contextPath}/reviewBoard/insertComment.do" method="post">
		                        <input type="hidden" name="userId" value="${loginUser.userId}"/>
		                        <input type="hidden" name="rewCoLevel" value="1"/>
		                        <input type="hidden" name="rewBoId" value="${reviewBoard.rewBoId}" />
		                      <!--   <input type="hidden" name="rewCoRef" value="0"/> -->
		                        <span>${loginUser.userId}</span>
		                        <span class="cnt"></span>
		                        <textarea rows="1" class="comment_inbox_text" placeholder="댓글을 입력하세요" name="rewCoContent"
		                            onkeyup="xSize(this)"></textarea>
		                        <div class="btn-align">
		                            <button class="comment-reg-btn">등록</button>
		                        </div>
	                    	</form>
	                    </div>
                    </c:if>
                </div>
                <div class="btn-wrap">
	                <button type="button" class="board-list-btn" onclick="location.href='${pageContext.request.contextPath}/reviewBoard/reviewBoardPhoto.do'">글 목록</button>
	                <c:if test="${loginUser.userId == reviewBoard.userId || loginUser.userId == 'admin'}">
		                <button type="button" class="board-delete-btn">삭제</button>			
		                <button type="button"class="board-edit-btn" onclick="location.href='${pageContext.request.contextPath}/reviewBoard/updateFrm.do?no=${reviewBoard.rewBoId}'">수정</button>
	              </c:if>
                </div>
            </div>
        </section>
    </div>
<script>
	
 	$(".board-delete-btn").on("click", function() {
		if(!confirm("게시글을 삭제하시겠습니까?"))
			return;
		location.href="${pageContext.request.contextPath}/reviewBoard/deleteBoard?no="+${reviewBoard.rewBoId};
	});
	//신고하기
    function openReport() {
        window.open("${pageContext.request.contextPath}/reviewBoard/reportFrm.do?no=${reviewBoard.rewBoId}&&doUser=${loginUser.userId}", "신고하기",
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
         var reply = '<form action="${pageContext.request.contextPath}/reviewBoard/insertComment.do" method="post">';
         reply += '<input type="hidden" name="userId" value="${loginUser.userId}"/>';
         reply += '<input type="hidden" name="rewCoLevel" value="2"/>';
         reply += '<input type="hidden" name="rewBoId" value="${reviewBoard.rewBoId}" />';
         reply += '<input type="hidden" name="rewCoRef" value="'+$(this).val()+'"/>'; 
         reply += '<span class="id-box">${loginUser.userId}</span>';
         reply += '<span class="cnt"></span>';
         reply += '<textarea rows="1" class="comment_inbox_text" placeholder="댓글을 입력하세요" onkeyup="xSize(this)" name="rewCoContent"></textarea>';
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

      //글자수 제한
        $(document).on("keyup", "textarea", function(){
            var $textarea = $(this);
    		var len = $textarea.val().length;
    		$textarea.parent().find(".cnt").html(len+"/300");
    		if(len > 300) {
    			alert("300자까지 작성할 수 있습니다.");
    			$textarea.val($textarea.val().substring(0, 300));
    		}
        });
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
		location.href="${pageContext.request.contextPath}/reviewBoard/deleteComment.do?no=${reviewBoard.rewBoId}&commentNo="+$(this).val();
    });
    //댓글 수정 클릭시
    $(".comment-edit").on("click",  function() {
        $(this).parent().parent().toggle();
        var val = $(this).parent().parent().next().html();
        var ht = '<form action="${pageContext.request.contextPath}/reviewBoard/editComment.do" method="post">'
            	+'<textarea rows="1" class="edit comment_inbox_text" placeholder="댓글을 입력하세요" onkeyup="xSize(this)" name="rewCoContent">'+val+'</textarea>'
        		+'<button type="submit" class="comment-edit-btn">수정</button>'
        		+'<input type="hidden" name="rewCoId" value="'+$(this).val()+'" />'
        		+'<input type="hidden" name="rewBoId" value="${reviewBoard.rewBoId}" />'
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
<style>
.cursor {
	cursor: pointer;
}</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
