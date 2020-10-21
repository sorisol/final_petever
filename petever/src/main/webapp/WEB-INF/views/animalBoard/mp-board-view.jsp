<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--한글 인코딩처리 --%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mp-board-view.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick-theme.css"/>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>[${animalBoard.aniBoTag}] ${animalBoard.aniBoTitle}</h1>
            <p>#${animalBoard.aniBoLocal}
               #${animalBoard.aniBoType}
               #${animalBoard.aniBoKind}
               ${animalBoard.aniBoGender}
               #${animalBoard.aniBoCha}
               #
	           <fmt:parseDate value="${animalBoard.aniBoMissDate}" var="missDate" pattern="yyyy-MM-dd HH:mm:ss"/>
			   <fmt:formatDate value="${missDate}" pattern="yyyy.MM.dd"/>
            </p>
            <div class="content">
                <div class="board-container">
                    <div class="board-header">
                        <span class="board-title-tag">[${animalBoard.aniBoTag}]</span>
                        <span class="board-title">${animalBoard.aniBoTitle}</span>
                        <br>
                        <span class="writer">${animalBoard.userId}</span>
                        <c:if test="${not empty loginUser}">
	                        <div class="writer-menu">
	                            <ul>
	                                <li onClick="javascript:sendMessage('${animalBoard.userId}');" >쪽지보내기</li>
	                                <li><a href="${pageContext.request.contextPath}/apply/adopt?no=${animalBoard.aniBoId}">입양신청하기</a></li>
	                            </ul>
	                        </div>
                        </c:if>
                        <span class="write-time">
                        	<fmt:parseDate value="${animalBoard.aniBoDate}" var="aniBoDate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${aniBoDate}" pattern="yyyy.MM.dd HH:mm"/>
                        </span>
                        <a href="#board-comment-container" class="header-comment-view">댓글 ${totalComment}</a>
                    </div>
                    <div class="board-content">
						${animalBoard.aniBoContent }
                    </div>
                    <div class="pet-info">
                        <span>#${animalBoard.aniBoLocal}</span>
                        <span>#${animalBoard.aniBoType}</span>
                        <span>#${animalBoard.aniBoKind}</span>
                        <c:if test="${not empty animalBoard.aniBoGender}">
	                        <span>#${animalBoard.aniBoGender}</span>
                        </c:if>
                        <c:if test="${not empty animalBoard.aniBoCha}">
                        	<span>#${animalBoard.aniBoCha}</span>
                        </c:if>
                        <span>#
	                        <fmt:parseDate value="${animalBoard.aniBoMissDate}" var="missDate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${missDate}" pattern="yyyy.MM.dd"/>
                        </span>
                    </div>
                   	<c:if test="${not empty shelterAniList}">
	                    <div class="similar-container">
	                    	<fieldset>
	                    		<legend> 같은 지역에서 실종 신고된 동물 </legend>
	                    		<div class="slider">
		                    		<c:forEach items="${shelterAniList}" var="sa">
		                    			<div>
		                    				<a href="${pageContext.request.contextPath}/shelterBoard/shelterAni?deserNo=${sa.desertionNo}">
			                    				<img src="${sa.popfile}"/>
		                    				</a>
		                    			</div>
		                    		</c:forEach>
	                    		</div>
	                    	</fieldset>
	                    </div>
                   	</c:if>
                    <div id="board-comment-container">
                        <div class="comment-header">
                            <span class="comment-view">댓글 ${totalComment}</span>
                            <div>
                            	<a class="report-btn" onclick="javascript:openReport();">신고</a>
			                    <a id="kakao-link-btn" href="javascript:sendLink()">
			                    <span class="ico_bbs ico_share">공유하기</span>
								  <!-- <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" width="25px"/> -->
								</a>
                            </div>
                        </div>
                        <c:if test="${ not empty commentList }">
                        	<c:forEach items="${commentList}" var="cl">
                        		<c:if test="${cl.aniCoLevel == 1 }">
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
			                      	console.log(dec);
			                      	setRandomColor(dec);
			                        </script>
			                            <span class="id-box">${cl.userId}  
				                            <span class="comment-time"> |
				                            	<fmt:parseDate value="${cl.aniCoDate}" var="aniCoDate" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:formatDate value="${aniCoDate}" pattern="yyyy.MM.dd HH:mm"/>
				                            </span>
			                            </span>
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
										<c:if test="${not empty loginUser}">
				                            <button type="button" class="reply-btn" value="${cl.aniCoId}"><img data-v-0e41a35e="" src="https://talk.op.gg/images/icon-reply@2x.png" width="16" alt="">답글쓰기</button>
				                            <div class="comment-reply-write" style="display: none;"></div>
										</c:if>
			                        </div>
	                        	</c:if>
                        		<c:if test="${cl.aniCoLevel == 2}">
			                        <div class="board-comment-reply">
			                        <span class="user-thum thum-sub ${fn:substring(cl.userId,0,1)}">${fn:substring(cl.userId,0,1)}</span>
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
			                            <script>
			                        function setRandomColor(dec) {
			                        	
			                      	  $(".${fn:substring(cl.userId,0,1)}").css("background-color", '#'+dec);
			                      	}
			                      	var id = Number('${cl.userId}'.charCodeAt(0))*2;
			                      	var id1 = Number('${cl.userId}'.charCodeAt(1));
			                      	var id2 = Number('${cl.userId}'.charCodeAt(2));
			                      	var dec = ((id*id1*id2* ${fn:length(cl.userId)}).toString(16)).substring(0,6);
			                      	console.log(dec);
			                      	setRandomColor(dec);
			                        </script>
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
		                        <span>${loginUser.userId}</span><br />
		                        <textarea rows="1" class="comment_inbox_text" placeholder="주제와 무관한 댓글, 타인의 권리를 침해하거나 명예를 훼손하는 게시물은 별도의 통보 없이 제재를 받을 수 있습니다." name="aniCoContent"
		                            onkeyup="xSize(this)"></textarea>
		                        <div class="btn-align">
		                            <button class="comment-reg-btn">등록</button>
		                        </div>
	                    	</form>
	                    </div>
                    </c:if>
                </div>
                <div class="btn-wrap">
	                <button type="button" class="board-list-btn" onclick="location.href='${pageContext.request.contextPath}/animalboard'">글 목록</button>
	                <c:if test="${loginUser.userId == animalBoard.userId || loginUser.userId == 'admin'}">
		                <button type="button" class="board-delete-btn">삭제</button>
		                <button type="button"class="board-edit-btn" onclick="location.href='${pageContext.request.contextPath}/animalboard/updateBoardFrm?no=${animalBoard.aniBoId}'">수정</button>
	                </c:if>
                </div>
            </div>
        </section>
    </div>
