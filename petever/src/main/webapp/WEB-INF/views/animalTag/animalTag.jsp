<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animalTag.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Sunflower:wght@500&display=swap" rel="stylesheet">
<!-- 주소검색API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
	    var autoHypenPhone = function(str){
	        str = str.replace(/[^0-9]/g, '');
	        var tmp = '';
	        if( str.length < 4){
	            return str;
	        }else if(str.length < 7){
	            tmp += str.substr(0, 3);
	            tmp += '-';
	            tmp += str.substr(3);
	            return tmp;
	        }else if(str.length < 11){
	            tmp += str.substr(0, 3);
	            tmp += '-';
	            tmp += str.substr(3, 3);
	            tmp += '-';
	            tmp += str.substr(6);
	            return tmp;
	        }else{              
	            tmp += str.substr(0, 3);
	            tmp += '-';
	            tmp += str.substr(3, 4);
	            tmp += '-';
	            tmp += str.substr(7);
	            return tmp;
	        }
	    
	        return str;
	  }
        $(function () {
            $("[name=tagColor]").change(function () {
                var $color = $(this);

                if ($color.val() == 'silver') {
	                $("#ani-info-tag1").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_silver.png)');
	                $("#ani-info-tag2").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_silver.png)');
                } else if ($color.val() == 'gold') {
	                $("#ani-info-tag1").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_gold.png)');
	                $("#ani-info-tag2").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_gold.png)');
                } else if ($color.val() == 'rosegold') {
	                $("#ani-info-tag1").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_rosegold.png)');
	                $("#ani-info-tag2").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_rosegold.png)');
                }
            });

            $("[name=tagAniKind]").change(function() {
                var $aniKind = $(this);
				console.log($aniKind.val());

				if($aniKind.val() == '포메라니안'){
					$("#aniaml-tag-img").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/ani_pome.png)');
				} else if($aniKind.val() == '진돗개'){
					$("#aniaml-tag-img").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/ani_jindo.png)');
				} else if($aniKind.val() == '시바견'){
					$("#aniaml-tag-img").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/ani_siba.png)');
				}

            });

            $("[name=tagFont]").change(function () {
                var $font = $(this);
                //console.log($font.val());
                $(".animal-tag-font").attr('style', 'font-family : '+ $font.val() +'!important');
            });
            //동물이름
            $("#ani-name").keyup(function () {
                var $aniName = $(this);
                // console.log($aniName.val());
                $("#preview-name").text($aniName.val());
            });
            /* //동물생년월일
            $("#ani-birth").change(function () {
                var $aniBirth = $(this);
                // console.log($aniBirth.val());
                $("#preview-birth").text($aniBirth.val());
            });
            //동물성별
            $("[name=tagAniGender]").click(function () {
                var $aniGender = $(this);
                // console.log($aniGender.next().text());
                $("#preview-gender").text("/ " + $aniGender.next().text());
            }); */
            //동물등록번호
            $("#ani-ssn").keyup(function () {
                var $aniSsn = $(this);
                // console.log($aniSsn.val());
                $("#preview-ssn").text($aniSsn.val());
            });
            //동물주인 이름
            $("#person-name").keyup(function () {
                var $personName = $(this);
                // console.log($personName.val());
                $("#preview-person-name").text($personName.val());
            });
            //동물주인 전화번호
            $("#person-phone").keyup(function () {
                var $personPhone = $(this);
                // console.log($personPhone.val());
                this.value = autoHypenPhone( this.value ) ; 
                $("#preview-person-phone").text(this.value);
            });
			//배송 받을 전화번호
            $("[name=ssgTel]").keyup(function () {
                var $ssgTel = $(this);
                this.value = autoHypenPhone( this.value ); 
            });

            //slide-wrap
            var slideWrapper = document.getElementById('slider-wrap');
            //current slideIndexition
            var slideIndex = 0;
            //items
            var slides = document.querySelectorAll('#slider-wrap ul li');
            //number of slides
            var totalSlides = slides.length;
            //get the slide width
            var sliderWidth = slideWrapper.clientWidth;
            //set width of items
            slides.forEach(function (element) {
                element.style.width = sliderWidth + 'px';
            })
            //set width to be 'x' times the number of slides
            var slider = document.querySelector('#slider-wrap ul#slider');
            slider.style.width = sliderWidth * totalSlides + 'px';

            // next, prev
            var nextBtn = document.getElementById('next');
            var prevBtn = document.getElementById('previous');
            nextBtn.addEventListener('click', function () {
                plusSlides(1);
            });
            prevBtn.addEventListener('click', function () {
                plusSlides(-1);
            });

            // hover
            slideWrapper.addEventListener('mouseover', function () {
                this.classList.add('active');
                clearInterval(autoSlider);
            });
            slideWrapper.addEventListener('mouseleave', function () {
                this.classList.remove('active');
                autoSlider = setInterval(function () {
                    plusSlides(1);
                }, 3000);
            });


            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlides(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                slideIndex = n;
                if (slideIndex == -1) {
                    slideIndex = totalSlides - 1;
                } else if (slideIndex === totalSlides) {
                    slideIndex = 0;
                }

                slider.style.left = -(sliderWidth * slideIndex) + 'px';
                pagination();
            }

            //pagination
            slides.forEach(function () {
                var li = document.createElement('li');
                document.querySelector('#slider-pagination-wrap ul').appendChild(li);
            })

            function pagination() {
                var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
                dots.forEach(function (element) {
                    element.classList.remove('active');
                });
                dots[slideIndex].classList.add('active');
            }

            pagination();
            var autoSlider = setInterval(function () {
                plusSlides(1);
            }, 3000);

            /* submit 전 DATA 정규성 검사 */
            $("#aniTagFrm").submit(function() {
/*             	if(${ empty loginUser }) {
    				alert("로그인후 구매 해주세요.");
    				return false;
                } */

/*                 if($('input[name="tagColor"]:checked').val() == undefined) {
                	alert("인식표 색상을 선택해주세요.");
    				return false;
                } */
                
/*                 if($('input[name="tagFont"]:checked').val() == undefined) {
                	alert("인식표 글씨체를 선택해주세요.");
    				return false;
                }  */

                var $tagAniName = $('input[name="tagAniName"]').val();

/* 				console.log(/^[가-힣]{1,5}$/.test($tagAniName));
                if(/^[가-힣a-zA-Z]{1,5}$|^[a-zA-Z]{1,10}$/.test($tagAniName) == false) {
                	alert("반려동물 이름 형식에 맞춰 작성해주세요.");
    				return false;
                } */

                var $tagAniSsn = $('[name=tagAniSsn]').val();
/*                 if(/^[0-9]{12}$|^{}$/.test($tagAniSsn) == false) {
                	alert("반려 동물의 등록번호가 있다면 숫자 12자리 입력\n반려 동물의 등록번호가 없다면 빈칸으로 제출해주세요.");
    				return false;
                } */

                var $tagPerName = $('[name=tagPersonName]').val();
/*                if(/^[가-힣]{2,6}$|^[a-zA-Z]{2,10}$/.test($tagPerName) == false){
                	alert("인식표에 작성될 보호자 이름을 작성해주세요.");
    				return false;
                } */

/*                 var $tagPerTel = $("[name=tagPersonPhone]").val();
                if(/^01[0-9]{1}-[0-9]{3,4}-[0-9]{4}$/.test($tagPerTel) == false){
                	alert("인식표에 작성될 보호자 전화번호를 작성해주세요.");
    				return false;
                } */

/*                 var $ssgName = $('input[name="ssgName"]').val();
                if(/^[가-힣]{2,6}$$/.test($ssgName) == false) {
                	alert("이름 형식에 맞춰 작성해주세요.");
    				return false;
                } */

/*                 var $ssgTel = $("[name=ssgTel]").val();
                if(/^01[0-9]{1}-[0-9]{3,4}-[0-9]{4}$/.test($ssgTel) == false){
                	alert("전화번호를 작성해주세요.");
    				return false;
                } */

                /* var $ssgAddr0 = $("[name=ssgAddr0]").val();
                if(/^[0-9]{5}$/.test($ssgAddr0) == false){
                	alert("우편번호를 입력해주세요.");
    				return false;
                }  */

                /* var $ssgAddr1 = $("[name=ssgAddr1]").val();
                if(/[^\s]/g.test($ssgAddr1) == false){
                	alert("주소(동)를 입력해주세요.");
    				return false;
                }  */

                var $ssgAddr2 = $("[name=ssgAddr2]").val();
                if(/[^\s]/g.test($ssgAddr2) == false){
                	alert("주소(세부)를 입력해주세요.");
    				return false;
                } 

    			return true;
            });

			$("#ssg_user").change(function(){

				var $check = $(this).is(":checked");
				
				if(${ empty loginUser }) {
    				alert("로그인후 구매 해주세요.");
    				$("#ssg_user").prop("checked", false);
    				return;
                } 
                
				if($check) {
					$('input[name="ssgName"]').val("${ loginUser.userId }");
					$('input[name="ssgTel"]').val(autoHypenPhone("${ loginUser.userPhone }"));

				} else {
					$('input[name="ssgName"]').val('');
					$('input[name="ssgTel"]').val('');
				}
			});


			//강아지, 고양이 별 종
		    $("[name=tagAniKind]").each(function() {
				var $breed = $(this).val();
				var $selectTag = $("#aniKind");
				var dog = ['포메라니안', '진돗개', '시바견', '리트리버', '말티즈', '보더콜리', '불독', '비숑프리제', '시츄', '웰시코기', '요크셔테리어', '치와와', '푸들'];
				var cat = ['코리안숏헤어', '노르웨이숲', '러시안블루', '렉돌', '먼치킨', '뱅갈', '브리티쉬숏헤어', '샴', '스코티쉬폴드', '터키쉬앙고라'];
				/* if($breed == '개'){ */
					/* $selectTag.html(''); */
					for(var i in dog) {
						$selectTag.append('<option value="'+dog[i]+'">'+dog[i]+'</option>');
					}
				/* } */
				/* else if($breed == '고양이'){
					$selectTag.html('');
					for(var i in cat) {
						$selectTag.append('<option value="'+cat[i]+'">'+cat[i]+'</option>');
					}
				} */
				
		    });
				




            
        });


            
        function previewReset() {
			var result = confirm("초기화 하시겠습니까??");
			if(result){
	            $("#ani-info-tag1").css('background-image', '');
	            $("#ani-info-tag2").css('background-image', '');
	            $(".animal-tag-font").css("font-family", '');
	            $("#preview-name").text('');
	            $("#preview-birth").text('');
	            $("#preview-gender").text('');
	            $("#preview-ssn").text('');
	            $("#preview-person-name").text('');
	            $("#preview-person-phone").text('');
	            document.forms[0].reset();
			} else {
				return false;
			}
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
                    
                    
                    $("[name=ssgAddr0]").val(data.zonecode);
                    $("[name=ssgAddr1]").val(fullRoadAddr);
                    
                    /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                    document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
                }
             }).open();
         }

