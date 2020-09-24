<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shelterBoard.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script>
$(function() {
	var sido = $("#sido"); 
	var sigugun = $("#sigugun");

	$("#sido").change(function() {
		console.log(sido.val());

		$.ajax({
			url : "${ pageContext.request.contextPath }/shelterBoard/sigugun.do",
			data : { sido : $(this).val() },
			tpye : "GET",
			success : function(data) {
				consol.log(data);
			},
			error : function(x, s, e) {
				console.log("처리실패", x, s, e);
			}
		});
			
	});
		

	
});

</script>



    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>유기동물 게시판</h1>
            <p>남은 겨울이 라이너 별 어머니, 불러 덮어 이름과, 까닭입니다.</p>
            <div class="content">
                <div class="border">

                    <div class="search-bar">
                    <form action="">
                    	<select name="sido" id="sido">
                   			<option value="">시도</option>
                        	<c:forEach items="${ sidoMap.resultMap }" var="sd" >
                          		<option value="${ sd.orgCd }">${ sd.orgdownNm }</option>
                        	</c:forEach>
                        </select>
                        <select name="sigugun" id="sigugun">
                        	<option value="">시구군</option>
                        </select>
                    
                    </form>

                    </div>

                    <hr style="height: 1px; border:none; background-color: #373b44; width: 860px; margin: 35px 50px;">

                    <div class="post-wrap">
                        <div class="post">
                            <img src="${pageContext.request.contextPath}/resources/images/dog8.jpg" alt="">
                            <br>
                            <span class="tag missing">[실종]</span>
                            <span>찾습니다</span>
                            <p>종류 : <b>강아지</b></p>
                            <p>지역 : <b>서울시 강남구</b></p>
                            <hr>
                            <span>hoggd</span>
                            <span>2020.09.13</span>
                        </div>
                        <div class="post">
                            <img src="${pageContext.request.contextPath}/resources/images/dog2.jpg" alt="">
                            <br>
                            <span class="tag protect">[보호]</span>
                            <span>제목</span>
                            <p>종류 : <b>강아지</b></p>
                            <p>지역 : <b>서울시 강남구</b> </p>
                            <hr>
                            <span>hoggd</span>
                            <span>2020.09.13</span>
                        </div>
                        <div class="post">
                            <img src="${pageContext.request.contextPath}/resources/images/dog7.jpg" alt="">
                            <br>
                            <span class="tag missing">[실종]</span>
                            <span>제목</span>
                            <p>종류 : <b>강아지</b></p>
                            <p>지역 : <b>서울시 강남구</b> </p>
                            <hr>
                            <span>hoggd</span>
                            <span>2020.09.13</span>
                        </div>
                        <div class="post">
                            <img src="${pageContext.request.contextPath}/resources/images/dog4.jpg" alt="">
                            <br>
                            <span class="tag missing">[실종]</span>
                            <span>제목</span>
                            <p>종류 : <b>강아지</b></p>
                            <p>지역 : <b>서울시 강남구</b> </p>
                            <hr>
                            <span>hoggd</span>
                            <span>2020.09.13</span>
                        </div>
                        <div class="post">
                            <img src="${pageContext.request.contextPath}/resources/images/dog5.jpg" alt="">
                            <br>
                            <span class="tag missing">[실종]</span>
                            <span>제목</span>
                            <p>종류 : <b>강아지</b></p>
                            <p>지역 : <b>서울시 강남구</b> </p>
                            <hr>
                            <span>hoggd</span>
                            <span>2020.09.13</span>
                        </div>
                    </div>
                    <div class="search">
                        <select name="" id="">
                            <option value="">제목</option>
                            <option value="">내용</option>
                            <option value="">날짜</option>
                        </select>
                        <input type="text" name="" id="">
                        <button>검색</button>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
    <button type="button" onclick="location.href='${ pageContext.request.contextPath }/shelterBoard/shelterDB'">DB만들기</button>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>