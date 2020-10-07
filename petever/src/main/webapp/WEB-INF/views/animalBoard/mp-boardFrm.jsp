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
                    <textarea id="board-content" name="aniBoContent" rows="50"></textarea>
                        <div class="pet-info">
                            <table class="pet-info">
                           		<tr>
	                         		<th>특징</th>
	                         		<td colspan="3">
	                         			<input type="text" name="aniBoCha" />
	                         		</td>
                           		</tr>
                            	<tr>
                            		<th>실종/발견 날짜</th>
                            		<td colspan="3">
                            			<input type="date" name="aniBoMissDate" required>
                            		</td>
                            	</tr>
                                <tr>
                            		<th>지역</th>
                            		<td>
                            			<select class="org" name="sido" id="sido"></select>
                            		</td>
                            		<td colspan="2">
                            			<select class="org" name="sigugun" id="sigugun"></select>
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
                                    <td colspan="3">
                                        <select name="aniBoKind" id="aniBoKind">
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
                                        <input type="checkbox" name="aniBoAge" id="0~3" value="3">
                                        <label for="0~3">0~3</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoAge" id="4~7" value="7">
                                        <label for="4~7">4~7</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoAge" id="8~" value="8">
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
                                        <input type="checkbox" name="aniBoSize" id="~5" value="5">
                                        <label for="~5">5 미만</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoSize" id="5~9" value="9">
                                        <label for="5~9">5~9</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="aniBoSize" id="10~" value="10">
                                        <label for="10~">10이상</label>
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
                                        <input type="checkbox" name="aniBoColor" id="갈색" value="갈색">
                                        <label for="갈색">갈색</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    	<hr style="height: 1px; border:none; background-color: lightgray; width: 1000px; margin: 20px 0px;">
                    	<div class="button-wrap">
                        <input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/animalboard'" class="btn">
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

$(function () {
    var area0 = ["서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도"];
    var area1 = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
    var area2 = ["계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"];
    var area3 = ["대덕구", "동구", "서구", "유성구", "중구"];
    var area4 = ["광산구", "남구", "동구", "북구", "서구"];
    var area5 = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
    var area6 = ["남구", "동구", "북구", "중구", "울주군"];
    var area7 = ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"];
    var area8 = ["고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군"];
    var area9 = ["강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군"];
    var area10 = ["제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군"];
    var area11 = ["계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군"];
    var area12 = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
    var area13 = ["광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
    var area14 = ["경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"];
    var area15 = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
    var area16 = ["서귀포시", "제주시", "남제주군", "북제주군"];

	//page load시 시도 select
    $("#sido").each(function () {
        //console.log(this);
        $selectCity = $(this);
        $selectCity.append("<option value=>시/도 선택</option>");
        $.each(eval(area0), function () {
        	$selectCity.append("<option value=" + this + " "+ (this == '${param.sido}' ? 'selected' : '') + ">" + this + "</option>");
        })
        $selectCity.parent().next().children().append("<option value=''>구/군 선택</option>");
    });

	//시도 선택시 시구군 select
    $("#sido").each(function () {
        var area = "area" + $("option", $(this)).index($("option:selected", $(this))); //선택지역의 구군 Array
        //console.log(area);
        var $province = $(this).parent().next().children(); //선택영역 구군 객체
        // console.log($gugun);
        $("option", $province).remove();

        if (area == "area0") {
            $province.append("<option value=''>구/군 선택</option>");
        } else {
        	$province.append("<option value=''>구/군 선택</option>");
        }
    });

	//시도 선택시 시구군 select
    $("#sido").change(function () {
        var area = "area" + $("option", $(this)).index($("option:selected", $(this))); //선택지역의 구군 Array
        console.log(area);
        var $province = $(this).parent().next().children(); //선택영역 구군 객체
        // console.log($gugun);
        $("option", $province).remove();

        if (area == "area0") {
            $province.append("<option value=''>구/군 선택</option>");
        } else {
        	$province.append("<option value=''>구/군 선택</option>");
            $.each(eval(area), function () {
                $province.append("<option value=" + this + ">" + this + "</option>");
            });
        }
    });

	//강아지, 고양이 별 종
    $("input[name=aniBoType]").change(function() {
		var $breed = $(this).val();
		var $selectTag = $("#aniBoKind");
		var dog = ['믹스견', '리트리버', '말티즈', '보더콜리', '불독', '비숑프리제', '시츄', '웰시코기', '요크셔테리어', '치와와', '포메라니안', '푸들'];
		var cat = ['코리안숏헤어', '노르웨이숲', '러시안블루', '렉돌', '먼치킨', '뱅갈', '브리티쉬숏헤어', '샴', '스코티쉬폴드', '터키쉬앙고라'];
		if($breed == '개') {
			$selectTag.html('');
			for(var i in dog) {
				$selectTag.append('<option value="'+dog[i]+'">'+dog[i]+'</option>');
			}
		}
		else if($breed == '고양이'){
			$selectTag.html('');
			for(var i in cat) {
				$selectTag.append('<option value="'+cat[i]+'">'+cat[i]+'</option>');
			}
		}
		else {
			$selectTag.html('');
		}
    });

    //체크박스 라디오버튼처럼 작동하기
	$('input[type=checkbox]').on('change', function() {
		var $chBox = $(this);
		if($chBox.prop('name') == 'aniBoType') {
        	if($chBox.prop('checked')) {
        		$('input[name=aniBoType]').prop('checked', false);
				$chBox.prop('checked', true);
			} 
        }
		else if($chBox.prop('name') == 'aniBoHair') {
        	if($chBox.prop('checked')) {
        		$('input[name=aniBoHair]').prop('checked', false);
				$chBox.prop('checked', true);
			} 
        }
		else if($chBox.prop('name') == 'aniBoAge') {
        	if($chBox.prop('checked')) {
        		$('input[name=aniBoAge]').prop('checked', false);
				$chBox.prop('checked', true);
			} 
        }
		if($chBox.prop('name') == 'aniBoGender') {
        	if($chBox.prop('checked')) {
        		$('input[name=aniBoGender]').prop('checked', false);
				$chBox.prop('checked', true);
			} 
        }
		if($chBox.prop('name') == 'aniBoSize') {
        	if($chBox.prop('checked')) {
        		$('input[name=aniBoSize]').prop('checked', false);
				$chBox.prop('checked', true);
			} 
        }
		if($chBox.prop('name') == 'aniBoColor') {
        	if($chBox.prop('checked')) {
        		$('input[name=aniBoColor]').prop('checked', false);
				$chBox.prop('checked', true);
			} 
        }
	});
	
});


</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
