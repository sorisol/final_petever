
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userDetail.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- 주소검색API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


    <section>
    
   <!-- 아이디 중복 체크폼 -->
	<form name="checkIdDuplicateFrm">
		<input type="hidden" name="userId" />
	</form>
    	
        <div class="signup">
            <form name="userSignupFrm" action="signup.do" method="post">
                <label for="">아이디 <span class="id-check" onclick="checkIdDuplicate();">중복확인</span></label>
                <input type="text" name="userId" maxlength='12' id="userId" placeholder="4자리 이상" required>
                <label for="">비밀번호</label>
                <input type="password" name="userPwd" maxlength='12' id="userPwd1" required>
                <label for="">비밀번호 확인</label>
                <input type="password" name="userPwd" maxlength='12' id="userPwd2" required>
                <label for="">이메일</label>
                <input type="email" name="userEmail" id="userEmail" required>
                <label for="">생년월일</label>
                <input type="date" name="userBirth" id="" required>     
                <label for="">전화번호</label>
                <input type="tel" name="userPhone" id="" required>
                <label for="">주소</label>
                <input type="text" name="userLocal" id="" required>
                <div class="form-group">                   
              
<!-- 				<input class="form-control" placeholder="우편번호" name="userLocal" id="addr1" type="text" readonly="readonly" >
				    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
				</div>
				<div class="form-group">
				    <input class="form-control" placeholder="도로명 주소" name="userLocal" id="addr2" type="text" readonly="readonly" />
				</div>
				<div class="form-group">
				    <input class="form-control" placeholder="상세주소" name="userLocal" id="addr3" type="text"  />
				</div> -->
                
                <button class="addr-search" >검색</button> 
                <input type="submit" value="회원가입" onclick="button1_click();" onsubmit ="return CheckAll()">
         
            </form>
        </div>
    </section>
  
    <script>
    /*회원가입*/
    $("#userSignupFrm").submit(function(){

        return true;

    });

 /*    function button1_click() {
    	alert("회원가입이 완료되었습니다.");
    } */

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
                
                
                $("[name=addr1]").val(data.zonecode);
                $("[name=addr2]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }



 
    </script>
    
    <script>
   /*  유효성검사 */
    
$(function(){
	$("[name=userSignupFrm]").submit(function(){
		//아이디검사
		let $userId = $("#userId");
		if(!/^[\w]{4,}$/.test($userId.val())){
			alert("아이디를 4자리 이상 입력해 주세요.");
			$userId.focus();
			return false;
		}

		
		//비밀번호 일치여부
		let $pwd1 = $("#userPwd1");
		let $pwd2 = $("#userPwd2");
		
		if($pwd1.val() !== $pwd2.val()){
			alert("비밀번호가 일치하지 않습니다.");
			$pwd1.focus();
			return false;
		}
		
		return true;
	});
});

/**
 * 팝업 + 폼제출
 */
function checkIdDuplicate(){
	let $userId = $("#userId");
	if(!/^[\w]{4,}$/.test($userId.val())){
		alert("유효한 아이디를 입력해주세요.");
		$userId.select();
		return;
	}
	
	//팝업생성
	let title = "checkIdDuplicatePopup";
	let spec = "left=300px, top=300px, width=300px, height=200px";
	let popup = open("", title, spec);
	//url부분은 form이 제출될 주소가 오므로, 공란처리
	
	let $frm = $("[name=checkIdDuplicateFrm]");
	$frm.attr("action", "<%=request.getContextPath()%>/user/checkIdDuplicate");
	$frm.attr("method", "POST");
	$frm.attr("target", title);//폼과 팝업을 연결
	$frm.find("[name=userId]").val($userId.val());
	$frm.submit();
	
}

 
    </script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>