
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adoption-application.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <section>
    
        <div class="adopt">
        <h1>Petever 입양신청하기</h1>
        <a href="${pageContext.request.contextPath}/animalboard/boardView?no=${animal.aniBoId}" style="margin: 28px;">
        	<span class="title">[${animal.aniBoTag }]${animal.aniBoTitle}</span>
        	<span>글에 대한 입양 신청서입니다.</span>
        </a>
            <form name="adoptFrm" action="" method="post">
            	<input type="hidden" name="receiverId" value="${animal.userId}" />
                <label for="senderId">◾ 아이디</label>
                <input type="text" name="senderId" value="${loginUser.userId}">
                <label for="senderLocal">◾ 주소</label>
                <input type="text" name="senderLocal" value="${loginUser.userLocal}">
                <label for="senderPhone">◾ 전화번호</label>
                <input type="text" name="senderPhone" value="${loginUser.userPhone}">
                <label for="senderEmail">◾ 이메일 주소</label>
                <input type="text" name="senderEmail" value="${loginUser.userEmail}">
                <label for="senderrJob">◾ 직업</label>
                <input type="text" name="senderJob">
                <label for="senderHome">◾ 주거형태</label>
                <select name="senderHome" id="type">
                	<option value="단독주택">단독주택</option>
                	<option value="아파트">아파트</option>
                	<option value="전원주택 / 다세대주택">전원주택 / 다세대주택</option>
                	<option value="원룸">원룸</option>
                	<option value="오피스텔">오피스텔</option>
                </select>
                <label for="Q1">◾ 유기동물이 지낼 곳은?</label>
                <select name="A1" id="A1">
                	<option value="집안">집안</option>
                	<option value="회사">회사</option>
                	<option value="마당">마당</option>
                </select>
                <label for="Q2">◾ 전원주택일 경우 뒷마당 또는 앞마당에 담이 설치되어있습니까?</label>
                <input type="radio" name="A2" id="A2-Y" value="예">
                <label for="A2-Y" class="radio-label">예</label>
                <input type="radio" name="A2" id="A2-N" value="아니오">
                <label for="A2-N" class="radio-label">아니오</label>
                <label for="Q3">◾ 유기동물의 주 책임자</label>
                <select name="A3" id="A3">
                	<option value="본인(신청인)">본인(신청인)</option>
                	<option value="배우자">배우자</option>
                	<option value="형제">형제 / 자매</option>
                	<option value="아이들">아이들</option>
                	<option value="부모님">부모님</option>
                </select>
                <label for="Q4">◾ 신청한 유기동물을 입양하려는 이유를 자세히 기재해주세요.</label>
                <textarea name="A4" onkeyup="xSize(this);"></textarea>
                <label for="Q5">◾ 현재 반려동물을 키우고 계십니까? </label>
                <input type="radio" name="A5" id="A5-Y" value="예">
                <label for="A5-Y" class="radio-label">예</label>
                <input type="radio" name="A5" id="A5-N" value="아니오">
                <label for="A5-N" class="radio-label">아니오</label>
                <label for="Q6">◾ 반려동물을 키운 종류와 수는? </label>
                <input type="text" name="A6">
                <label for="Q7">◾ 입양동물이 짖음, 배변실수, 분리불안, 어지럽히기, 기존강아지와의 트러블을 일으킬 수 있습니다. <br>
                   	 이점에 대해서 어떻게 생각하시나요? </label>
                <textarea name="A7" onkeyup="xSize(this);"></textarea>
                <label for="Q8">◾ 여행/특별한 일정으로 집을 비우게 될 시 반려동물은 어떻게 지내게됩니까?</label>
                <input type="text"  name="A8">
                <label for="Q9">◾ 입양동물에 필요한 치료와 케어 금액에 대해서 아시고 계십니까?</label>
                <input type="radio" name="A9" id="A9-Y" value="예">
                <label for="A9-Y" class="radio-label">예</label>
                <input type="radio" name="A9" id="A9-N" value="아니오">
                <label for="A9-N" class="radio-label">아니오</label>
                <label for="Q10">◾ 입양동물에 필요한 치료 및 검진 예상금액은?</label>
                <input type="text" name="A10">
                <label for="Q11">◾ 반려동물이 혼자 보내야할 시간</label>
                <select name="A11" id="A11">
                	<option value="없음">없음</option>
                	<option value="1-3시간">1-3시간</option>
                	<option value="3-6시간">3-6시간</option>
                	<option value="6-9시간">6-9시간</option>
                	<option value="9시간이상">9시간이상</option>
                </select>
                <label for="Q12">◾ 입양동물 훈련은 누가 시킬 예정입니까? </label>
                <select name="A12" id="A12">
                	<option value="본인(신청인)">본인(신청인)</option>
                	<option value="가족">가족</option>
                	<option value="유기견 트레이너">유기견 트레이너</option>
                	<option value="친구">친구</option>
                	<option value="없음">없음</option>
                </select>
                <label for="Q13">◾ 반려동물을 매매하거나 버리지 않고 성실히 관리하겠습니까?</label>
                <input type="radio" name="A13" id="A13-Y" value="예">
                <label for="A13-Y" class="radio-label">예</label>
                <input type="radio" name="A13" id="A13-N" value="아니오">
                <label for="A13-N" class="radio-label">아니오</label>
                <input type="submit" value="신청하기">
            </form>
        </div>
    </section>
<script>
function xSize(e) {
    e.style.height = '1px';
    e.style.height = (e.scrollHeight) + 'px';
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>