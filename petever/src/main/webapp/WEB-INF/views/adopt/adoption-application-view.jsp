
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adoption-application-view.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <section>
        <div class="adopt">
        <h1>Petever 입양신청서 확인</h1>
        <a href="${pageContext.request.contextPath}/animalboard/boardView?no=${adopt.aniBoId}" style="margin: 28px;">
        	<span class="title">[${animal.aniBoTag }]${animal.aniBoTitle}</span>
        	<span>글에 대한 입양 신청서입니다.</span>
        </a>
            <label for="senderId">◾ 신청인 아이디</label>
            <p>${adopt.senderId}</p>
            <label for="senderLocal">◾ 신청인 주소</label>
            <p>${adopt.senderLocal}</p>
            <label for="senderPhone">◾ 신청인 전화번호</label>
            <p>${adopt.senderPhone}</p>
            <label for="senderJob">◾ 신청인 직업</label>
            <p>${adopt.senderJob}</p>
            <label for="senderHome">◾ 신청인 주거형태</label>
            <p>${adopt.senderHome}</p>
            <label for="Q1">◾ 유기동물이 지낼 곳은?</label>
            <p>${adopt.a1}</p>
            <label for="Q2">◾ 전원주택일 경우 뒷마당 또는 앞마당에 담이 설치되어있습니까?</label>
            <input type="radio" name="A2" id="A2-Y" value="예" ${adopt.a2 eq '예' ? 'checked' : ''}  onclick="return(false);">
            <label for="A2-Y" class="radio-label">예</label>
            <input type="radio" name="A2" id="A2-N" value="아니오" ${adopt.a2 eq '아니오' ? 'checked' : ''}  onclick="return(false);">
            <label for="A2-N" class="radio-label">아니오</label>
            <label for="Q3">◾ 유기동물의 주 책임자</label>
            <p>${adopt.a3}</p>
            <label for="Q4">◾ 신청한 유기동물을 입양하려는 이유를 자세히 기재해주세요.</label>
            <p>${adopt.a4}</p>
            <label for="Q5">◾ 현재 반려동물을 키우고 계십니까? </label>
            <input type="radio" name="A5" id="A5-Y" value="예" ${adopt.a5 eq '예' ? 'checked' : ''}  onclick="return(false);">
            <label for="A5-Y" class="radio-label">예</label>
            <input type="radio" name="A5" id="A5-N" value="아니오" ${adopt.a5 eq '아니오' ? 'checked' : ''}  onclick="return(false);">
            <label for="A5-N" class="radio-label">아니오</label>
            <label for="Q6">◾ 반려동물을 키운 종류와 수는? </label>
            <p>${adopt.a6}</p>
            <label for="Q7">◾ 입양동물이 짖음, 배변실수, 분리불안, 어지럽히기, 기존강아지와의 트러블을 일으킬 수 있습니다. 
               	 이점에 대해서 어떻게 생각하시나요? </label>
            <p>${adopt.a7}</p>
            <label for="Q8">◾ 여행/특별한 일정으로 집을 비우게 될 시 반려동물은 어떻게 지내게됩니까?</label>
            <p>${adopt.a8}</p>
            <label for="Q9">◾ 입양동물에 필요한 치료와 케어 금액에 대해서 아시고 계십니까?</label>
            <input type="radio" name="A9" id="A9-Y" value="예" ${adopt.a9 eq '예' ? 'checked' : ''}  onclick="return(false);">
            <label for="A9-Y" class="radio-label">예</label>
            <input type="radio" name="A9" id="A9-N" value="아니오" ${adopt.a9 eq '아니오' ? 'checked' : ''}  onclick="return(false);">
            <label for="A9-N" class="radio-label">아니오</label>
            <label for="Q10">◾ 입양동물에 필요한 치료 및 검진 예상금액은?</label>
            <p>${adopt.a10}</p>
            <label for="Q11">◾ 반려동물이 혼자 보내야할 시간</label>
            <p>${adopt.a11}</p>
            <label for="Q12">◾ 입양동물 훈련은 누가 시킬 예정입니까?</label>
            <p>${adopt.a12}</p>
            <label for="Q13">◾ 반려동물을 매매하거나 버리지 않고 성실히 관리하겠습니까?</label>
            <input type="radio" name="A13" id="A13-Y" value="예" ${adopt.a13 eq '예' ? 'checked' : ''}  onclick="return(false);">
            <label for="A13-Y" class="radio-label">예</label>
            <input type="radio" name="A13" id="A13-N" value="아니오" ${adopt.a13 eq '아니오' ? 'checked' : ''}  onclick="return(false);">
            <label for="A13-N" class="radio-label">아니오</label>
        </div>
        <div class="button-wrap">
	        <input type="button" value="메세지창으로 가기" onclick="javascript:history.go(-1);"/>
    	    <input type="button" value="게시글 보러 가기" onclick="location.href='${pageContext.request.contextPath}/animalboard/boardView?no=${adopt.aniBoId}'"/>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>