<%@page import="com.kh.petever.animalboard.model.vo.AnimalAttach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mp-board.css">
    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>유기동물 게시판</h1>
            <p>남은 겨울이 라이너 별 어머니, 불러 덮어 이름과, 까닭입니다.</p>
            <div class="content">
                <div class="border">
                    <form id="searchFrm">
	                    <table class="pet-info">
	                        <tr>
	                            <th>동물종류</th>
	                            <td>
	                                <input type="checkbox" name="aniBoType" id="kind-dog" value="개">
	                                <label for="kind-dog">강아지</label>
	                            </td>
	                            <td>
	                                <input type="checkbox" name="aniBoType" id="kind-cat" value="고양이">
	                                <label for="kind-cat">고양이</label>
	                            </td>
	                            <td style="padding-right: 20px;">
	                                <input type="checkbox" name="aniBoType" id="kind-etc" value="기타">
	                                <label for="kind-etc">기타</label>
	                            </td>
	                            <th>성별</th>
	                            <td>
	                                <input type="checkbox" name="aniBoGender" id="gender-f" value="암컷">
	                                <label for="gender-f">암컷</label>
	                            </td>
	                            <td>
	                                <input type="checkbox" name="aniBoGender" id="gender-m" value="수컷">
	                                <label for="gender-m">수컷</label>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>나이</th>
	                            <td>
	                                <input type="checkbox" name="aniBoAge" id="age-3" value="3">
	                                <label for="age-3">0~3</label>
	                            </td>
	                            <td>
	                                <input type="checkbox" name="aniBoAge" id="age-7" value="7">
	                                <label for="age-7">4~7</label>
	                            </td>
	                            <td>
	                                <input type="checkbox" name="aniBoAge" id="age-8" value="8">
	                                <label for="age-8">8살이상</label>
	                            </td>
	                            <th>색상</th>
	                            <td>
	                                <input type="checkbox" name="aniBoColor" id="color-black" value="검">
	                                <label for="color-black">블랙</label>
	                            </td>
	                            <td>
	                                <input type="checkbox" name="aniBoColor" id="color-white" value="흰">
	                                <label for="color-white">화이트</label>
	                            </td>
	                            <td>
	                                <input type="checkbox" name="aniBoColor" id="color-brown" value="갈">
	                                <label for="color-brown">브라운</label>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>무게</th>
	                            <td>
	                                <input type="checkbox" name="aniBoSize" id="weight-5" value="5">
	                                <label for="weight-5">5kg 미만</label>
	                            </td>
	                            <td>
	                                <input type="checkbox" name="aniBoSize" id="weight-10" value="9">
	                                <label for="weight-10">5~9kg</label>
	                            </td>
	                            <td>
	                                <input type="checkbox" name="aniBoSize" id="weight-15" value="10">
	                                <label for="weight-15">10kg 이상</label>
	                            </td>
	                            <th>털길이</th>
	                            <td>
	                                <input type="checkbox" name="aniBoHair" id="hair-s" value="단모종">
	                                <label for="hair-s">단모종</label>
	                            </td>
	                            <td>
	                                <input type="checkbox" name="aniBoHair" id="hair-l" value="장모종">
	                                <label for="hair-l">장모종</label>
	                            </td>
	                        </tr>
	                        <tr>
	                        	<th>품종</th>
	                        	<td colspan="3">
	                        		<select name="aniBoKind" id="aniBoKind">
	                        			<option selected disabled hidden>품종을 선택하세요</option>
	                        		</select>
	                        	</td>
	                        	<th>지역</th>
	                        	<td>
	                        		<select class="org" name="sido" id="sido"></select>
	                        	</td>
	                        	<td>
	                        		<select class="org" name="sigugun" id="sigugun"></select>
	                        	</td>
	                        	<td>
	                        		<button type="button" id="top-search-btn" onclick="searchFunc();">조회</button>
	                        	</td>
	                        </tr>
	                    </table>
	
	                    <hr style="height: 1px; border:none; background-color: lightgray; width: 860px; margin: 30px 50px;">
						
	                    <div class="post-wrap">
	                    <c:forEach items="${boardList}" var="b">
	                        <div class="post">
	                    		<a href="${ pageContext.request.contextPath }/animalboard/boardView?no=${b.aniBoId}">
		                    	<c:forEach items="${attachList}" var="a">
		                        	<c:if test="${ a.aniBoId.equals(b.aniBoId)}">
		                            	<img src="${pageContext.request.contextPath}/resources/editor/multiupload/${a.aniAtRenamedName}">
		                        	</c:if>
		                    	</c:forEach>
		                            <br>
		                            <span class="tag">[${b.aniBoTag }]</span>
		                            <span id="post-title">${b.aniBoTitle}</span>
		                            <p>종류 : <strong>
		                   				<c:forEach items="${b.aniBoType}" var="t">
		                            		${t}
		                    			</c:forEach>
		                            </strong></p>
		                            <p>지역 : <strong>${b.aniBoLocal}</strong></p>
		                            <hr>
		                            <span>${b.userId}</span>
		                            <span>
		                            <!-- String -> Date -> yyy.MM.dd형식으로 바꾸기 -->
		                            <fmt:parseDate value="${b.aniBoDate}" var="aniBoDate" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate value="${aniBoDate}" pattern="yyyy.MM.dd"/>
		                            </span>
		                    	</a>
	                        </div>
	                    </c:forEach>
	                    </div>
	                    <hr style="height: 1px; border:none; background-color: lightgray; width: 860px; margin: 35px 50px 10px 50px;">
	                    <button type="button" onclick="location.href='${pageContext.request.contextPath}/animalboard/boardFrm'" class="write-btn">글쓰기</button>
	                    <div class="search-wrap">
	                        <select name="search" id="search">
	                            <option value="aniBoTitle">제목</option>
	                            <option value="aniBoContent">내용</option>
	                            <option value="aniBoTag">말머리</option>
	                        </select>
	                        <input type="text" name="aniBoTitle" id="query">
	                        <button type="button" id="bottom-search-btn" onclick="searchFunc();">검색</button>
		                </div>
                    </form>
                    <div class="pageBar">
						${ pageBar }
					</div>
                </div>
            </div>
        </section>
    </div>
