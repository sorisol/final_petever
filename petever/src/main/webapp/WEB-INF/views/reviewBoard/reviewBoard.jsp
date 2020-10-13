<%@page import="com.kh.petever.animalboard.model.vo.AnimalAttach"%>
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
$(function(){

	$("tr[data-board-no]").click(function(){
		var no = $(this).attr("data-board-no");
		location.href = "${ pageContext.request.contextPath }/reviewBoard/reviewBoardView.do?no=" + no;
	});
	
});


</script> 
	 <div id="main-wrap">
	        <section class="main">
	
	        </section>
	        <section class="content-wrap">            
	        <h1>입양후기 게시판</h1>
	        <p>동물을 입양한 사람들이 사진과 후기를 남기는 게시판입니다.</p>
	         <div class="content">
                <div class="border">
  	 <hr style="height: 1px; border:none; background-color: lightgray; width: 1000px; margin: 30px 50px;">
						
   <section id="board-container" class="container">
<%-- 	<p>총 ${ totalContents }건의 게시물이 있습니다.</p> --%>
	
	<table id="tbl-board" class="table table-striped table-hover">
		<tr>
			<th>No</th>
			<th>Title</th>
			<th>UserId</th>
			<th>Date</th>
		</tr>
		<c:forEach items="${ list }" var="b">
		<tr data-board-no="${ b.rewBoId }">
			<td>${ b.rewBoId }</td>	
	 		<td>${ b.rewBoTitle }</td> 	
			<td>${ b.userId }</td>
			<td>
			
				<%-- <fmt:formatDate value="${ b.regDate }" type="both"/> --%>
				<!-- String -> Date -> yyy.MM.dd형식으로 바꾸기 -->
		        <fmt:parseDate value="${b.rewBoRegDate}" var="regDate" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${regDate}" pattern="yyyy.MM.dd"/>
			</td>
			<td align="center">
				<%-- <c:if test="${ b.attachmentCount > 0 }">
					<img alt="첨부파일"
					 	 src="${ pageContext.request.contextPath }/resources/images/file.png"
						 width="16px">
				</c:if> 
			</td>
			<td>${ b.readCount }</td> --%>
		</tr>
		</c:forEach>
	</table>
</section> 
    
		
	                    
	                    <hr style="height: 1px; border:none; background-color: lightgray; width: 860px; margin: 35px 50px 10px 50px;">
	                    <button type="button" onclick="location.href='${pageContext.request.contextPath}/reviewBoard/reviewBoardFrm'" class="write-btn">글쓰기</button>
	                    <div class="search-wrap">
	                        <select name="search" id="search">
	                            <option value="ani_bo_title">제목</option>
	                            <option value="ani_bo_content">내용</option>
	                            <option value="ani_bo_date">날짜</option>
	                            <option value="ani_bo_tag">말머리</option>
	                        </select>
	                        <input type="text" name="query" id="query">
	                        <button type="button" id="bottom-search-btn" onclick="searchFunc();">검색</button>
		                </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>