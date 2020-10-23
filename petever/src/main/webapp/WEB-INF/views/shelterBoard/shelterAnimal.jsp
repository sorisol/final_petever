<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shelterAnimal.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>보호소 동물 게시판</h1>
            <p>보호소에 보호, 입양 완료 등 정보를 제공하는 게시판입니다.</p>
            <p></p>
            <div class="content">
                <div class="border">
                    <table class="preference">
                        
                    </table>
                    <hr style="height: 1px; border:none; background-color: #373b44; width: 860px; margin: 35px 50px;">

                    <div class="post-wrap">
                    	<c:forEach items="${ aniList }" var="al">
                    		<table class="shelter-animal">
				                <tr>
				                	<th>공고번호</th>
				                	<td colspan="2">${ al.noticeNo }</td>
				                	<td colspan="5" rowspan="8" style="text-align:center;"><img src="${ al.popfile }" alt="" /></td>
				                </tr>
				                <tr>
				                	<th>품종</th>
				                	<td colspan="2">${ al.kindCd }</td>
				                </tr>
				                <tr>
				                	<th>색상</th>
				                	<td colspan="2">${ al.colorCd }</td>
				                </tr>
				                <tr>
				                	<th>성별</th>
				                	<td colspan="2">${ al.genderCd eq 'M' ? '수컷' : al.genderCd eq 'F' ? '암컷' : '미상' }</td>
				                </tr>
				                <tr>
				                	<th>나이</th>
				                	<c:if test="${ al.age eq '0' }">
				                	<td colspan="2">1년 미만</td>
	                    			</c:if>
	                    			<c:if test="${ al.age >= '1' }">
				                	<td colspan="2">${ al.age } 살</td>
	                    			</c:if>
				                </tr>
				                <tr>
				                	<th>체중</th>
				                	<%-- <td colspan="2">${ al.weight == null? '-' : al.weight } kg</td> --%>
				                	<c:if test="${ al.weight < '1' }">
				                		<td colspan="2">0${ al.weight } kg</td>
				                	</c:if>
				                	<c:if test="${ al.weight >= '1' }">
				                		<td colspan="2">${ al.weight } kg</td>
				                	</c:if>
				                </tr>
				                <tr>
				                	<th>중성화여부</th>
				                	<td colspan="2">${ al.neuterYn == null? '-' : al.neuterYn == 'Y' ? '실시' : al.neuterYn == 'N'? '미실시' : '확인필요' }</td>
				                </tr>
				                <tr>
				                	<th>특이사항</th>
				                	<td colspan="2">${ al.specialMark }</td>
				                </tr>
				                <tr>
				                	<th>보호소이름</th>
				                	<td colspan="2">${ al.careNm }</td>
				                	<th>상태</th>
				                	<td colspan="3">${ al.processState }</td>
				                </tr>
				                <tr>
				                	<th>보호장소</th>
				                	<td colspan="2">${ al.careAddr }</td>
				                	<th>보호소 전화번호</th>
				                	<td colspan="3">${ al.careTel }</td>
				                	
				                </tr>
				                <tr>
				                	<th>보호기관</th>
				                	<td colspan="2">${ al.orgNm }</td>
				                	<th>담당자</th>
				                	<td colspan="1" style="width:70px;">${ al.chargeNm }</td>
				                	<th>담당자 연락처</th>
				                	<td colspan="1" style="width:90px;">${ al.officetel }</td>
				                </tr>
				                <tr>
				                	<th>공고시작일</th>
				                	<td colspan="2"><fmt:formatDate value="${ al.noticeSdt }" pattern="yyyy-MM-dd"/></td>
				                	<th>공고종료일</th>
				                	<td colspan="3"><fmt:formatDate value="${ al.noticeEdt }" pattern="yyyy-MM-dd"/></td>
				                </tr>
                    		</table>
                    	</c:forEach>
                    		<button id="btn-back" onclick="history.back();">목록</button>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>