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
                        <span class="writer">${animalBoard.userId }</span>
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
			                            <p class="id-box"></p>
			                            <p>안녕하세요</p>
			                            <span class="comment-time">2020.09.18 11:11</span>
			                            <span class="reply-btn">답글쓰기</span>
			                        </div>
                        		</c:if>
                        		<c:if test="${cl.aniCoLevel == 2 }">
			                        <div class="board-comment-reply">
			                            <p class="id-box">&#8627; sinsa</p>
			                            <p>안녕하세요</p>
			                            <span class="comment-time">2020.09.18 11:11</span>
			                            <span class="reply-btn">답글쓰기</span>
			                        </div>
                        		</c:if>
                        	</c:forEach>
                        </c:if>
                    </div>
                    <div class="comment-write">
                        <span>honggd</span>
                        <textarea rows="1" class="comment_inbox_text" placeholder="댓글을 입력하세요"
                            onkeyup="xSize(this)"></textarea>
                        <div class="btn-align">
                            <button class="comment-reg-btn">등록</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<script>
    function openReport() {
        window.open("report.html", "신고하기",
            "width=500, height=330, toolbar=no, menubar=no, scrollbars=no, resizable=yes, top=300, left=500");
    }

     //댓글입력창 자동 높이조절
     function xSize(e) {
            console.log(e.value.length);
            e.style.height = '1px';
            e.style.height = (e.scrollHeight) + 'px';
        }
        
        $(".reply-btn").click(function() {
            $(".comment-reply-write").toggle();
            // var reply = '<div class="comment-reply-write">'
            //             +'<span>honggd</span>'
            //             +'<textarea rows="1" class="comment_inbox_text" placeholder="댓글을 입력하세요" onkeyup="xSize(this)"></textarea>'
            //             +'<div class="btn-align">'
            //             +'<button class="comment-cancle-btn">취소</button>'
            //             +'<button class="comment-reg-btn">등록</button>'
            //             +'</div>'
            //             +'</div>';
            // $(this).parent().append(reply);
            // $(this).parent(reply).trigger("create");
            // $(this).parent().append(reply).show();
            $(this).off("click");
        });

        $(function() {
            var $tag = $(".board-title-tag");
            if($tag.text().includes('실종'))
                $tag.css('color', '#F08080');
            else if($tag.text().includes('목격'))
                $tag.css('color', '#F0EF97');
            else if($tag.text().includes('보호'))
                $tag.css('color', '#5F9EA0');
        });

        $(".writer").click(function() {
            $(".writer-menu").toggle();
        });

        $(".comment-cancle-btn").click(function() {
            $(".comment-reply-write").hide();
        });
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
