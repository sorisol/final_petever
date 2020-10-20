<%@page import="com.kh.petever.reviewBoard.model.vo.ReviewAttach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review-board.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<style>
	tr[data-board-no] {
		cursor: pointer;
	}
	</style>
 <script>

 var test = function test() {
	$(".post").each(function(){
	    console.log($(this).children().find("img")[0] == null );
	    if($(this).children().find("img")[0] == null){
	        console.log(111);
	        var html = '<img src="${pageContext.request.contextPath}/resources/images/dog/petever.jpg">';
	        $(this).children().prepend(html);
	    }
	});
}
	
$(function(){

	$("#search").on("change", function() {
		var $search = $("#search").val();
		var $query = $("#query");

		if($search == "rewBoContent")
			$query.attr("name", "rewBoContent");
		else
			$query.attr("name", "rewBoTitle");
	});
	test();
	
});


function searchFunc() {
	var formData = $("#searchFrm").serialize();
	//var formData = $("form[name=searchFrm]").serialize();
	console.log(formData);
	$.ajax({
		url: '${pageContext.request.contextPath}/reviewBoard/search.do',
		dataType: 'json',
		method: 'post',
		data: formData,
		success: function(data) {
			console.log(data);
			var $post = $('.post-wrap');	
			//$post.html('');
			var html = '';
			if(data.boardList == null || data.boardList.length == 0) {
				html += '<p align="center">조회된 게시물이 없습니다.</p>';		
			}
			else {
				console.log(data);
				console.log(data.attachList);
				for(var i in data.boardList){
					var b = data.boardList[i];
					html += '<div class="post">';
					html += '<a href="${ pageContext.request.contextPath }/reviewBoard/reviewBoardView.do?no='+b.rewBoId+'">';

					//사진
            		for(var j in data.fileList) {
						var f = data.fileList[j];
						if(b.rewBoId == f.rewBoId) {
							html += '<img src="${ pageContext.request.contextPath }/resources/editor/multiupload/'+f.rewAtRenamedName+'">';
						}
					
                    }
                    html += '<br>'
					html += '<p>' +b.rewBoTitle+ '</p>'
				/* 	html += '<span id="post-title">' +${b.rewBoTitle}+ '</span>' */
					html += '<p>'+b.rewBoRegDate.substring(0, 10).replaceAll('-', '.')+'</p>';
					html += '</a></div>';

				}

			}
			$post.html(html);
			test();
		},
		error: function(xhr, status, err) {
			console.log("처리실패", xhr, status, err);
		}
	});
}




</script> 
	 <div id="main-wrap">
	        <section class="main">
	
	        </section>
	        <section class="content-wrap">            
	        <h1>입양후기 게시판</h1>
	        <p>동물을 입양한 사람들이 사진과 후기를 남기는 게시판입니다.</p>
	         <div class="content">
                <div class="border">
			
   <section id="board-container" class="container" align="center">
 	<p>총 ${totalContents}건의 게시물이 있습니다.</p> 
 	<br>
 	<b>
 	<a href="${pageContext.request.contextPath}/reviewBoard/reviewBoardPhoto.do">썸네일로 보기</a> | 
    <a href="${ pageContext.request.contextPath }/reviewBoard/reviewBoard.do">목록으로 보기</a>
	</b>

  	 <hr style="height: 1px; border:none; background-color: lightgray; width: 1000px; margin: 30px 50px;">

	 <div class="post-wrap">
			<c:forEach items="${ list }" var="b">
				<div class="post">
				<a href="${ pageContext.request.contextPath }/reviewBoard/reviewBoardView.do?no=${b.rewBoId}">
                  <%--    <tr data-board-no="${ b.rewBoId }"> 	  --%>	
                 
				<c:forEach items="${attachList}" var="a">
  					<c:if test="${ a.rewBoId.equals(b.rewBoId) }">
							<img src="${pageContext.request.contextPath}/resources/editor/multiupload/${a.rewAtRenamedName}">
						</c:if>   
			    		</c:forEach>
			    		
							
						
			<br>
		<%-- 	<p> ${ b.rewBoTitle}</p>	 --%>
			<span id="post-title">${b.rewBoTitle}</span>
			<p>
		        <fmt:parseDate value="${b.rewBoRegDate}" var="regDate" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${regDate}" pattern="yyyy.MM.dd"/>
					</p>		
						</tr>
					</a>
				</div>
				</tr>
			
			</c:forEach>
			
		</div>
				

</section> 
   
	                    <hr style="height: 1px; border:none; background-color: lightgray; width: 860px; margin: 35px 50px 10px 50px;">
	                    <c:if test="${not empty loginUser}">
	                    <button type="button" onclick="location.href='${pageContext.request.contextPath}/reviewBoard/reviewBoardFrm'" class="write-btn">글쓰기</button>
	             		</c:if>
	               		<form id="searchFrm">
	                    <div class="search-wrap">
	                        <select name="search" id="search">
	                            <option value="rewBoTitle">제목</option>
	                            <option value="rewBoContent">내용</option>
	                        </select>
	                        <input type="text" name="rewBoTitle" id="query">
	                        <button type="button" id="bottom-search-btn" onclick="searchFunc();">검색</button>
		                </div>
                    </form>
					<div class="pageBar">
					${ pageBar }
					</div>
                </div>
            </div>
            
        </section>
    </div>
    
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>