<script>
function sendLink() {
	Kakao.init("127b0f341e46ad8b0a7b6e38df529a1b");
	Kakao.Link.sendDefault({
    objectType: 'feed',
    content: {
      title: '[${animalBoard.aniBoTag}] ${animalBoard.aniBoTitle}',
      description: '#${animalBoard.aniBoLocal} #${animalBoard.aniBoType} #${animalBoard.aniBoKind} #${animalBoard.aniBoGender} #${animalBoard.aniBoCha}',
      imageUrl:
        '${pageContext.request.contextPath}/resources/editor/multiupload/202010141108341c53f1f4-ebe2-414d-ae95-50d9faa1f195.jpg',
      link: {
        mobileWebUrl: 'https://developers.kakao.com',
        webUrl: 'http://localhost:9090/petever/animalboard/boardView?no='+${animalBoard.aniBoId},
      },
    },
    social: {
      likeCount: 286,
      commentCount: 45,
      sharedCount: 845,
    },
    buttons: [
      {
        title: '웹으로 보기',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'http://localhost:9090/petever/animalboard/boardView?no='+${animalBoard.aniBoId},
        },
      }
    ],
  })
}
$(".board-delete-btn").on("click", function() {
	if(!confirm("게시글을 삭제하시겠습니까?"))
		return;
	location.href="${pageContext.request.contextPath}/animalboard/deleteBoard?no="+${animalBoard.aniBoId};
});
function openReport() {
	window.open("${pageContext.request.contextPath}/animalboard/reportFrm?no=${animalBoard.aniBoId}&&doUser=${loginUser.userId}", "신고하기",
           "width=500, height=350, toolbar=no, menubar=no, scrollbars=no, resizable=yes, top=300, left=500");
}

//댓글입력창 자동 높이조절
function xSize(e) {
    e.style.height = '1px';
    e.style.height = (e.scrollHeight) + 'px';
}
       
$(".reply-btn").on('click', function() {
	/* $(".comment-reply-write") */
	console.log($(this));
	$(this).next().toggle();
    var reply = '<form action="${pageContext.request.contextPath}/animalboard/insertComment" method="post">';

    reply += '<input type="hidden" name="userId" value="${loginUser.userId}"/>';
    reply += '<input type="hidden" name="aniCoLevel" value="2"/>';
    reply += '<input type="hidden" name="aniBoId" value="${animalBoard.aniBoId}" />';
    reply += '<input type="hidden" name="aniCoRef" value="'+$(this).val()+'"/>';
    reply += '<span class="id-box">${loginUser.userId}</span>';
    reply += '<textarea rows="1" class="comment_inbox_text" placeholder="주제와 무관한 댓글, 타인의 권리를 침해하거나 명예를 훼손하는 게시물은 별도의 통보 없이 제재를 받을 수 있습니다." onkeyup="xSize(this)" name="aniCoContent"></textarea>';
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
//공유하기 이미지 클릭시
$(".ico_bbs").click(function() {
	$("#kakao-link-btn").toggle();
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
    
});
   
function cancleBtn(btn) {
	var $btn = $(btn);
    $btn.parent().parent().parent().toggle();
}
  
$('.slider').slick({
	infinite: true,
	slidesToShow: 5,
	slidesToScroll: 4
});

</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
