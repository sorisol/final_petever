
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adoption-application.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <section>
        <div class="adopt">
        <h1>Petever 입양신청</h1>
        <a href="${pageContext.request.contextPath}/animalboard/boardView?no=${adopt.aniBoId}" style="margin: 28px;">
        	<span class="title">[${animal.aniBoTag }]${animal.aniBoTitle}</span>
        	<span>글에 대한 입양 신청서입니다.</span>
        </a>
            <p>신청인 정보</p>
            <label for="senderId">◾ 아이디</label>
            <p>${adopt.senderId}</p>
            <label for="senderLocal">◾ 주소</label>
            <p>${adopt.senderLocal}</p>
            <label for="senderPhone">◾ 전화번호</label>
            <p>${adopt.senderPhone}</p>
            <%-- <label for="senderEmail">◾ 이메일 주소</label>
            <p>${adopt.senderEmail}</p> --%>
            <label for="senderJob">◾ 직업</label>
            <p>${adopt.senderJob}</p>
            <label for="senderHome">◾ 주거형태</label>
            <select name="senderHome" id="type">
            	<option value="단독주택" ${adopt.senderHome eq '단독주택' ? 'selected' : ''}>단독주택</option>
            	<option value="아파트" ${adopt.senderHome eq '아파트' ? 'selected' : ''}>아파트</option>
            	<option value="전원주택 / 다세대주택" ${adopt.senderHome.contains('전원주택') ? 'selected' : ''}>전원주택 / 다세대주택</option>
            	<option value="원룸" ${adopt.senderHome eq '원룸' ? 'selected' : ''}>원룸</option>
            	<option value="오피스텔" ${adopt.senderHome eq '오피스텔' ? 'selected' : ''}>오피스텔</option>
            </select>
            <label for="Q1">◾ 유기동물이 지낼 곳은?</label>
            <select name="A1" id="A1">
            	<option value="집안" ${adopt.a1 eq '집안' ? 'selected' : ''}>집안</option>
            	<option value="회사" ${adopt.a1 eq '회사' ? 'selected' : ''}>회사</option>
            	<option value="마당" ${adopt.a1 eq '마당' ? 'selected' : ''}>마당</option>
            </select>
            <label for="Q2">◾ 전원주택일 경우 뒷마당 또는 앞마당에 담이 설치되어있습니까?</label>
            <input type="radio" name="A2" id="A2-Y" value="예" ${adopt.a2 eq '예' ? 'checked' : ''}>
            <label for="A2-Y" class="radio-label">예</label>
            <input type="radio" name="A2" id="A2-N" value="아니오" ${adopt.a2 eq '아니오' ? 'checked' : ''}>
            <label for="A2-N" class="radio-label">아니오</label>
            <label for="Q3">◾ 유기동물의 주 책임자</label>
            <select name="A3" id="A3">
            	<option value="본인(신청인)" ${adopt.a3.contains('본인') ? 'selected' : ''}>본인(신청인)</option>
            	<option value="배우자" ${adopt.a3 eq '배우자' ? 'selected' : ''}>배우자</option>
            	<option value="형제" ${adopt.a3 eq '형제' ? 'selected' : ''}>형제 / 자매</option>
            	<option value="아이들" ${adopt.a3 eq '아이들' ? 'selected' : ''}>아이들</option>
            	<option value="부모님" ${adopt.a3 eq '부모님' ? 'selected' : ''}>부모님</option>
            </select>
            <label for="Q4">◾ 신청한 유기동물을 입양하려는 이유를 자세히 기재해주세요.</label>
            <p>${adopt.a4}</p>
            <label for="Q5">◾ 현재 반려동물을 키우고 계십니까? </label>
            <input type="radio" name="A5" id="A5-Y" value="예" ${adopt.a5 eq '예' ? 'checked' : ''}>
            <label for="A5-Y" class="radio-label">예</label>
            <input type="radio" name="A5" id="A5-N" value="아니오" ${adopt.a5 eq '아니오' ? 'checked' : ''}>
            <label for="A5-N" class="radio-label">아니오</label>
            <label for="Q6">◾ 반려동물을 키운 종류와 수는? </label>
            <p>${adopt.a6}</p>
            <label for="Q7">◾ 입양동물이 짖음, 배변실수, 분리불안, 어지럽히기, 기존강아지와의 트러블을 일으킬 수 있습니다. <br>
               	 이점에 대해서 어떻게 생각하시나요? </label>
            <p>${adopt.a7}</p>
            <label for="Q8">◾ 여행/특별한 일정으로 집을 비우게 될 시 반려동물은 어떻게 지내게됩니까?</label>
            <p>${adopt.a8}</p>
            <label for="Q9">◾ 입양동물에 필요한 치료와 케어 금액에 대해서 아시고 계십니까?</label>
            <input type="radio" name="A9" id="A9-Y" value="예" ${adopt.a9 eq '예' ? 'checked' : ''}>
            <label for="A9-Y" class="radio-label">예</label>
            <input type="radio" name="A9" id="A9-N" value="아니오" ${adopt.a9 eq '아니오' ? 'checked' : ''}>
            <label for="A9-N" class="radio-label">아니오</label>
            <label for="Q10">◾ 입양동물에 필요한 치료 및 검진 예상금액은?</label>
            <p>${adopt.a10}</p>
            <label for="Q11">◾ 반려동물이 혼자 보내야할 시간</label>
            <select name="A11" id="A11">
            	<option value="없음" ${adopt.a11 eq "없음" ? 'selected' : ''}>없음</option>
            	<option value="1-3시간" ${adopt.a11 eq "1-3시간" ? 'selected' : ''}>1-3시간</option>
            	<option value="3-6시간" ${adopt.a11 eq "3-6시간" ? 'selected' : ''}>3-6시간</option>
            	<option value="6-9시간" ${adopt.a11 eq "6-9시간" ? 'selected' : ''}>6-9시간</option>
            	<option value="9시간이상" ${adopt.a11 eq "9시간이상" ? 'selected' : ''}>9시간이상</option>
            </select>
            <label for="Q12">◾ 입양동물 훈련은 누가 시킬 예정입니까? </label>
            <select name="A12" id="A12">
            	<option value="본인(신청인)" ${adopt.a11.contains('본인') ? 'selected' : ''}>본인(신청인)</option>
            	<option value="가족" ${adopt.a12 eq '가족' ? 'selected' : ''}>가족</option>
            	<option value="유기견 트레이너" ${adopt.a12.contains('유기견') ? 'selected' : ''}>유기견 트레이너</option>
            	<option value="친구" ${adopt.a12 eq '친구' ? 'selected' : ''}>친구</option>
            	<option value="없음" ${adopt.a12 eq '없음' ? 'selected' : ''}>없음</option>
            </select>
            <label for="Q13">◾ 반려동물을 매매하거나 버리지 않고 성실히 관리하겠습니까?</label>
            <input type="radio" name="A13" id="A13-Y" value="예" ${adopt.a13 eq '예' ? 'checked' : ''}>
            <label for="A13-Y" class="radio-label">예</label>
            <input type="radio" name="A13" id="A13-N" value="아니오" ${adopt.a13 eq '아니오' ? 'checked' : ''}>
            <label for="A13-N" class="radio-label">아니오</label>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>