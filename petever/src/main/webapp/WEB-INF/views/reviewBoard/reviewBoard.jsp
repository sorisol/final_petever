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
	.post-title {
		cursor: pointer;
	}
	
	.tbl-board {
    width: 770px;
    margin: 0 auto;
/*     border: 1px solid #bcbcbc; */
    background-color: rgb(255,249,238); 
    }
    
    th{
    background-color : rgb(255,193,63); 
	text-align: left;
        }
    
    

	</style>
 <script>
$(function(){

 	/* $("tr[data-board-no]").click(function(){
		var no = $(this).attr("data-board-no");
		location.href = "${ pageContext.request.contextPath }/reviewBoard/reviewBoardView.do?no="+ no";
	}); */
 
	$("#search").on("change", function() {
		var $search = $("#search").val();
		var $query = $("#query");

		if($search == "rewBoContent")
			$query.attr("name", "rewBoContent");
		else
			$query.attr("name", "rewBoTitle");
	});
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
			var $table = $('#tbl-board');
			
			var html = '';
			html += '<tr><th>No</th><th>Title</th><th>UserId</th><th>Date</th></tr>';
			if(data.boardList == null || data.boardList.length == 0) {
				html += '<p align="center">조회된 게시물이 없습니다.</p>';		
			}
			else {
				console.log(data);
				//console.log(data.attachList);
				for(var i in data.boardList){
						var b = data.boardList[i];

						html += '<tr>'
						html += '<td>'+ b.rewBoId +'</td>';
						html +=	'<td><a href="${ pageContext.request.contextPath }/reviewBoard/reviewBoardView.do?no='+b.rewBoId+'">';
						html += b.rewBoTitle +'</a></td>';		
						html += '<td>'+ b.userId +'</td>';
						html += '<td>'+b.rewBoRegDate.substring(0, 10).replace(/-/g, '.')+'</td>';
						html += '</tr>';					
				}
				console.log(html);
				$table.html(html);
			}
			
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
 	
 	<p>총 <span style="font-size:18px;">${totalContents}</span>건의 게시물이 있습니다.</p> 
	<br>
 	<b>
 	<a href="${pageContext.request.contextPath}/reviewBoard/reviewBoardPhoto.do"><img class="review-icon" src="${pageContext.request.contextPath}/resources/images/img.png" alt="" />썸네일로 보기</a> | 
    <a href="${ pageContext.request.contextPath }/reviewBoard/reviewBoard.do"><img class="review-icon" src="${pageContext.request.contextPath}/resources/images/list.png" alt="" />목록으로 보기</a>
	</b>
	</section>	

  	 <hr style="height: 1px; border:none; background-color: lightgray; width: 860px; margin: 30px 50px;">


	<section id="board-container2">
		<table id="tbl-board" class="tbl-board" width = "800">            
		 	<tr>
				<th>No</th>
				<th>Title</th>
				<th>UserId</th>
				<th>Date</th>
			</tr> 
			<br>
			<c:forEach items="${ list }" var="b">    
			<tr data-board-no="${ b.rewBoId }" >
				<td>${ b.rewBoId }</td>	
		 		<td>
		 		<div class="post-title">
		 		<a href="${ pageContext.request.contextPath }/reviewBoard/reviewBoardView.do?no=${b.rewBoId}">
		    	${ b.rewBoTitle }
		    	</a>
		    	</div>
		    	</td>  	    	
				<td>${ b.userId }</td>
				<td>
			        <fmt:parseDate value="${b.rewBoRegDate}" var="regDate" pattern="yyyy-MM-dd"/>
					<fmt:formatDate value="${regDate}" pattern="yyyy.MM.dd"/>
				</td>	
			</tr>
		
			</c:forEach>
		</table>
</section> 
   
	                    <hr style="height: 1px; border:none; background-color: lightgray; width: 860px; margin: 35px 50px 10px 50px;">
	                    <c:if test="${not empty loginUser}">
	                    <div class="write-wrap">
	                    	<button type="button" onclick="location.href='${pageContext.request.contextPath}/reviewBoard/reviewBoardFrm'" class="write-btn">글쓰기</button>
	                    </div>
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