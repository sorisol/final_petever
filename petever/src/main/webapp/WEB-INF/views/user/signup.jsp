
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userSignup.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- 주소검색API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
/*중복아이디체크관련*/
div#userId-container{display: inline-block; padding:0px;}
div#userId-container span.guide {display:none; font-size: 12px; float: left;}
div#userId-container span.ok{color:green; margin-left: 100px;}
div#userId-container span.error{color:red; margin-left: 90px;}
</style>

    <section>
        <div class="signup">
            <form name="userSignupFrm" action="signup.do" method="post">
				<label for="" style="display: inline-block; ">아이디</label>
				<div id="userId-container">
					<span class="guide ok">이 아이디는 사용 가능합니다.</span>		   
					<span class="guide error">이 아이디는 사용할 수 없습니다.</span>		   
					<input type="hidden" id="idValid" value="0" />
				</div>
					<input type="text" class="form-control" name="userId" id="userId" value="${userId}" placeholder="4글자이상"  required>
				<label for="">비밀번호</label>
	            <input type="password" name="userPwd" maxlength='12' id="userPwd1" placeholder="영문/숫자 4~20자이내" required>
	            <label for="">비밀번호 확인</label>
	            <input type="password" name="userPwd2" maxlength='12' id="userPwd2" placeholder="영문/숫자 4~20자이내" required>
				
                <label for="">이메일</label>
                <input type="email" name="userEmail" id="userEmail" value="${userId}" required>
                <label for="">생년월일</label>
                <input type="date" name="userBirth" id="userBirth" required>     
                <label for="">전화번호</label>
                <input type="tel" name="userPhone" id="userPhone" required>
                <label for="">주소</label>
		            <div class="form-group">
						<input class="form-control" placeholder="우편번호" name="postNo" id="addr1" type="text" readonly="readonly" >
					    <button type="button" class="btn btn-default" onclick="execPostCode();">우편번호 찾기</button>                               
					    <input class="form-control" placeholder="도로명 주소" name="userLocal" id="addr2" type="text" readonly="readonly" />
					</div>
					<div class="form-group">
					    <input class="form-control" placeholder="상세주소" name="userLocalDetail" id="addr3" type="text"  />
					</div> 
                <input type="submit" value="회원가입"/>
            </form>
        </div>
    </section>
  
<script>
$(function(){
	$("[name=userSignupFrm]").submit(function(){
		console.log(1111);
		//아이디검사
		let $userId = $("#userId");
		
		console.log($userId.val());
		//if($userId.val().trim().length >= 4){
 		if(!/^[a-z,A-Z,@,.,1-9]{4,}$/.test($userId.val())){
			alert("아이디를 4자리 이상 입력해 주세요.");
			$userId.focus();
			return false;
		}

		let $pwd1 = $("#userPwd1");
		let $pwd2 = $("#userPwd2");
		
		//비밀번호 정규식
		if(!/^[a-zA-Z0-9]{4,20}$/.test($pwd1) && /^[a-zA-Z0-9]{4,20}$/.test($pwd2)) {
			alert("비밀번호가 형식을 확인해주세요.");
			$pwd1.focus();
			return false;
		}
		
		//비밀번호 일치여부
		if($pwd1.val() !== $pwd2.val()){
			alert("비밀번호가 일치하지 않습니다.");
			$pwd1.focus();
			return false;
		}

		var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(!regExpEmail.test($("#userEmail").val())) {
			alert("이메일 형식을 확인해주세요.");
			$("#userEmail").focus();
			return false;
		}

		var $userBirth = $("[name=userBirth]").val();
		if(/^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/.test($userBirth) == false) {
			alert("생년월일을 입력해주세요.");
			return false;
		}

		var $userPhone = $("[name=userPhone]").val();
        if(/^01[0-9]{1}[0-9]{3,4}[0-9]{4}$/.test($userPhone) == false){
        	alert("전화번호를 다시 확인해주세요.");
			return false;
        }

        
        var $ssgAddr0 = $("[name=postNo]").val();
        if(/^[0-9]{5}$/.test($ssgAddr0) == false){
        	alert("우편번호를 입력해주세요.");
			return false;
        }

        var $ssgAddr1 = $("[name=userLocal]").val();
        if(/[^\s]/g.test($ssgAddr1) == false){
        	alert("주소(동)를 입력해주세요.");
			return false;
        }

        var $ssgAddr2 = $("[name=userLocalDetail]").val();
        if(/[^\s]/g.test($ssgAddr2) == false){
        	alert("주소(세부)를 입력해주세요.");
			return false;
        } 
		
		
		return true;
	});

	/* 아이디중복체크  */
	$("#userId").keyup(function(){

		//중복 검사후 아이디 재작성하는 경우
		if(/^[a-z,A-Z,@,.,1-9]{4,}$/.test($(this).val()) == false){
			$(".guide").hide();
			$("#idValid").val(0);
			return;
		}
		userIdCheck();
	});	

	/* 아이디중복체크  */
	$("#userId").each(function(){
		//중복 검사후 아이디 재작성하는 경우
		if(/^[a-z,A-Z,@,.,1-9]{4,}$/.test($(this).val()) == false){
			$(".guide").hide();
			$("#idValid").val(0);
			return;
		}
		userIdCheck();
	});	
	
});

function userIdCheck() {
	$.ajax({
		url : "${ pageContext.request.contextPath }/user/checkIdDuplicate2.do",
		data : {
			userId : $("#userId").val()
		},
		dataType : "json",
		success : function(data){
			console.log(data);

			if(data.isUsable == true){
				$(".guide.error").hide();
				$(".guide.ok").show();
				$("#idValid").val(1);
			}
			else {
				$(".guide.error").show();
				$(".guide.ok").hide();
				$("#idValid").val(0);
			}
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
	});
}

/* 주소검색 API*/
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

            $("[name=postNo]").val(data.zonecode);
            $("[name=userLocal]").val(fullRoadAddr);
            
            /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
            document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
        }
     }).open();
 }

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>