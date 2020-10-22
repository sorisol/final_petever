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
	
				
			<c:if test="${empty loginUser}">
			<br>
			<div class="empty-login-message">
			<h2>로그인 후 이용해주세요.</h2>
			</div>
			</c:if>


			<c:if test="${not empty loginUser}">
			<h3>총 ${ totalContents }건의 메세지가 있습니다.</h3><!-- 수정 -->
			<hr>
			</c:if>
			<c:forEach items="${ list }" var="b">
				<br>
				<div class="message-detail">
					<div class="message-userTable">
						<span> 
						<img src="${pageContext.request.contextPath}/resources/images/userIcon.png" width="50px" height="50px">
						</span> 
						<c:if test="${b.msgContent.contains('입양신청이 있습니다')}">
							<c:set var="a" value="${fn:indexOf(b.msgContent, ' ')}" />

							<span class="title">${fn:substring(b.msgContent, a, fn:length(b.msgContent)) }</span> 
						</c:if>
						<c:if test="${!b.msgContent.contains('입양신청이 있습니다')}">
							<span class="title">${ b.msgContent }</span> 
						</c:if>
						<span class="message-Date">
							<fmt:parseDate value="${b.msgTime}" var="msgTime" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${msgTime}" pattern="yyyy.MM.dd"/>
						</span>
					</div>	
					<div class="userId">${b.sub }</div>
				</div>
				<div class="msg-background"></div>
				<br>
				<hr>
			</c:forEach>
			<br><br>
			<hr>



	</div>

</section>

<script>
$(".message-detail").on('click', function() {
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
			//console.log(data.msgDetail);
			//console.log(data.msgDetailDate);
			var detail = data.msgDetail;
			var detailDate = data.msgDetailDate;
			//detailDate == detail[i].msgTime.substring(0, 10);
			var html='';
			for(var j in detailDate){
				html += '<div class="message-detail-date">';
				html += detailDate[j].msgTime.substring(0,10);
				html += '</div>';
				for(var i in detail) {
					if(detailDate[j].msgTime.substring(0,10) == detail[i].msgTime.substring(0,10)) {
						if(receiver == detail[i].receiveId) {
							 html += '<div class="messge-detail-content other">';
							if(detail[i].msgContent.includes('입양신청이 있습니다.')){
								html += '<a href="${pageContext.request.contextPath}/apply/applicationView?no='+detail[i].msgContent.substring(0, detail[i].msgContent.indexOf(' '))+'">'
								html += '<div class="message-detail-receive">'+detail[i].msgContent.substring(detail[i].msgContent.indexOf(' '))+'</div>';
								html += '</a>';
							} else {
								html += '<div class="message-detail-receive">'+detail[i].msgContent+'</div>';
							}
						 	html += '<span class="time">'+detail[i].msgTime.substring(11,16)+'</span>';
							html += '</div>';
						}
					
		            
						else if(receiver == detail[i].userId && detail[i].receiveId == $sender) {
							html += '<div class="messge-detail-content mine">';
							html += '<span class="time">'+detail[i].msgTime.substring(11,16)+'</span>';
							if(detail[i].msgContent.includes('입양신청이 있습니다.')){
								html += '<a href="${pageContext.request.contextPath}/apply/applicationView?no='+detail[i].msgContent.substring(0, detail[i].msgContent.indexOf(' '))+'">'
								html += '<div class="message-detail-send">'+detail[i].msgContent.substring(detail[i].msgContent.indexOf(' '))+'</div>';
								html += '</a>';
							} else {
								html += '<div class="message-detail-send">'+detail[i].msgContent+'</div>';
							}
							html += '</div>';
						}
					}
				}
			}
			html += '<div class="sendMsg"><input type="text" name="msgContent">';
			html += '<input type="hidden" value="'+$sender+'" id="detail-receiver">';
			html += '<input type="submit" value="보내기" class="send-btn"></div>';
			$tag.html(html);
			$(":text").focus();
		}
	});
});
$(document).on("click", ".send-btn", function(){
	var sender = '${loginUser.userId}';
	var receiver = $(this).prev().val();
	var message = $(this).prev().prev();
	var $recentMsg = $(this).parent().prev();
	var getdate = $("send-btn.msgTime").val();
	var $title = $(this).parent().parent().prev().children().find(".title");

	//console.log(message);
	//console.log($recentMsg);
	//console.log(receiver);
	//console.log($title);
	//console.log(message.val());
	
	var date = new Date();
	
	$.ajax({
		url: '${pageContext.request.contextPath}/message/messageDetailSend',
		method: 'post',
		data: {
			userId: sender,
			receiveId: receiver,
			msgContent: message.val()
		},
		success: function(res) {
			//console.log(res.msg);
			var html = '';
			var date = new Date ;
			if(res.msg == '성공'){
				html += '</div><div class="messge-detail-content mine">';
				html += '<span class="time">'+moment(new Date()).format('HH:mm')+'</span>';
				html += '<div class="message-detail-send">'+message.val()+'</div>';
				html += '</div>';
				$title.html(message.val());
				message.val('');
				$recentMsg.after(html);
			}
			
		}
	});
	
});
</script>








<jsp:include page="/WEB-INF/views/common/footer.jsp" />