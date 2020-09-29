<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--한글 인코딩처리 --%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mp-board-view.css">
	    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>[${animalBoard.aniBoTag}] ${animalBoard.aniBoTitle}</h1>
            <p>#강아지 #3살 #퍼그 #수컷 #강남구 #중성화</p>
            <div class="content">
                <div class="board-container">
                    <div class="board-header">
                        <span class="board-title-tag">[${animalBoard.aniBoTag}]</span>
                        <span class="board-title">${animalBoard.aniBoTitle}</span>
                        <br>
                        <span class="writer">${animalBoard.userId}</span>
                        <div class="writer-menu">
                            <ul>
                                <li><a href="">쪽지보내기</a></li>
                                <li><a href="">입양신청하기</a></li>
                            </ul>
                        </div>
                        <span class="write-time">
                        	<fmt:parseDate value="${animalBoard.aniBoDate}" var="aniBoDate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${aniBoDate}" pattern="yyyy.MM.dd HH:mm"/>
                        </span>
                        <a href="#board-comment-container" class="header-comment-view">댓글 ${totalComment}</a>
                    </div>
                    <div class="pet-info">

                    </div>
                    <div class="board-content">
						${animalBoard.aniBoContent }
                    </div>
                    <div class="pet-info">
                        <span>#강아지</span>
                        <span>#퍼그</span>
                        <span>#수컷</span>
                        <span>#3살</span>
                        <span>#강남구 태해란로</span>
                        <span>#중성화 완료</span>
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
			                            <img class="icon" src="${pageContext.request.contextPath}/resources/images/icon.png"/>
			                            <div class="comment-menu">
				                            <ul>
				                                <li class="comment-edit" value="${cl.aniCoId}">수정</li>
				                                <li class="comment-delete" value="${cl.aniCoId}">삭제</li>
				                            </ul>
				                        </div>
			                            <p>${cl.aniCoContent}</p>
			                            <span class="comment-time">
			                            	<fmt:parseDate value="${cl.aniCoDate}" var="aniCoDate" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${aniCoDate}" pattern="yyyy.MM.dd HH:mm"/>
			                            </span>
			                            
			                            <button type="button" class="reply-btn" value="${cl.aniCoId}">답글쓰기</button>
			                        </div>
                        		</c:if>
                        		<c:if test="${cl.aniCoLevel == 2 }">
			                        <div class="board-comment-reply">
			                            <span class="id-box">&#8627; ${cl.userId}</span>
			                            <img class="icon" src="${pageContext.request.contextPath}/resources/images/icon.png"/>
			                            <div class="comment-menu">
				                            <ul>
				                                <li class="comment-edit" value="${cl.aniCoId}">수정</li>
				                                <li class="comment-delete" value="${cl.aniCoId}">삭제</li>
				                            </ul>
				                        </div>
			                            <p>${cl.aniCoContent}</p>
			                            <span class="comment-time">
			                            	<fmt:parseDate value="${cl.aniCoDate}" var="aniCoDate" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${aniCoDate}" pattern="yyyy.MM.dd HH:mm"/>
										</span>
			                            <button type="button" class="reply-btn" value="${cl.aniCoId}">답글쓰기</button>
			                        </div>
                        		</c:if>
                        	</c:forEach>
                        </c:if>
                    </div>
                    <div class="comment-write">
                    	<form action="${pageContext.request.contextPath}/animalboard/insertComment" method="post">
	                        <input type="hidden" name="userId" value="honggd"/>
	                        <input type="hidden" name="aniCoLevel" value="1"/>
	                        <input type="hidden" name="aniBoId" value="${animalBoard.aniBoId}" />
	                        <input type="hidden" name="aniCoRef" value="0"/>
	                        <span>honggd</span>
	                        <textarea rows="1" class="comment_inbox_text" placeholder="댓글을 입력하세요" name="aniCoContent"
	                            onkeyup="xSize(this)"></textarea>
	                        <div class="btn-align">
	                            <button class="comment-reg-btn">등록</button>
	                        </div>
                    	</form>
                    </div>
                </div>
                <div class="btn-wrap">
	                <button type="button" class="board-list-btn" onclick="location.href='${pageContext.request.contextPath}/animalboard'">글 목록</button>
	                <button type="button" class="board-delete-btn">삭제</button>
	                <button type="button"class="board-edit-btn">수정</button>
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
        window.open("report.html", "신고하기",
            "width=500, height=330, toolbar=no, menubar=no, scrollbars=no, resizable=yes, top=300, left=500");
    }

     //댓글입력창 자동 높이조절
     function xSize(e) {
         e.style.height = '1px';
         e.style.height = (e.scrollHeight) + 'px';
     }
        
     $(".reply-btn").on('click', function() {
         var reply = '<div class="comment-reply-write">'
           		+'<form action="${pageContext.request.contextPath}/animalboard/insertComment" method="post">'
				+'<input type="hidden" name="userId" value="honggd"/>'
                +'<input type="hidden" name="aniCoLevel" value="2"/>'
                +'<input type="hidden" name="aniBoId" value="${animalBoard.aniBoId}" />'
                +'<input type="hidden" name="aniCoRef" value="'+$(this).val()+'"/>'
                +'<span>honggd</span>'
                +'<textarea rows="1" class="comment_inbox_text" placeholder="댓글을 입력하세요" onkeyup="xSize(this)" name="aniCoContent"></textarea>'
                +'<div class="btn-align">'
                +'<button type="button" class="comment-cancle-btn" onclick="cancleBtn()">취소</button>'
                +'<button class="comment-reg-btn">등록</button>'
                +'</div>'
                +'</form>'
                +'</div>';
          $(this).parent().append(reply);
          $(this).off("click");
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
		location
    });
	//취소버튼눌렀을때
    function cancleBtn() {
       $(".comment-reply-write").toggle();
    }
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
