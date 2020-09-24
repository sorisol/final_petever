<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mp-boardFrm.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
	    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>[보호] 퍼그(수컷)을 보호하고 있습니다.</h1>
            <p>#강아지 #3살 #퍼그 #수컷 #강남구 #중성화</p>
            <div class="content">
            	 <form name="boardFrm" id="boardFrm" method="get" action="${pageContext.request.contextPath}/animalboard/insertBoard">
                    <h1>글쓰기</h1>
                    <div class="title">
                        <select name="ani_bo_tag">
                            <option selected disabled hidden>말머리</option>
                            <option value="실종">실종</option>
                            <option value="목격">목격</option>
                            <option value="보호">보호</option>
                            <option value="완료">완료</option>
                        </select>
                        <input type="text" placeholder="제목을 입력해 주세요." name="ani_bo_title">
                    </div>
                    <textarea id="board-content" name="board-content" rows="20"></textarea>
                        <div class="pet-info">
                            <table class="pet-info">
                                <tr>
                                    <th>동물종류</th>
                                    <td>
                                        <input type="checkbox" name="ani_bo_kind" id="ani_bo_kind">
                                        <label for="">강아지</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">고양이</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">기타</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>품종</th>
                                    <td>
                                        <select name="breed" id="breed">
                                            <option value="">말티즈</option>
                                            <option value="">보더콜리</option>
                                            <option value="">비숑</option>
                                            <option value="">시바견</option>
                                            <option value="">요크셔테리어</option>
                                            <option value="">웰시코기</option>
                                            <option value="">포메라니안</option>
                                            <option value="">푸들</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>사이즈</th>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">소형</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">중형</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">대형</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>털길이</th>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">단모종</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">장모종</label>
                                    </td>
                                </tr>
                                <tr>
                                <tr>
                                    <th>나이</th>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">0~2</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">3~5</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">6~8</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">8 이상</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>성별</th>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">암컷</label>
                                    </td>
                                    <td colspan="2">
                                        <input type="checkbox" name="" id="">
                                        <label for="">수컷</label>
                                    </td>
                                </tr>
                                <tr>
                                <tr>
                                    <th>무게</th>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">5 미만</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">5~10</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">10~15</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">15이상</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>접종여부</th>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">미접종</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">접종완료</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    
                        <input type="submit" value="등록" class="btn" id="submitbtn">
                        <input type="button" value="취소" onclick="javascript:history.go(-1)" class="btn">
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
	console.log(oEditors.getById["board-content"].exec("UPDATE_CONTENTS_FIELD", []));
	oEditors.getById["board-content"].exec("UPDATE_CONTENTS_FIELD", []);
	$("#boardFrm").submit();
});
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
