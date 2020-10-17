<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/message.css">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<input type="hidden" name="userId" value="${loginUser.userId}" />
<section id="board-container" class="msg-content">
	<div class="main-content">
		<p>총 ${ totalContents }건의 메세지가 있습니다.</p>
		<hr>
		<div class="message-detail">
			<div class="message-userTable">
				<span> <img
					src="${pageContext.request.contextPath}/resources/images/userIcon.png"
					width="50px" height="50px">
				</span> 
				<input type="button" value="확인" class="btn" />
				<span>으아악</span> <span class="message-Date"> <fmt:parseDate
						value="${b.msgTime}" var="msgTime" pattern="yyyy-MM-dd HH:mm:ss" />
					<fmt:formatDate value="${msgTime}" pattern="yyyy.MM.dd" />
				</span>
				<div class="userId">honggd</div>
			</div>
			<div class="result"></div>
		</div>
		<c:forEach items="${ list }" var="b">
			<c:if
				test="${loginUser.userId eq b.receiveId || loginUser.userId eq b.userId }">
				<c:if test="${loginUser.userId eq b.receiveId}">
					<br>
					<div class="message-detail">
						<div class="message-userTable">
							<span> <img
								src="${pageContext.request.contextPath}/resources/images/userIcon.png"
								width="50px" height="50px">
							<input type="button" value="확인" class="btn" />
							</span> <span>${ b.msgContent }</span> <span class="message-Date">
								<fmt:parseDate value="${b.msgTime}" var="msgTime"
									pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
									value="${msgTime}" pattern="yyyy.MM.dd" />
							</span>
						<div class="userId">${b.userId }</div>
						</div>
					</div>
				</c:if>
			</c:if>
		</c:forEach>
		<%-- <c:forEach items="${list }" var="b">
			<div class="msg-background">
				<div class="message-detail-date">
					<fmt:formatDate value="${b.msgTime}" pattern="yyyy.MM.dd" />
				</div>
				<br>
				<c:if test="${loginUser.userId != b.userId }">
					<div class="messge-detail-content">
						<span>
							<div class="message-detail-receive">${b.msgContent}</div>
						</span>
					</div>
				</c:if>
				<c:if test="${loginUser.userId == b.userId }">
					<div class="messge-detail-content">
						<span>
							<div class="message-detail-send">${b.msgContent }</div>
						</span>
					</div>
				</c:if>
			</div>
		</c:forEach> --%>
		<div class="sendBtn">
			<input type="text" name="msgContent"> <input type="submit"
				value="보내기">
		</div>
		<hr>
	</div>
</section>
<script>
	$(".message-detail").on('click', function() {
		var $tag = $(this);
		$.ajax({
			url : '${pageContext.request.contextPath}/message/messageDetail',
			method : 'post',
			data : {
				userId : $(this).find("div.userId").text(),
				receiveId : '${loginUser.userId}'
			},
			success : function(data) {
				console.log(data);
				var ht = '';
				for ( var i in data) {
					ht += '<div class="msg-background">';
					ht += '<div class="message-detail-date">';
					ht += data[i].msgTime;
					ht += '</div>';
					ht += '</div>';
				}
				$tag.after().html();
			}

		});
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />