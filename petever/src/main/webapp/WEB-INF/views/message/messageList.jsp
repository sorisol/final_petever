<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/message.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />


<section id="board-container" class="msg-content">
	<div class="main-content">
	
		<%--
	<div id=msg-container>
		<div class="">
		
		
		</div>
		<table id="msg-list-table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>보낸 사람</th>
				<th>작성일</th>
			</tr>
			<c:forEach items="${ list }" var="b">
				<tr data-board-no="${ b.msgNo }">
					<td>${ b.msgNo }</td>
					<td>${ b.msgContent }</td>
					<td>${ b.receiveId }</td>
					<td><fmt:formatDate value="${b.msgTime}"
							pattern="yyyy.MM.dd HH:mm:ss" /></td>
							
				</tr>
				
				
					<c:if test="${loginUser.userId eq b.receiveId}">
		
			</c:forEach>
		</table>
	</div> 
	 --%>
		
			
			
			<c:if test="${empty loginUser}">
			<br>
			<div class="empty-login-message">
			<h2>로그인 후 이용해주세요.</h2>
			</div>
			</c:if>


			<c:if test="${not empty loginUser}">
			<h3>총 ${ totalContents }건의 메세지가 있습니다.</h3>
			<hr>
			</c:if>
		<c:forEach items="${ list }" var="b">
			<c:if test="${loginUser.userId eq b.receiveId || loginUser.userId eq b.userId }">
				<c:if test="${loginUser.userId eq b.receiveId }">

					<br>
					<div class="message-detail">
						<div class="message-userTable">
							<span> 
							<img src="${pageContext.request.contextPath}/resources/images/userIcon.png" width="50px" height="50px">
							</span> 
							<span>${ b.msgContent }</span> 
							<span class="message-Date">
									${b.msgTime}
								<fmt:parseDate value="${b.msgTime}" var="msgTime" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${b.msgTime}" pattern="yyyy.MM.dd"/>
							</span>
						</div>
						<div class="userId">${b.userId }</div>
					</div>
					<div class="msg-background"></div>
					<br>
					<hr>
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
		<!-- <div class="sendBtn">
			<input type="text" name="msgContent"> <input type="submit"
				value="보내기">

		</div> -->

		<br><br>
		<hr>



	</div>

</section>

<script>
$(".message-detail").on('click', function() {
	console.log(moment(new Date()).format('YYYY-MM-DD HH:mms'));
	console.log($(this).next());
	var $tag = $(this).next();
	$tag.toggle();
	var $sender = $(this).find("div.userId").text(); //sinsa
	var receiver = '${loginUser.userId}'; //honggd
	$.ajax({
		url: '${pageContext.request.contextPath}/message/messageDetail',
		method: 'post',
		data: {
			userId: $sender,
			receiveId: receiver
		},
		success: function(data) {
			console.log(data);
			var html='';
			for(var i in data) {
				if(receiver == data[i].receiveId) {
					html += '<div class="message-detail-date">';
					html += data[i].msgTime;
					html += '</div><br>';
					html += '<div class="messge-detail-content"><span>';
					if(data[i].msgContent.includes('입양신청이 도착했습니다.')){
						console.log(data[i].msgContent.substring(0, data[i].msgContent.indexOf(' ')));
						html += '<a href="${pageContext.request.contextPath}/apply/applicationView?no='+data[i].msgContent.substring(0, data[i].msgContent.indexOf(' '))+'">'
						html += '<div class="message-detail-receive">'+data[i].msgContent.substring(data[i].msgContent.indexOf(' '))+'</div>';
						html += '</a>';
					} else {
						html += '<div class="message-detail-receive">'+data[i].msgContent+'</div>';
					}
					html += '</span></div>';
				}
				else if(receiver == data[i].userId && data[i].receiveId == $sender) {
					html += '<div class="message-detail-date">';
					html += data[i].msgTime;
					html += '</div><br>';
					html += '<div class="messge-detail-content"><span>';
					html += '<div class="message-detail-send">'+data[i].msgContent+'</div>';
					html += '</span></div>';
				}
			}
			html += '<div class="sendBtn"><input type="text" name="msgContent">';
			html += '<input type="hidden" value="'+$sender+'" id="detail-receiver">';
			html += '<input type="submit" value="보내기" id="send-btn"></div>';
			$tag.html(html);
		}
	});
});
$(document).on("click", "#send-btn", function(){
	var sender = '${loginUser.userId}';
	var receiver = $("#detail-receiver").val();
	var message = $("input[name=msgContent]");
	var $recentMsg = $(this).parent().prev();
	console.log($recentMsg);
	var getdate = $("send-btn.msgTime").val();
	
	var date = new Date();
	
	
	console.log(sender);
	console.log(receiver);
	$.ajax({
		url: '${pageContext.request.contextPath}/message/messageDetailSend',
		method: 'post',
		data: {
			userId: sender,
			receiveId: receiver,
			msgContent: message.val()
		},
		success: function(res) {
			console.log(res.msg);
			var html = '';
			var date = new Date ;
			if(res.msg == '성공'){
			//	console.log(date.format('yyyy-MM-dd'));
				html += '<div class="message-detail-date">';
				html += moment(new Date()).format('YYYY-MM-DD HH:mm');
				html += '</div></br><div class="messge-detail-content"><span>';
				html += '<div class="message-detail-send">'+message.val()+'</div>';
				html += '</span></div>';
				message.val('');
				$recentMsg.after(html);
			}
			
		}
	});
	
});
</script>








<jsp:include page="/WEB-INF/views/common/footer.jsp" />