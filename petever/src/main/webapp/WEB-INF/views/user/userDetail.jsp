<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userDetail.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!--우편번호검색API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>


<body>
    <section>
        <div class="signup">
     	   <form name="userUpdateFrm" action="${pageContext.request.contextPath}/user/userUpdate.do" method="post">
            <form action="">
                <label for="">아이디</label>
                <input type="text" class="form-control" name="userId" id="userId"  value="${loginUser.userId}" readonly required>
                <label for="">이메일</label>
                <input type="text" class="form-control" name="userEmail" id="userEmail" value="${loginUser.userEmail}" required>
                <label for="">생년월일</label>
                <input type="date" class="form-control" name="userBirth" id="userBirth" value="${loginUser.userBirth}" required>
	 	  		<label for="">전화번호</label>
                <input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="userPhone" id="userPhone" maxlength="11" value="${loginUser.userPhone}" required>
                <label for="">주소</label>
            <div class="form-group">                   
		  <button onclick="execPostCode();">우편번호 찾기</button>                     
			</div>
			<div class="form-group">
			    <input class="form-control" name="addr2" id="addr2" type="text" value="${loginUser.userLocal}" readonly="readonly" />
			</div>
			<div class="form-group">
			    <input class="form-control" name="addr3" id="addr3" type="text"  />
			</div> 
             
                <button type = "submit" class="btn btn-outline-success" >회원정보수정</button>
                <button><a href="${ pageContext.request.contextPath }/user/userDelete.do">회원탈퇴</a></button>
            </form>
        </div>
    </section>
    
    <script>
    /* 주소검색 */
    function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {

                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=addr1]").val(data.zonecode);
                $("[name=addr2]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }
    
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>