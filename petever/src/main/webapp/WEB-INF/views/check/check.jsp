<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/check.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<style>
	#con{
		width:1110px;
		background:url('${pageContext.request.contextPath }/resources/images/checkMain.png');
		height:690px;
		position:absolute;
		z-index:10;
	    background-size: 100%;
	    background-repeat: no-repeat;
	    background-position: top center;
	    background-color: white;
	    padding:0;
	    opacity:1;
	    transition:0.5s;
	}
	.thar-three{
		position: absolute;
	    width: 100%;
	    height: 45px;
	    top: 645px;
	    font-size:24px;
	    font-weight:bold;
	    text-decoration:none;
	    text-align:center;
	}
	a.animated-button.thar-three {
	color: #ec613c;
	cursor: pointer;
	display: block;
	position: relative;
	border: 2px solid #FFDD93;
	transition: all 0.4s cubic-bezier(0.42, 0, 0.58, 1);
}
a.animated-button.thar-three:hover {
	color: white !important;
	background-color: transparent;
	text-shadow: nthree;
}
a.animated-button.thar-three:hover:before {
	left: 0%;
	right: auto;
	width: 100%;
}
a.animated-button.thar-three:before {
	display: block;
	position: absolute;
	top: 0px;
	right: 0px;
	height: 100%;
	width: 0px;
	z-index: -1;
	content: '';
	color: white !important;
	background: #FFDD93;
	transition: all 0.4s cubic-bezier(0.42, 0, 0.58, 1);
0s;
}
	}
