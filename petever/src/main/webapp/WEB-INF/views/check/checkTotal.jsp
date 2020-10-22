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
		width:1140px;
		height:690px;
	    padding:0;
	    margin:80px auto 0;
	}
	.thar-three {
	    font-size: 24px;
	    font-weight: bold;
	    text-decoration: none;
	    text-align: center;
	    background-color: white;
	    cursor: pointer;
		display: block;
		position: relative;
		border: 2px solid white;
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
		background: #d7dcf0;
		transition: all 0.4s cubic-bezier(0.42, 0, 0.58, 1);
		color: white !important;
	}
</style>
<body id="total">
<c:if test="${total >=80 }">
	<style>
		#total{
			background-color:#d7dcf0 !important;
		}
		#con{
			background:url('${pageContext.request.contextPath }/resources/images/100.png');
			background-size: 100%;
		    background-repeat: no-repeat;
		    background-position: top center;
		    background-color: white;
		}
		.thar-three{
		    width: 200px;
		    height: 45px;
		    top:345px;
		    left:450px;
		    color: #d7dcf0;
		}
		.score{
			width: 410px;
		    position: relative;
		    top: 220px;
		    left: 344px;
		    font-size: 60px;
		    text-align: center;
		}
	</style>
</c:if>
<c:if test="${total < 80 && total >= 60}">
	<style>
		#total{
			background-color:#b0dcff !important;
		}
		#con{
			background:url('${pageContext.request.contextPath }/resources/images/80.png');
			background-size: 100%;
		    background-repeat: no-repeat;
		    background-position: top center;
		    background-color: white;
		}
		.score{
			width: 410px;
		    position: relative;
		    top: 50px;
		    left: 344px;
		    font-size: 60px;
		    text-align: center;
		}
		.thar-three {
		    width: 150px;
		    height: 45px;
		    top: 160px;
		    left: 468px;
		    color: #b0dcff;
		}
	</style>
</c:if>
<c:if test="${total < 60}">
	<style>
		#total{
			background-color:#398dff !important;
		}		
		#con{
			background:url('${pageContext.request.contextPath }/resources/images/0.png');
			background-size: 100%;
		    background-repeat: no-repeat;
		    background-position: top center;
		    background-color: white;
		}
		.score{
			width: 410px;
		    position: relative;
		    top: 100px;
		    margin:0 auto;
		    font-size: 60px;
		    text-align: center;
		}
		.thar-three {
		    width: 400px;
		    height: 45px;
		    top: 525px;
		    margin:0 auto;
		    color: #398dff;
		}
	</style>