</script>
    <div id="main-wrap">
        <section class="main"></section>
        <section class="content-wrap">
            <h1>입양하기</h1>
            <p>펫에버에서는 이러한 일들을 합니다.</p>
            <div class="content">
                <div class="tag-wrap">
                    <div class="animal-tag-preview">
                        <div id="ani-info-tag1">
                        	<div id="aniaml-tag-img"></div><br />
                        	<label class="animal-tag-font" id="preview-name" for=""></label>
                        </div>

                        <label class="preview-label preview-front" for="">앞면</label>

                        <div id="ani-info-tag2">
                            <!-- <label class="animal-tag-font" id="preview-birth" for=""></label>
                            <label class="animal-tag-font" id="preview-gender" for=""></label><br> -->
                            <label class="animal-tag-font" id="preview-ssn" for=""></label><br>
                            <label class="animal-tag-font" id="preview-person-name" for=""></label><br>
                            <label class="animal-tag-font" id="preview-person-phone" for=""></label><br>
                        </div>

                        <label class="preview-label preview-back" for="">뒷면</label>
                    </div>
                    <div class="animal-tag-select">
                        <form action="${ pageContext.request.contextPath }/animalTag/animalTagPay.do" id="aniTagFrm" method="POST" >
                        	<input type="hidden" name="userId" value="${ loginUser.userId }"/>
                            <h4>펜던트 색상</h4>
                            <input type="radio" name="tagColor" id="silver" value="silver">
                            <label class="ani-radio" for="silver">실버(Silver)</label>
                            <input type="radio" name="tagColor" id="gold" value="gold">
                            <label class="ani-radio" for="gold">골드(Gold)</label><br />
                            <input type="radio" name="tagColor" id="rosegold" value="rosegold">
                            <label class="ani-radio" for="rosegold">로즈골드(Rose Gold)</label><br />
                            
                            <label for="aniKind" class="ani-label">동물선택</label>
                            <select name="tagAniKind" id="aniKind">
                            	<option value="">동물 이미지 선택</option>
                            </select>
                            
                            <h4>폰트</h4>
                            <input type="radio" name="tagFont" id="font_DoHyeon" value="Do Hyeon">
                            <label class="ani-radio font_DoHyeon" for="font_DoHyeon">도현체</label>
                            <input type="radio" name="tagFont" id="font_Jua" value="Jua">
                            <label class="ani-radio font_Jua" for="font_Jua">주아체</label>
                            <input type="radio" name="tagFont" id="font_Sunflower" value="Sunflower">
                            <label class="ani-radio font_Sunflower" for="font_Sunflower">선플라워체</label>
                            <br>
                            <label for="ani-name" class="ani-label">동물이름</label>
                            <input type="text" name="tagAniName" id="ani-name" placeholder="한영(5자), 영문(10자) 이내">
                            <br>
                            <label for="ani-ssn" class="ani-label">동물등록번호</label>
                            <input type="text" name="tagAniSsn" id="ani-ssn" placeholder="숫자 12자리">
                            <br>
                            <label for="person-name" class="ani-label">보호자 이름</label>
                            <input type="text" name="tagPersonName" id="person-name" placeholder="한글 6자 이내">
                            <br>
                            <label for="person-phone" class="ani-label">보호자 전화번호</label>
                            <input type="text" name="tagPersonPhone" id="person-phone" placeholder="숫자만 입력해주세요">
                            
                            <hr/>
                            
							<h4 style="float: left; width: 240px;">배송지 입력</h4>
							<input type="checkbox" id="ssg_user" /> 
							<label for="ssg_user" class="ssg_user">기존 정보 적용</label>
							<br>
							<label for="ssg-name" class="ani-label ssg">이름</label>
                            <input type="text" name="ssgName" id="ssg-name" placeholder="한글 2~6자">
                            <br />
							<label for="ssg-tel" class="ani-label ssg">핸드폰번호</label>
                            <input type="text" name="ssgTel" id="ssg-tel" placeholder="숫자만 입력해주세요">
                            <br />
							<label for="ssg-addr" class="ani-label ssg" id="ssg-addr-label" >주소</label>
							<input type="text" name="ssgAddr0" id="ssg-addr0" onclick="execPostCode();" placeholder="우편번호" readonly style="cursor: pointer;">
                            <input type="text" name="ssgAddr1" id="ssg-addr1" onclick="execPostCode();" placeholder="메인 주소" readonly style="cursor: pointer;">
                            <button type="button" id="addr-search" onclick="execPostCode();" style="cursor: pointer;">주소찾기</button>
                            <input type="text" name="ssgAddr2" id="ssg-addr2" placeholder="세부 주소 입력">
                            <input type="hidden" name="tagPrice" value="5000"/>
                            
                            <input class="btn" type="submit" id="submit" value="구매">
                            <input class="btn" type="button" value="초기화" onclick="previewReset();">
                        </form>
                    </div>
                </div>
                
                <form action="${ pageContext.request.contextPath }/animalTag/kakaoPay" method="post">
                	<input type="hidden" name="price" value="5000"/>
				    <button>카카오페이로 결제하기</button>
				</form>
                
                <div id="slider-wrap">
				    <ul id="slider">
				        <li>
				            <div>
				                <h3>제품이미지#1</h3>
				                <span></span>
				            </div>
				            <img src="${pageContext.request.contextPath}/resources/images/tag1.jpg" alt="">
				        </li>
				
				        <li>
				            <div>
				                <h3>제품이미지#2</h3>
				                <span></span>
				            </div>
				            <img src="${pageContext.request.contextPath}/resources/images/tag2.jpg" alt="">
				        </li>
				
				        <li>
				            <div>
				                <h3>제품이미지#3</h3>
				                <span></span>
				            </div>
				            <img src="${pageContext.request.contextPath}/resources/images/tag3.jpg" alt="">
				        </li>
				        <li>
				            <div>
				                <h3>사용예시#1</h3>
				                <span></span>
				            </div>
				            <img src="${pageContext.request.contextPath}/resources/images/tag4.jpg" alt="">
				        </li>
				        <li>
				            <div>
				                <h3>사용예시#2</h3>
				                <span></span>
				            </div>
				            <img src="${pageContext.request.contextPath}/resources/images/tag5.jpg" alt="">
				        </li>
				        <li>
				            <div>
				                <h3>사용예시#3</h3>
				                <span></span>
				            </div>
				            <img src="${pageContext.request.contextPath}/resources/images/tag6.jpg" alt="">
				        </li>
				    </ul>
				
				    <div class="slider-btns" id="next"><span>▶</span></div>
				    <div class="slider-btns" id="previous"><span>◀</span></div>
				
				    <div id="slider-pagination-wrap">
				        <ul>
				        </ul>
				    </div>
				</div>
                
            </div>
        </section>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>