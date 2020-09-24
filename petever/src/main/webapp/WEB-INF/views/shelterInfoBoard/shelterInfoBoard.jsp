<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shelterBoard.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>보호소 동물 게시판</h1>
            <p>남은 겨울이 라이너 별 어머니, 불러 덮어 이름과, 까닭입니다.</p>
            ${ sidoMap }
            <div class="content">
                <div class="border">
                    <table class="preference">
                        <tr>
                            <td>
                                <select name="" id="" style="width: 100%; height: 25px;">
                                <c:forEach items="${ sidoMap }" var="c" >
                                	<c:forEach items="c" var="sido">
	                                	<option value="">${ sido }</option>
                                	</c:forEach>
                                </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </table>

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




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>