</c:if>
	<div id="con">
		<div class="score">${total }점</div>
		<a href="${pageContext.request.contextPath}" class="animated-button thar-three">Home ></a>
	</div>
	<div class="check-result">
	<c:if test="${total < 60}">
		<p>
			<span class="coment">* 아래 결과는 대표 반려동물인 강아지와 고양이 중 강아지를 기준으로 작성되었습니다.</span>
			비용도 비용이지만 시간도 고려하셔야 합니다.<br />
			최소 10년에서 길면 20년까지 삽니다.<br />
			이사/결혼/출산 뒤에도 강아지를 잘 케어할 수 있을지 생각하셔야합니다.<br />
			강아지는 10살이 되어도 20살이 되어도 옆에서 케어해줘야하는<br /> 
			3살 아기 같은 존재입니다.<br />
			아기가 태어나면 아기한테 올인해도 부부끼리 힘들고 싸운다는데<br /> 
			강아지까지 케어가 가능할지?<br />
			애기 태어나면 애기가 알레르기 있다면?<br />
			이사 갈 집은 반려동물 키워도 되나요?<br />
			앞으로 자가 집구하시는 거 아니시면 집구하실 때도 계속 반려동물을 키울 수 있는 집인지<br /> 
			확인하셔야 할 것입니다.<br />
			<br />
			그리고 건강할 때는 크게 돈 많이 안 듭니다.<br />
			사료/배변판/간식/1달에 한번 심장사상충 등등<br /> 
			무난한 강아지에 사료를 많이 먹지 않는다면 월 5만원으로도 키울 수 있습니다.<br />
			<br />
			그런데 아프기 시작하면 돈 끝없이 나가게 됩니다.<br />
			알레르기라도 있으면 병원 가서 약 바르고 약타오는데 3~5만원 사람은 뼈 부러져서 깁스해도<br /> 
			의료보험 되지만 강아지는 의료 보험 안 되어서 사람보다 몇 배나 깨지게 됩니다.<br />
			게다가 강아지는 어디가 아픈지 표현을 못하기 때문에 보험도 안되어 비싼 검사를 다양하게 하면<br /> 
			돈백은 가볍습니다.<br />
			뭐 하나 잘못 집어먹으면 엑스레이 찍고 개복수술하고 하면 그것도 돈이 몇 십은 기본<br /> 
			사람 엑스레이는 5천 원 하지만 개 엑스레이는 몇 만 원합니다.<br />
			<br />
			내 삶의 10년, 20년 동안 매일의 일부분을 의무적으로 반려동물에게 투자해야합니다.<br />
			하루 한 시간이라 하지만 저건 정말, 정말 최소한 들이는 시간이죠.<br />
			산책하고, 목욕도 시키고, 사료/물 챙겨주고, 집 안에서도<br /> 
			장난감 던져주고 놀아주고 등도 긁어주고 함께 해야 합니다.<br />
			<br />
			당장의 들어갈 돈 보다,<br />
			내가 키울 반려동물을 위해 내 인생의 20년을 꾸준하게 투자할 수 있는지<br /> 
			먼저 생각해보시길 바랍니다.
		</p>
		<p>${dog[0] }</p>
		<p>${dogEx[0] }</p>
	</c:if>
	<c:if test="${total >= 60}">
		<span class="coment">* 아래 결과는 대표 반려동물인 강아지와 고양이 중 강아지를 기준으로 작성되었습니다.</span><br/>
		고정적으로 나가는 지출을 생각해보면 간식비를 포함하여 소형견 기준으로 1달에<br /> 
		${ money }만원이 소모된다고 보시면 됩니다<br />
		이 비용은 사료값과 간식값 정도 포함된 것입니다.<br />
		<br />
		문제는 병원비가 포함되지 않은 것인데, 동물은 의료보험이 전혀 적용되지 않기 때문에<br /> 
		병에 걸릴 경우 검사비로도 꽤 많은 비용이 청구됩니다.<br />
		<br />
		예방접종도 마찬가지로 3~7만원 가량이 부과되는데,<br /> 
		한달에 한번씩 맞히는게 아니라 고정 지출로 고려하긴 힘듭니다<br />
		또한 가장 큰 문제는 동물을 전혀 키우지 않던 사람이 키울 경우에는 <br />
		강아지의 경우 배변 패드등을 비롯한 애완 물품들을 구매하보면 꽤 많은 지출이 있을 것입니다<br />
		<br />
		배변패드, 사료, 예방접종, 기타 애완용품 등의 구입을 하신다면 키우게 되는 첫달에<br /> 
		약 60~100만 가량 소요될 수 있으니 이를 염두해두시는게 좋을 것같습니다<br />
		<br />
		동물을 키움에 있어서 비용적문제는 초기 물품을 구입한 뒤로는 병에 걸리지 않는 이상<br /> 
		큰 돈이 들어가진 않습니다 오히려 시간적 이유로 키우기 힘든 부분이 많은 것이죠<br />
		<br />
		강아지의 경우 지속적인 산책이 필요하고 그렇게 하기 위해서는<br /> 
		하루 1,2시간가량은 꼭 시간을 할당하셔야합니다<br />
		매우 간단한 일인 것 처럼 보이지만 실상은 꽤 어려운 부분이죠<br />
		<br />
		비용적 문제보다는 시간적 문제를 고려하셔서 분양 생각을 해보시는게 좋을 듯 싶습니다
	</c:if>
	</div>
	<div class="dog-wrap">
		<div class="ment">${weightMent }</div>
		<ul class="img-wrap">
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/dog/${ dogImg[0]}"/>
				<br/>${dog[0] }
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/dog/${ dogImg[1]}"/>
				<br/>${dog[1] }
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/dog/${ dogImg[2]}"/>
				<br/>${dog[2] }
			</li>
		</ul>
		<div class="dogEx">
			<div class="av">
			<c:if test='${ not empty av.fileName }'>
				<a href="${pageContext.request.contextPath }/shelterBoard/shelterAni?deserNo=${ av.desertionNo }">
					<img src="${ av.fileName }"/>
				</a>
					<br />사지말고 입양하세요<br />
				■ 나이 : ${ av.age }<br />
				■ 무게 : ${ av.weight }<br />
				■ 성별 : ${ av.genderCd }<br />
			</c:if>
			<c:if test='${ empty av.fileName }'>
				해당 유기견은 모두 <br />
				입양 종료되었습니다.
			</c:if>
			</div>
			<div class="ex">
				${dogEx[0] }
			</div>
		</div>
		<div class="dogEx out">
			<div class="av">
			<c:if test='${ not empty av1.fileName }'>
				<a href="${pageContext.request.contextPath }/shelterBoard/shelterAni?deserNo=${ av1.desertionNo }">
					<img src="${ av1.fileName }"/>
				</a>
				<br />사지말고 입양하세요<br />
				■ 나이 : ${ av1.age }<br />
				■ 무게 : ${ av1.weight }<br />
				■ 성별 : ${ av1.genderCd }<br />
				</c:if>
			<c:if test='${ empty av1.fileName }'>
				해당 유기견은 모두 <br />
				입양 종료되었습니다.
			</c:if>
			</div>
			<div class="ex">
				${dogEx[1] }
			</div>
		</div>
		<div class="dogEx out">
			<div class="av">
			<c:if test='${ not empty av2.fileName }'>
				<a href="${pageContext.request.contextPath }/shelterBoard/shelterAni?deserNo=${ av2.desertionNo }">
					<img src="${ av2.fileName }"/>
				</a>
				<br />사지말고 입양하세요<br />
				■ 나이 : ${ av2.age }<br />
				■ 무게 : ${ av2.weight }<br />
				■ 성별 : ${ av2.genderCd }<br />
				</c:if>
			<c:if test='${ empty av2.fileName }'>
				해당 유기견은 모두 <br />
				입양 종료되었습니다.
			</c:if>
			</div>
			<div class="ex">
				${dogEx[2] }
			</div>
		</div>
	</div>
	
</body>

<script>
	$(".dog-wrap").find("li").eq(0).click(function(){
		$(".dogEx").addClass("out");		
		$(".dogEx").eq(0).removeClass("out");		
	});
	$(".dog-wrap").find("li").eq(1).click(function(){
		$(".dogEx").addClass("out");		
		$(".dogEx").eq(1).removeClass("out");		
	});
	$(".dog-wrap").find("li").eq(2).click(function(){
		$(".dogEx").addClass("out");		
		$(".dogEx").eq(2).removeClass("out");		
	});
</script>
</html>
	