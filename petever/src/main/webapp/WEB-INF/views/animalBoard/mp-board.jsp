<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mp-board.css">
    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>유기동물 게시판</h1>
            <p>남은 겨울이 라이너 별 어머니, 불러 덮어 이름과, 까닭입니다.</p>
            <div class="content">
                <div class="border">
                    <table class="preference">
                        <tr>
                            <th>동물종류</th>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">강아지</label>
                            </td>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">고양이</label>
                            </td>
                            <td colspan="2" style="padding-right: 20px;">
                                <input type="checkbox" name="" id="">
                                <label for="">기타</label>
                            </td>
                            <th>품종</th>
                            <td>
                                <select name="" id="" style="width: 100%; height: 25px;">
                                    <option value="">말티즈</option>
                                    <option value="">보더콜리</option>
                                    <option value="">비숑</option>
                                    <option value="">시바견</option>
                                    <option value="">요크셔테리어</option>
                                    <option value="">웰시코기</option>
                                    <option value="">포메라니안</option>
                                    <option value="">푸들</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>사이즈</th>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">소형</label>
                            </td>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">중형</label>
                            </td>
                            <td colspan="2">
                                <input type="checkbox" name="" id="">
                                <label for="">대형</label>
                            </td>
                            <th>털길이</th>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">단모종</label>
                            </td>
                            <td colspan="2">
                                <input type="checkbox" name="" id="">
                                <label for="">장모종</label>
                            </td>
                        </tr>
                        <tr>
                            <th>나이</th>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">0~2</label>
                            </td>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">3~5</label>
                            </td>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">6~8</label>
                            </td>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">8살 이상</label>
                            </td>
                            <th>성별</th>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">암컷</label>
                            </td>
                            <td colspan="2">
                                <input type="checkbox" name="" id="">
                                <label for="">수컷</label>
                            </td>
                        </tr>
                        <tr>
                            <th>무게</th>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">5kg 미만</label>
                            </td>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">5~10kg</label>
                            </td>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">10kg~15kg</label>
                            </td>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">15kg 이상</label>
                            </td>

                            <th>접종여부</th>
                            <td>
                                <input type="checkbox" name="" id="">
                                <label for="">미접종</label>
                            </td>
                            <td colspan="2">
                                <input type="checkbox" name="" id="">
                                <label for="">접종완료</label>
                            </td>
                        </tr>
                    </table>

                    <hr style="height: 1px; border:none; background-color: lightgray; width: 1000px; margin: 30px 50px;">
					
                    <div class="post-wrap">
                    <c:forEach items="${boardList}" var="b">
                    	<a href="${ pageContext.request.contextPath }/animalboard/boardView?no=${b.aniBoId}">
	                        <div class="post">
	                            <img src="${pageContext.request.contextPath}/resources/editor/multiupload/">
	                            <br>
	                            <span class="tag">[${b.aniBoTag }]</span>
	                            <span>${b.aniBoTitle}</span>
	                            <p>종류 : <b>${b.aniBoType}</b></p>
	                            <p>지역 : <b>${b.aniBoLocal}</b></p>
	                            <hr>
	                            <span>${b.userId}</span>
	                            <span>
	                            <!-- String -> Date -> yyy.MM.dd형식으로 바꾸기 -->
	                            <fmt:parseDate value="${b.aniBoDate}" var="aniBoDate" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${aniBoDate}" pattern="yyyy.MM.dd"/>
	                            </span>
	                        </div>
	                    </a>
                    </c:forEach>
                    <a href="${ pageContext.request.contextPath }/animalboard/boardView">
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
                    </a>
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
                    <hr style="height: 1px; border:none; background-color: lightgray; width: 860px; margin: 35px 50px 10px 50px;">
                    <button onclick="location.href='${pageContext.request.contextPath}/animalboard/boardFrm'" class="write-btn">글쓰기</button>
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
    <script>
		$(function() {
			var tag = document.getElementsByClassName("tag");
			for(var i=0; i<tag.length; i++) {
	            if(tag[i].innerHTML == '[실종]'){
	                tag[i].setAttribute('class', 'tag missing');
		        }
	            else if(tag[i].innerHTML == '[목격]')
	                tag[i].setAttribute('class', 'tag sighting');
	            else if(tag[i].innerHTML == '[보호]')
	                tag[i].setAttribute('class', 'tag protect');
	            
	        }
		});
    </script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
