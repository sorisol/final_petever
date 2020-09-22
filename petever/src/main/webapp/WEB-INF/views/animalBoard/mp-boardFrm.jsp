<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mp-board-view.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>[보호] 퍼그(수컷)을 보호하고 있습니다.</h1>
            <p>#강아지 #3살 #퍼그 #수컷 #강남구 #중성화</p>
            <div class="content">
            	 <form name="boardFrm">
                    <div class="title">
                        <select name="tag" id="">
                            <option value="">말머리 선택</option>
                            <option value="">실종</option>
                            <option value="">목격</option>
                            <option value="">보호</option>
                            <option value="">완료</option>
                        </select>
                        <input type="text" placeholder="제목을 입력해 주세요.">
                        <textarea name="board-content" id="board-content" rows="10" cols="100"></textarea>
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
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
