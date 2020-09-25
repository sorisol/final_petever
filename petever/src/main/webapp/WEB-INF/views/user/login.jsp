<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <section>
        <div class="logo"></div>
        <div class="login">
            <form action="${pageContext.request.contextPath}/user/login.do" 
                  method="POST">
               <div class="login-body">
                <input type="text" name="userId">
                <input type="password" name="userPwd">
                <button>로그인</button>
                <div class="check">
                    <input type="checkbox" id="switch" /><label for="switch"></label>
                    <p>로그인 상태 유지</p>
                  </div>
                </div>
            </form>
            <div id="search">
                <a href="">아이디 찾기</a> |
                <a href="">비밀번호 찾기</a>
            </div>
            <div id="my-signin2" class="g-signin2" data-width="232" data-height="50" data-longtitle="true"
                data-onsuccess="onSignIn"></div>
            <div id="naver_id_login" style="width:232px;margin:20px auto;"></div>
            <a id="custom-login-btn" style="margin: 0 auto; width: 232px; display: block;"
                href="javascript:loginWithKakao()">
                <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="232" />
            </a>
        </div>
    </section>

 
    <script src="js/kakao.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8">
    </script>

 


<script type="text/javascript">
    var naver_id_login = new naver_id_login("YOUR_CLIENT_ID", "YOUR_CALLBACK_URL");
    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("white", 3, 50);
    naver_id_login.setDomain("YOUR_SERVICE_URL");
    naver_id_login.setState(state);
    naver_id_login.setPopup();
    naver_id_login.init_naver_id_login();
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>