<script>
function searchFunc() {
	var formData = $("#searchFrm").serialize();
	//var formData = $("form[name=searchFrm]").serialize();
	console.log(formData);
	$.ajax({
		url: '${pageContext.request.contextPath}/animalboard/search',
		dataType: 'json',
		method: 'post',
		data: formData,
		success: function(data) {
			var $post = $('.post-wrap');
			$post.html('');
			var html = '';
			if(data.boardList == null || data.boardList.length == 0) {
				html += '<p align="center">조회된 게시물이 없습니다.</p>';		
			}
			else {
				/* console.log(data);
				console.log(data.attachList); */
				for(var i in data.boardList) {
					var b = data.boardList[i];
					html += '<div class="post">';
					html += '<a href="${ pageContext.request.contextPath }/animalboard/boardView?no='+b.aniBoId+'">';

					//사진
            		for(var j in data.fileList) {
						var f = data.fileList[j];
						if(b.aniBoId == f.aniBoId) {
							html += '<img src="${pageContext.request.contextPath}/resources/editor/multiupload/'+f.aniAtRenamedName+'">';
						}
                    }
					if(b.aniBoTag == '실종')
						html += '<br><span class="tag missing">['+b.aniBoTag+']</span>';
					else if(b.aniBoTag == '목격')
						html += '<br><span class="tag sighting">['+b.aniBoTag+']</span>';
					else if(b.aniBoTag == '보호')
						html += '<br><span class="tag protect">['+b.aniBoTag+']</span>';
					else
						html += '<br><span class="tag">['+b.aniBoTag+']</span>';
					html += '<span id="post-title">'+b.aniBoTitle+'</span>';
					html += '<p>종류 : <strong>'+b.aniBoType+'</strong></p>';
					html += '<p>지역 : <strong>'+b.aniBoLocal+'</strong></p><hr>';
					html += '<span>'+b.userId+'</span>';
					html += '<span>'+b.aniBoDate.substring(0, 10).replaceAll('-', '.')+'</span>';
					html += '</a></div>';
				}
			}
			$post.html(html);
		},
		error: function(xhr, status, err) {
			console.log("처리실패", xhr, status, err);
		}
	});
}

$(function() {	
	$("#search").on("change", function() {
		var $query = $("#query");
		var $search = $("#search");

		$query.attr('name', $(this).val());

		if($search.val() == 'aniBoTag') {
			$query.hide();
			$query.replaceWith('<select id="query" name="aniBoTag"></select>');
			$search.next().append('<option value="실종">실종</option>');
			$search.next().append('<option value="목격">목격</option>');
			$search.next().append('<option value="보호">보호</option>');
			$search.next().append('<option value="완료">완료</option>');
		}
		else
			$("#query").replaceWith('<input type="text" name="'+$search.val()+'" id="query">');
		//console.log($("#search").val());
		//console.log($("#search").next().html());
	});
	var tag = document.getElementsByClassName("tag");
	for(var i=0; i<tag.length; i++) {
           if(tag[i].innerHTML == '[실종]')
               tag[i].setAttribute('class', 'tag missing');
           else if(tag[i].innerHTML == '[목격]')
               tag[i].setAttribute('class', 'tag sighting');
           else if(tag[i].innerHTML == '[보호]')
               tag[i].setAttribute('class', 'tag protect');
           
   	}
	$('input[type=checkbox]').on('change', function() {
		var $chBox = $(this);
		if($chBox.prop('name') == 'aniBoAge') {
        	if($chBox.prop('checked')) {
        		$('input[name=aniBoAge]').prop('checked', false);
				$chBox.prop('checked', true);
			} 
        }
		if($chBox.prop('name') == 'aniBoSize') {
        	if($chBox.prop('checked')) {
        		$('input[name=aniBoSize]').prop('checked', false);
				$chBox.prop('checked', true);
			} 
        }
	});
	//강아지, 고양이 별 종
	var $breed = $(this).val();
	var $selectTag = $("#aniBoKind");
	var dog = ['믹스견', '리트리버', '말티즈', '보더콜리', '불독', '비숑프리제', '시츄', '웰시코기', '요크셔테리어', '치와와', '포메라니안', '푸들'];
	var cat = ['코리안숏헤어', '노르웨이숲', '러시안블루', '렉돌', '먼치킨', '뱅갈', '브리티쉬숏헤어', '샴', '스코티쉬폴드', '터키쉬앙고라'];
	for(var i in dog) {
		$selectTag.append('<option value="'+dog[i]+'">'+dog[i]+'</option>');
	}
	for(var i in cat) {
		$selectTag.append('<option value="'+cat[i]+'">'+cat[i]+'</option>');
	}
		
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
        var $province = $(this).parent().next().children(); //선택영역 구군 객체
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
});
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