</style>
<body>
<div class="container">
	<div id="con" class="container">
		<a class="animated-button thar-three">Next</a>
	</div>
		<div class="col-sm-12">
			<div class="mm-survey">

				<div class="mm-survey-progress">
					<div class="mm-survey-progress-bar mm-progress"><div style="margin-left:calc(50% - 20px);">(<span id="page">1</span>/9)</div></div>
				</div>

				<div class="mm-survey-results">
					<div class="mm-survey-results-container">
						<h3 class="mm-survey-results-score"></h3>
						<ul class="mm-survey-results-list"></ul>
					</div>
					<div class="mm-survey-results-controller">
						<div class="mm-back-btn">
							<button>Back</button>
						</div>
					</div>
				</div>

				<div class="mm-survey-bottom">
					<div class="mm-survey-container">
						<div class="mm-survey-page active" data-page="1">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>반려동물과 같이 살기 위해 얼마나 돈을 사용하실 계획이신가요? (1개월 기준)</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio01" data-item="1" name="radio1" value="0" />
									<label for="radio01"><span></span><p> ~ 15만원</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio02" data-item="1" name="radio1" value="6" />
									<label for="radio02"><span></span><p> 15만원 ~ 25만원</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio03" data-item="1" name="radio1" value="12" />
									<label for="radio03"><span></span><p> 25만원 ~ 35만원</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio04" data-item="1" name="radio1" value="18" />
									<label for="radio04"><span></span><p> 35만원 ~</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="2">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>반려동물에게 얼마나 시간을 사용하실건가요? (1일 기준)</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio05" data-item="2" name="radio2" value="0" />
									<label for="radio05"><span></span><p> ~ 1시간</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio06" data-item="2" name="radio2" value="6" />
									<label for="radio06"><span></span><p> 1시간 ~ 2시간</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio07" data-item="2" name="radio2" value="12" />
									<label for="radio07"><span></span><p> 2시간 ~ 3시간</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio08" data-item="2" name="radio2" value="18" />
									<label for="radio08"><span></span><p> 3시간 ~</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="3">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>몇인 가구이신가요?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio09" data-item="3" name="radio3" value="1" />
									<label for="radio09"><span></span><p>1인가구</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio10" data-item="3" name="radio3" value="2" />
									<label for="radio10"><span></span><p>2인가구</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio11" data-item="3" name="radio3" value="3" />
									<label for="radio11"><span></span><p>3인가구</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio12" data-item="3" name="radio3" value="4" />
									<label for="radio12"><span></span><p>4인가구</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="4">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>가구 구성원 혹은 거주지에 동의를 구하셨나요?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio13" data-item="4" name="radio4" value="10" />
									<label for="radio13"><span></span><p>동의</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio14" data-item="4" name="radio4" value="0" />
									<label for="radio14"><span></span><p>비동의</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="5">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>반려동물을 키워보거나 맡아보신적이 있으신가요?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio15" data-item="5" name="radio5" value="2" />
									<label for="radio15"><span></span><p> ~ 1개월</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio16" data-item="5" name="radio5" value="4" />
									<label for="radio16"><span></span><p> 1개월 ~ 6개월</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio17" data-item="5" name="radio5" value="7" />
									<label for="radio17"><span></span><p> 6개월 ~ 1년</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio18" data-item="5" name="radio5" value="10" />
									<label for="radio18"><span></span><p> ~ 1년</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="6">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>반려동물 인식표에 대해 어느정도 인식하고 계신가요?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio19" data-item="6" name="radio6" value="0" />
									<label for="radio19"><span></span><p>모른다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio20" data-item="6" name="radio6" value="3" />
									<label for="radio20"><span></span><p>들어는 봤다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio21" data-item="6" name="radio6" value="6" />
									<label for="radio21"><span></span><p>알고있다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio22" data-item="6" name="radio6" value="10" />
									<label for="radio22"><span></span><p>정확히 알고있다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="7">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>입양할 반려동물에 대해 공부하셨나요?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio23" data-item="7" name="radio7" value="0" />
									<label for="radio23"><span></span><p>별로 생각 없다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio24" data-item="7" name="radio7" value="3" />
									<label for="radio24"><span></span><p>공부할 예정이다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio25" data-item="7" name="radio7" value="6" />
									<label for="radio25"><span></span><p>어느 정도 알고 있다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio26" data-item="7" name="radio7" value="10" />
									<label for="radio26"><span></span><p>완벽히 알고 있다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="8">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>입양 전 반려동물에 대한 용품들을 구비하셨나요?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio27" data-item="8" name="radio8" value="0" />
									<label for="radio27"><span></span><p>구비할 생각 없다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio28" data-item="8" name="radio8" value="3" />
									<label for="radio28"><span></span><p>구비할 예정이다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio29" data-item="8" name="radio8" value="6" />
									<label for="radio29"><span></span><p>어느 정도 구비했다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio30" data-item="8" name="radio8" value="10" />
									<label for="radio30"><span></span><p>완벽히 구비했다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="9">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>가구 구성원 및 본인은 반려동물에 대한 알레르기 반응이 있는지 없는지 알고계신가요?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio31" data-item="9" name="radio9" value="0" />
									<label for="radio31"><span></span><p>알레르기 반응이 있다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio32" data-item="9" name="radio9" value="0" />
									<label for="radio32"><span></span><p>검사도 하지 않았고 알지도 못한다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio33" data-item="9" name="radio9" value="5" />
									<label for="radio33"><span></span><p>검사를 하지 않았지만 알레르기 반응은 없다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio34" data-item="9" name="radio9" value="10" />
									<label for="radio34"><span></span><p>검사를 하였고 알레르기 반응도 없다.</p></label>
								</div>
							</div>
						</div>
					</div>
					
					<div class="mm-survey-controller">
						<div class="mm-prev-btn">
							<button>Prev</button>
						</div>
						<div class="mm-next-btn">
							<button disabled="true">Next</button>
						</div>
						<div class="mm-finish-btn">
							<button>Submit</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id="checkTotalFrm" action="${pageContext.request.contextPath}/check/checkTotal.do" method="GET" >
		<input name="total" type="hidden" value="0" />
	</form>
	<script>

	$('.thar-three').click(function(){
		$('#con').css("opacity","0");
	});
	
	$('.mm-prev-btn').hide();

	var x;
	var count;
	var current;
	var percent;
	var z = [];

	init();
	getCurrentSlide();
	goToNext();
	goToPrev();
	getCount();
	// checkStatus();
	// buttonConfig();
	buildStatus();
	deliverStatus();
	submitData();
	goBack();

	function init() {
		
		$('.mm-survey-container .mm-survey-page').each(function() {

			var item;
			var page;

			item = $(this);
			page = item.data('page');

			item.addClass('mm-page-'+page);
			//item.html(page);

		});

	}

	function getCount() {

		count = $('.mm-survey-page').length;
		return count;

	}
	var pageNum = 1;
	var page = document.getElementById('page');
	function goToNext() {

		$('.mm-next-btn').on('click', function() {
			goToSlide(x);
			getCount();
			current = x + 1;
			var g = current/count;
			buildProgress(g);
			var y = (count + 1);
			getButtons();
			$('.mm-survey-page').removeClass('active');
			$('.mm-page-'+current).addClass('active');
			getCurrentSlide();
			checkStatus();
			pageNum++;
			page.innerText =pageNum; 
			if( $('.mm-page-'+count).hasClass('active') ){
				if( $('.mm-page-'+count).hasClass('pass') ) {
					$('.mm-finish-btn').addClass('active');
				}
				else {
					$('.mm-page-'+count+' .mm-survery-content .mm-survey-item').on('click', function() {
						$('.mm-finish-btn').addClass('active');
					});
				}
			}
			else {
				$('.mm-finish-btn').removeClass('active');
				if( $('.mm-page-'+current).hasClass('pass') ) {
					$('.mm-survey-container').addClass('good');
					$('.mm-survey').addClass('okay');
				}
				else {
					$('.mm-survey-container').removeClass('good');
					$('.mm-survey').removeClass('okay');
				}
			}
			buttonConfig();
		});

	}

	function goToPrev() {

		$('.mm-prev-btn').on('click', function() {
			goToSlide(x);
			getCount();			
			current = (x - 1);
			var g = current/count;
			buildProgress(g);
			var y = count;
			getButtons();
			$('.mm-survey-page').removeClass('active');
			$('.mm-page-'+current).addClass('active');
			getCurrentSlide();
			checkStatus();
			pageNum--;
			page.innerText =pageNum; 
			$('.mm-finish-btn').removeClass('active');
			if( $('.mm-page-'+current).hasClass('pass') ) {
				$('.mm-survey-container').addClass('good');
				$('.mm-survey').addClass('okay');
			}
			else {
				$('.mm-survey-container').removeClass('good');
				$('.mm-survey').removeClass('okay');
			}
			buttonConfig();
		});

	}

	function buildProgress(g) {

		if(g > 1){
			g = g - 1;
		}
		else if (g === 0) {
			g = 1;
		}
		g = g * 100;
		$('.mm-survey-progress-bar').css({ 'width' : g+'%' });

	}

	function goToSlide(x) {

		return x;

	}

	function getCurrentSlide() {

		$('.mm-survey-page').each(function() {

			var item;

			item = $(this);

			if( $(item).hasClass('active') ) {
				x = item.data('page');
			}
			else {
				
			}

			return x;

		});

	}

	function getButtons() {

		if(current === 0) {
			current = y;
		}
		if(current === count) {
			$('.mm-next-btn').hide();
		}
		else if(current === 1) {
			$('.mm-prev-btn').hide();
		}
		else {
			$('.mm-next-btn').show();
			$('.mm-prev-btn').show();
		}

	}

	$('.mm-survey-q li input').each(function() {

		var item;
		item = $(this);

		$(item).on('click', function() {
			if( $('input:checked').length > 0 ) {
		    	// console.log(item.val());
		    	$('label').parent().removeClass('active');
		    	item.closest( 'li' ).addClass('active');
			}
			else {
				//
			}
		});

	});

	percent = (x/count) * 100;
	$('.mm-survey-progress-bar').css({ 'width' : percent+'%' });

	function checkStatus() {
		$('.mm-survery-content .mm-survey-item').on('click', function() {
			var item;
			item = $(this);
			item.closest('.mm-survey-page').addClass('pass');
		});
	}

	function buildStatus() {
		$('.mm-survery-content .mm-survey-item').on('click', function() {
			var item;
			$('.mm-survery-content .mm-survey-item').removeClass('on');
			item = $(this);
			item.addClass('bingo');
			item.addClass('on');
			item.closest('.mm-survey-page').addClass('pass');
			$('.mm-survey-container').addClass('good');
		});
	}

	function deliverStatus() {
		$('.mm-survey-item').on('click', function() {
			if( $('.mm-survey-container').hasClass('good') ){
				$('.mm-survey').addClass('okay');
			}
			else {
				$('.mm-survey').removeClass('okay');	
			}
			buttonConfig();
		});
	}

	function buttonConfig() {
		if( $('.mm-survey').hasClass('okay') ) {
			$('.mm-next-btn button').prop('disabled', false);
		}
		else {
			$('.mm-next-btn button').prop('disabled', true);
		}
	}

	function submitData() {
		$('.mm-finish-btn').on('click', function() {
			collectData();
		});
	}

	function collectData() {
		
		var map = {};
		var total = 0;
		
		$('.mm-survey-item input:checked').each(function(index, val) {
			var item;
			var data;
			var name;

			item = $(this);
			data = item.val();
			name = item.data('item');

			map[name] = data;

		});


		for (i = 1; i <= count; i++) {

			console.log(map[i]);
			console.log(total += Number(map[i]));
		}
		$("#checkTotalFrm").find('input').val(total);
		$("#checkTotalFrm").submit();
	}

	function goBack() {
		$('.mm-back-btn').on('click', function() {
			$('.mm-survey-bottom').slideDown();
			$('.mm-survey-results').slideUp();
		});
	}
	</script>
</body>
</html>
	