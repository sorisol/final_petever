<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shelterBoard.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<script>

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
    $("select[name=sido]").each(function () {
        console.log(this);
        $selectCity = $(this);
        $selectCity.append("<option value=>시/도 선택</option>");
        $.each(eval(area0), function () {
        	$selectCity.append("<option value=" + this + " "+ (this == '${param.sido}' ? 'selected' : '') + ">" + this + "</option>");
        })
        $selectCity.parent().next().children().append("<option value=''>구/군 선택</option>");
    });

	//시도 선택시 시구군 select
    $("select[name=sido]").each(function () {
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
                $province.append("<option value=" + this + " "+ (this == '${param.sigugun}' ? 'selected' : '') + ">" + this + "</option>");
            });
        }
    });

	//시도 선택시 시구군 select
    $("select[name=sido]").change(function () {
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

    //체크박스 중복 체크 X
 	$("input[name=kind]").click(function() {
		if($(this).prop('checked')) {
			$("input[name=kind]").prop('checked', false);
			$(this).prop('checked', true);
		}
	});

	$("input[name=gender]").click(function() {
		if($(this).prop('checked')) {
			$("input[name=gender]").prop('checked', false);
			$(this).prop('checked', true);
		}
	});
	
	$("input[name=age]").click(function() {
		if($(this).prop('checked')) {
			$("input[name=age]").prop('checked', false);
			$(this).prop('checked', true);
		}
	});
	
	$("input[name=color]").click(function() {
		if($(this).prop('checked')) {
			$("input[name=color]").prop('checked', false);
			$(this).prop('checked', true);
		}
	});

	$("input[name=weight]").click(function() {
		if($(this).prop('checked')) {
			$("input[name=weight]").prop('checked', false);
			$(this).prop('checked', true);
		}
	});

	$("input[name=state]").click(function() {
		if($(this).prop('checked')) {
			$("input[name=state]").prop('checked', false);
			$(this).prop('checked', true);
		}
	});
});

	function shelterAnidetail(desertionNo){
		var deserNo = desertionNo;
		console.log(deserNo);
		
		location.href="${pageContext.request.contextPath}/shelterBoard/shelterAni?deserNo=" + deserNo;
	}
	
</script>

    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>유기동물 게시판</h1>
            <p>남은 겨울이 라이너 별 어머니, 불러 덮어 이름과, 까닭입니다.</p>
            <div class="content">
                <div class="border">
					<form action="">
                    <table class="preference">
                        <tr>
                            <th>동물종류</th>
                            <td>
                                <input type="checkbox" name="kind" id="kind-dog" value="개" ${ param.kind eq '개' ? 'checked' : ''}>
                                <label for="kind-dog">강아지</label>
                            </td>
                            <td>
                                <input type="checkbox" name="kind" id="kind-cat" value="고양이" ${ param.kind eq '고양이' ? 'checked' : ''}>
                                <label for="kind-cat">고양이</label>
                            </td>
                            <td style="padding-right: 20px;">
                                <input type="checkbox" name="kind" id="kind-etc" value="기타" ${ param.kind eq '기타' ? 'checked' : ''}>
                                <label for="kind-etc">기타</label>
                            </td>
                            <th>성별</th>
                            <td>
                                <input type="checkbox" name="gender" id="gender-f" value="F" ${ param.gender eq 'F' ? 'checked' : ''}>
                                <label for="gender-f">암컷</label>
                            </td>
                            <td>
                                <input type="checkbox" name="gender" id="gender-m" value="M" ${ param.gender eq 'M' ? 'checked' : ''}>
                                <label for="gender-m">수컷</label>
                            </td>
                        </tr>
                        <tr>
                            <th>나이</th>
                            <td>
                                <input type="checkbox" name="age" id="age-3" value="3" ${ param.age eq '3' ? 'checked' : ''}>
                                <label for="age-3">0~3</label>
                            </td>
                            <td>
                                <input type="checkbox" name="age" id="age-7" value="7" ${ param.age eq '7' ? 'checked' : ''}>
                                <label for="age-7">4~7</label>
                            </td>
                            <td>
                                <input type="checkbox" name="age" id="age-8" value="8" ${ param.age eq '8' ? 'checked' : ''}>
                                <label for="age-8">8살이상</label>
                            </td>
                            <th>색상</th>
                            <td>
                                <input type="checkbox" name="color" id="color-black" value="검" ${ param.color eq '검' ? 'checked' : ''}>
                                <label for="color-black">블랙</label>
                            </td>
                            <td>
                                <input type="checkbox" name="color" id="color-white" value="흰" ${ param.color eq '흰' ? 'checked' : ''}>
                                <label for="color-white">화이트</label>
                            </td>
                            <td>
                                <input type="checkbox" name="color" id="color-brown" value="갈" ${ param.color eq '갈' ? 'checked' : ''}>
                                <label for="color-brown">브라운</label>
                            </td>
                        </tr>
                        <tr>
                            <th>무게</th>
                            <td>
                                <input type="checkbox" name="weight" id="weight-5" value="5" ${ param.weight eq '5' ? 'checked' : ''}>
                                <label for="weight-5">5kg 미만</label>
                            </td>
                            <td>
                                <input type="checkbox" name="weight" id="weight-10" value="9" ${ param.weight eq '9' ? 'checked' : ''}>
                                <label for="weight-10">5~9kg</label>
                            </td>
                            <td>
                                <input type="checkbox" name="weight" id="weight-15" value="10" ${ param.weight eq '10' ? 'checked' : ''}>
                                <label for="weight-15">10kg 이상</label>
                            </td>
                            <th>상태</th>
                            <td>
                                <input type="checkbox" name="state" id="state-ing" value="보호" ${ param.state eq '보호' ? 'checked' : ''}>
                                <label for="state-ing">보호중</label>
                            </td>
                            <td>
                                <input type="checkbox" name="state" id="stage-end" value="종료" ${ param.state eq '종료' ? 'checked' : ''}>
                                <label for="stage-end">종료</label>
                            </td>
                        </tr>
                        <tr>
                        	<th>지역</th>
                        	<td>
                        		<select class="org" name="sido" id="sido"></select>
                        	</td>
                        	<td>
                        		<select class="org" name="sigugun" id="sigugun"></select>
                        	</td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td colspan="2">
                        		<input type="submit" id="btn-search" value="조회"/>
                        	</td>
                        </tr>
                    </table>
					</form>
                    <hr style="height: 1px; border:none; background-color: lightgray;; width: 860px; margin: 35px 50px;">

                    <div class="post-wrap">
                    	<c:forEach items="${ shelterBoardList }" var="sbl" >
                    		<div class="post" onclick="shelterAnidetail('${ sbl.desertionNo }')">
                    			<img src="${ sbl.popfile }" alt="" />
                    			<br />
                    			<p>종류 : <b>${ sbl.kindCd }</b></p>

                    			<c:if test="${ sbl.age eq '0' }">
                    			<p>나이 : <b>1년 미만</b></p>
                    			</c:if>
                    			<c:if test="${ sbl.age >= '1' }">
                    			<p>나이 : <b>${ sbl.age } 살</b></p>
                    			</c:if>
                    			<hr />
                    			<p style="float:left;"><b>${ sbl.processState }</b></p>
                    			<p><b>${ sbl.careNm }</b></p>
                    		</div>
                    	</c:forEach>
                    </div>
                    <div class="search">
                        ${ pageBar }
                    </div>
                </div>
            </div>
        </section>
    </div>
    
    <button type="button" onclick="location.href='${ pageContext.request.contextPath }/shelterBoard/shelterDB'" style="display:none;">DB만들기</button>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>