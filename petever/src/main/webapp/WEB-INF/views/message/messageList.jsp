<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/message.css">


<jsp:include page="/WEB-INF/views/common/header.jsp"/>



<section id="board-container" class="msg-content">
	<p>총 ${ totalContents }건의 게시물이 있습니다.</p>
	<div id=msg-container>
	<table id="msg-list-table">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${ list }" var="b">
		<tr data-board-no="${ b.msgNo }">
			<td>${ b.msgNo }</td>
			<td>${ b.msgContent }</td>
			<td>${ b.userId }</td>
			<td><fmt:formatDate value="${ b.msgTime }" type="both"/></td>
		</tr>
		</c:forEach>
	</table>
	</div>	
</section> 












<jsp:include page="/WEB-INF/views/common/footer.jsp"/>