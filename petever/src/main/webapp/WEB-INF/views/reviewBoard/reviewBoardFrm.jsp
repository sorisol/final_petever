<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review-boardFrm.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
	    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>입양후기게시판~~~</h1>
            <p>입양후기 작성 게시판입니다.</p>
            <div class="content">
            	 <form name="boardFrm" id="boardFrm" method="post"
            	 	action="${pageContext.request.contextPath}/reviewBoard/"
            	 	 enctype="multipart/form-data">
                    <h1>글쓰기</h1>
                    <input type="hidden" name="userId" value="honggd" />
                    <div class="title">
                        <input type="text" placeholder="제목을 입력해 주세요." name="aniBoTitle">
                    </div>
                    <textarea id="board-content" name="aniBoContent" rows="50"></textarea>
                    
                    	<hr style="height: 1px; border:none; background-color: lightgray; width: 1000px; margin: 20px 0px;">
                    	<div class="button-wrap">
                        <input type="button" value="취소" onclick="javascript:history.go(-1)" class="btn">
                        <input type="submit" value="등록" class="btn" id="submitbtn">
                    	</div>
                </form>
            </div>
        </section>
    </div>
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "board-content",
 sSkinURI: "${pageContext.request.contextPath}/resources/editor/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});

$("#submitbtn").click(function() {
	//유효성 검사
	//필수 : 제목, 말머리, 내용, 지역
	
	oEditors.getById["board-content"].exec("UPDATE_CONTENTS_FIELD", []);
	$("#boardFrm").submit();
});


</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
