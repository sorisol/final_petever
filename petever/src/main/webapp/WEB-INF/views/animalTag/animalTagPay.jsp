<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tag.css"> --%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
$(function(){
    var IMP = window.IMP; // 생략가능 
    IMP.init('imp96790963'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : 'petever 동물인식표',
		amount : '${ tagPrice }',
        buyer_name : '${ aniTag.ssgName }',
        buyer_tel : '${ aniTag.ssgTel }',
        buyer_addr : '${ aniTag.ssgAddr1 }'
    }, function(rsp) {
    	
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            msg += '\n고유ID : ' + rsp.imp_uid;
            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
            msg += '\n결제 금액 : ' + rsp.paid_amount;
            msg += '\n카드 승인번호 : ' + rsp.apply_num;
            
        //카카오페이에서 제공하는 소스로 결제 완료 된 후 결제내역 저장되게 우리코드로 다시 연결
        /* var insertOrderForm = document.insertOrder;
           insertOrderForm.submit(); */
		/* window.opener.opener.name = "parentPage"; */
		/* document.insertOrder.target = "parentPage";   */ 		
		document.insertOrder.submit();
    		
          	setTimeout(function() {
          		window.opener.name = "payPage";
        		window.opener.self.close();
            	self.close();
            	}, 1000);

        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            location.href="${ pageContext.request.contextPath }/";
        }
        alert(msg);
        
       /*  $("[name=insertOrder"+companyCode+"]").submit();    
		self.close(); */
	
    });
});
</script>
    
    <div id="main-wrap">

	    <form action="${ pageContext.request.contextPath }/animalTag/insertAniTag.do" name="insertOrder" method="POST">
			<input type="hidden" name="userId" value="${ aniTag.userId }" />
			<input type="hidden" name="tagColor" value="${ aniTag.tagColor }" />
			<input type="hidden" name="tagAniKind" value="${ aniTag.tagAniKind }" />
			<input type="hidden" name="tagFont" value="${ aniTag.tagFont }" />
			<input type="hidden" name="tagAniName" value="${ aniTag.tagAniName }" />
			<input type="hidden" name="tagAniSsn" value="${ aniTag.tagAniSsn }" />
			<input type="hidden" name="tagPersonName" value="${ aniTag.tagPersonName }" />
			<input type="hidden" name="tagPersonPhone" value="${ aniTag.tagPersonPhone }" />
			<input type="hidden" name="ssgName" value="${ aniTag.ssgName }" />
			<input type="hidden" name="ssgTel" value="${ aniTag.ssgTel }" />
			<input type="hidden" name="ssgAddr0" value="${ aniTag.ssgAddr0 }" />
			<input type="hidden" name="ssgAddr1" value="${ aniTag.ssgAddr1 }" />
			<input type="hidden" name="ssgAddr2" value="${ aniTag.ssgAddr2 }" />
			<input type="hidden" name="tagPrice" value="${ tagPrice }" />
		</form>        
        
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<style>
#main-wrap{
	width: 900px;
	height: 900px;
}

</style>