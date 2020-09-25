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
            	 <form name="boardFrm" id="boardFrm" method="post"
            	 	action="${pageContext.request.contextPath}/animalboard/insertBoard"
            	 	 enctype="multipart/form-data">
                    <h1>글쓰기</h1>
                    <input type="hidden" name="userId" value="honggd" />
                    <div class="title">
                        <select name="aniBoTag">
                            <option selected disabled hidden>말머리</option>
                            <option value="실종">실종</option>
                            <option value="목격">목격</option>
                            <option value="보호">보호</option>
                            <option value="완료">완료</option>
                        </select>
                        <input type="text" placeholder="제목을 입력해 주세요." name="aniBoTitle">
                    </div>
                    <textarea id="board-content" name="aniBoContent" rows="50" style="minwidth=''"></textarea>
                        <div class="pet-info">
                            <table class="pet-info">
                           		<tr>
	                         		<th>특징</th>
	                         		<td colspan="2">
	                         			<input type="text" name="aniBoCha" />
	                         		</td>
                           		</tr>
                            	<tr>
                            		<th>실종/발견 날짜</th>
                            		<td colspan="4">
                            			<input type="date" name="aniBoMissDate" required>
                            		</td>
                            	</tr>
                                <tr>
                            		<th>지역</th>
                            		<td colspan="4">
                            			<input type="text" name="aniBoLocal" required/>
                            		</td>
                            	</tr>
                                <tr>
                                    <th>동물종류</th>
                                    <td>
                                        <input type="checkbox" name="aniBoType" id="개" value="개">
                                        <label for="개">개</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoType" id="고양이" value="고양이">
                                        <label for="고양이">고양이</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoType" id="기타" value="기타">
                                        <label for="기타">기타</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>품종</th>
                                    <td colspan="4">
                                        <select name="aniBoKind" id="aniBoKind">
                                            <option value="말티즈">말티즈</option>
                                            <option value="보더콜리">보더콜리</option>
                                            <option value="비숑">비숑</option>
                                            <option value="시바견">시바견</option>
                                            <option value="요크셔테리어">요크셔테리어</option>
                                            <option value="웰시코기">웰시코기</option>
                                            <option value="포메라니안">포메라니안</option>
                                            <option value="푸들">푸들</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>털길이</th>
                                    <td>
                                        <input type="checkbox" name="aniBoHair" id="단모종" value="단모종"> 
                                        <label for="단모종">단모종</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoHair" id="장모종" value="장모종">
                                        <label for="장모종">장모종</label>
                                    </td>
                                </tr>
                                <tr>
                                <tr>
                                    <th>나이</th>
                                    <td>
                                        <input type="checkbox" name="aniBoAge" id="0~2" value="0~2">
                                        <label for="0~2">0~2</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoAge" id="3~5" value="3~5">
                                        <label for="3~5">3~5</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoAge" id="6~8" value="6~8">
                                        <label for="6~8">6~8</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoAge" id="8~" value="8이상">
                                        <label for="8~">8 이상</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>성별</th>
                                    <td>
                                        <input type="checkbox" name="aniBoGender" id="암컷" value="암컷">
                                        <label for="암컷">암컷</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoGender" id="수컷" value="수컷">
                                        <label for="수컷">수컷</label>
                                    </td>
                                </tr>
                                <tr>
                                <tr>
                                    <th>무게(kg)</th>
                                    <td>
                                        <input type="checkbox" name="aniBoSize" id="~5" value="5미만">
                                        <label for="~5">5 미만</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoSize" id="5~10" value="5~10">
                                        <label for="5~10">5~10</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoSize" id="10~15" value="10~15">
                                        <label for="10~15">10~15</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoSize" id="15~" value="15이상">
                                        <label for="15~">15이상</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>털색</th>
                                    <td>
                                        <input type="checkbox" name="aniBoColor" id="흰색" value="흰색">
                                        <label for="흰색">흰색</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoColor" id="검은색" value="검은색">
                                        <label for="검은색">검은색</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoColor" id="회색" value="회색">
                                        <label for="회색">회색</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoColor" id="갈색" value="갈색">
                                        <label for="갈색">갈색</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
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
	
	oEditors.getById["board-content"].exec("UPDATE_CONTENTS_FIELD", []);
	$("#boardFrm").submit();
});
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
