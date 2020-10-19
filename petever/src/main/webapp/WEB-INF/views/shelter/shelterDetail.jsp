<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shelterDetial.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6d9cbd0253f8820add2f027978ada36"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>




    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>유기 동물 보호소</h1>
            <p>보호중인 동물들은 상시로 공고하고 있습니다.</p>
            <p></p>
            <div class="content">
                <div class="border">
                    <table class="preference">
                        
                    </table>
                    <hr style="height: 1px; border:none; background-color: #373b44; width: 860px; margin: 35px 50px;">

                    <div class="post-wrap">
						
                    		<table class="shelter-animal">
				                <tr>
				                	<th>보호센터명</th>
				                	<td colspan="2">${ sab.careName }</td>
				                	<th>전화번호</th>
				                	<td colspan="2"  style="border-right: 0px solid white;">${ sab.careTel }</td>
				                </tr>
				                <tr>
				                	<th>관리기관명</th>
				                	<td colspan="2">${ sab.orgName }</td>
				                	<th>동물보호센터유형</th>
				                	<td colspan="2"  style="border-right: 0px solid white;">${ sab.divisionName }</td>
				                </tr>
				                <tr>
				                	<th>구조대상동물</th>
				                	<td colspan="2">${ sab.saveAnimal }</td>
				                	<th>동물보호센터지정일자</th>
				                	<fmt:parseDate value="${ sab.dsignationDate }" pattern="yyyy-MM-dd HH:mm:ss" var="dsignationDate"/>
				                	<td colspan="2" style="border-right: 0px solid white;"><fmt:formatDate value="${ dsignationDate }" pattern="yyyy-MM-dd"/></td>
				                </tr>
				                <tr>
				                	<th>보호센터주소</th>
				                	<td colspan="5" style="border-right: 0px solid white;">${ sab.careAddr }</td>
				                </tr>
				                <tr>
				                	<th>평일운영시작시각</th>
				                	<td colspan="2">${ sab.weekOprStime }</td>
				                	<th>평일운영종료시각</th>
				                	<td colspan="2" style="border-right: 0px solid white;">${ sab.weekOprEtime }</td>
				                </tr>
				                <tr>
				                	<th>주말운영시작시각</th>
				                	<td colspan="2">${ sab.weekendOprStime eq ':' ? '-' : sab.weekendOprStime }</td>
				                	<th>주말운영종료시각</th>
				                	<td colspan="2" style="border-right: 0px solid white;">${ sab.weekendOprEtime eq ':' ? '-' : sab.weekendOprEtime }</td>
				                </tr>
				                <tr>
				                	<th>휴무일</th>
				                	<td colspan="2">${ sab.closeDay }</td>
				                	<th>데이타기준일자</th>
				                	<fmt:parseDate value="${ sab.dataStdDate }" pattern="yyyy-MM-dd HH:mm:ss" var="dataStdDate"/>
				                	<td colspan="2" style="border-right: 0px solid white;"><fmt:formatDate value="${ dataStdDate }" pattern="yyyy-MM-dd"/></td>
				                </tr>
				                <tr>
				                	<th>수의사수</th>
				                	<td colspan="2">${ sab.vetPersonCnt } 명</td>
				                	<th>사양관리수</th>
				                	<td colspan="2" style="border-right: 0px solid white;">${ sab.specsPersonCnt } 명</td>
				                </tr>
				                <tr>
				                	<th>보호소 위치</th>
				                	<c:if test="${ sab.lat != null}">
				                	<td colspan="5" style="border-right: 0px solid white;">
				                		<div class="map_wrap">
										    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
										    <!-- 지도타입 컨트롤 div 입니다 -->
										    <div class="custom_typecontrol radius_border">
										        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
										        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
										    </div>
										    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
										    <div class="custom_zoomcontrol radius_border"> 
										        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
										        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
										    </div>
										</div>
				                	</td>
				                	</c:if>
				                	<c:if test="${ sab.lat == null}">
				                		<td colspan="5" style="border-right: 0px solid white;">표기된 정보가 없습니다.</td>
				                	</c:if>
				                </tr>
				                
                    		</table>
                    		<button id="btn-back" onclick="history.back();">목록</button>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>

	<c:if test="${not empty sab.lat}">
		var $lat = ${sab.lat};
		var $lng = ${sab.lng};
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng($lat, $lng), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng($lat, $lng); 
	
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
		function setMapType(maptype) { 
		    var roadmapControl = document.getElementById('btnRoadmap');
		    var skyviewControl = document.getElementById('btnSkyview'); 
		    if (maptype === 'roadmap') {
		        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
		        roadmapControl.className = 'selected_btn';
		        skyviewControl.className = 'btn';
		    } else {
		        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
		        skyviewControl.className = 'selected_btn';
		        roadmapControl.className = 'btn';
		    }
		}
		// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		function zoomIn() {
		    map.setLevel(map.getLevel() - 1);
		}
		
		// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		function zoomOut() {
		    map.setLevel(map.getLevel() + 1);
		}
	</c:if>
	    
	


</script>