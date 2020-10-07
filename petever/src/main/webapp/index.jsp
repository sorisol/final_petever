<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js" integrity="sha512-vBmx0N/uQOXznm/Nbkp7h0P1RfLSj0HQrFSzV8m7rOGyj30fYAOKHYvCNez+yM8IrfnW0TCodDEjRqf6fodf/Q==" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/chartjs-plugin-labels.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/utils.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="${pageContext.request.contextPath}/resources/js/loading.js"></script>
   <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <article class="content">
                <p class="title">■ 실종 동물 / 보호</p>
               	<div class="slidebanner">
	                <ul class="bannerbox">
	                </ul>
               	</div>
                    <%-- <li>
                        <img src="${pageContext.request.contextPath}/resources/images/dog1.jpg" alt="실종 및 보호 동물 사진">
                    </li> --%>
                    <%-- <li>
                        <img src="${pageContext.request.contextPath}/resources/images/dog2.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/resources/images/dog3.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/resources/images/dog4.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/resources/images/dog5.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/resources/images/dog6.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/resources/images/dog7.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/resources/images/dog8.jpg" alt="실종 및 보호 동물 사진">
                    </li> --%>
            </article>
            <article class="total-wrap">
					<h1 class="totalStatis">총 ${ allCnt } 마리</h1>
					<hr style="width: 500px; background-color: white; height: 1px; border: none; margin: 0 auto;">
					<p>
						현재 대한민국 유기된 동물 
						<br />Data provided by OpenApi Animal and Plant Quarantine Agency.
					</p>
				</article>
            <article class="content2">
                <div class="content2-wrap">
                    <div class="map">
                            <h1 class="title">전국 모든 지역<br>유기동물 현황</h1>
                            <svg id="svg" x="0" y="0" width="400" height="400" viewBox="0 0 800 1200">
            
                                    <polyline id="chungnam" onclick="go_branch('chungnam')" stroke-miterlimit="1"
                                        style="fill:#ffffff;fill-opacity:1;stroke:#c0c0c0;stroke-miterlimit:1"
                                        transform="translate(106.95522,19.462687)" />
                                
                                    <polyline id="jeju" onclick="go_branch('jeju')" stroke-miterlimit="1"
                                        transform="translate(106.95522,19.462687)" style="fill:#ffffff;stroke:#c0c0c0;stroke-miterlimit:1" />
                                
                                    <polyline id="gyeongnam" onclick="go_branch('gyeongnam')" stroke-miterlimit="1"
                                        transform="translate(106.95522,19.462687)" style="fill:#ffffff;stroke:#c0c0c0;stroke-miterlimit:1" />
                                
                                    <polyline id="gyeongbuk" onclick="go_branch('gyeongbuk')" stroke-miterlimit="1"
                                        transform="translate(106.95522,19.462687)" style="fill:#ffffff;stroke:#c0c0c0;stroke-miterlimit:1" />
                                
                                    <polyline id="jeonbuk" onclick="go_branch('jeonbuk')" stroke-miterlimit="1"
                                        transform="translate(106.95522,19.462687)" style="fill:#ffffff;stroke:#c0c0c0;stroke-miterlimit:1" />
                                
                                    <polyline id="chungbuk" onclick="go_branch('chungbuk')" stroke-miterlimit="1"
                                        transform="translate(106.95522,19.462687)" style="fill:#ffffff;stroke:#c0c0c0;stroke-miterlimit:1" />
                                
                                    <polyline id="gangwon" onclick="go_branch('gangwon')" stroke-miterlimit="1"
                                        transform="translate(106.95522,19.462687)" style="fill:#ffffff;stroke:#c0c0c0;stroke-miterlimit:1" />
                                
                                    <polyline id="gyeonggi" onclick="go_branch('gyeonggi')"
                                        transform="translate(106.95522,19.462687)" style="fill:#fff; stroke:#c0c0c0; " />
                                
                                    <polyline id="jeonnam" onclick="go_branch('jeonnam')" stroke-miterlimit="1"
                                        transform="translate(106.95522,19.462687)" style="fill:#ffffff;stroke:#c0c0c0;stroke-miterlimit:1" />
                                
                                    <polyline id="ulsan" onclick="go_branch('ulsan')" stroke-miterlimit="1"
                                        transform="translate(106.95522,19.462687)" style="fill:#ffffff;stroke:#c0c0c0;stroke-miterlimit:1" />
                                
                                    <polyline id="busan" onclick="go_branch('busan')" stroke-miterlimit="1"
                                        transform="translate(106.95522,19.462687)" style="fill:#ffffff;stroke:#c0c0c0;stroke-miterlimit:1" />
                                
                                    <polyline id="daegu" onclick="go_branch('daegu')" stroke-miterlimit="1"
                                        transform="translate(106.95522,19.462687)" style="fill:#ffffff;stroke:#c0c0c0;stroke-miterlimit:1" />
                                
                                    <polyline id="daejeon" onclick="go_branch('daejeon')" stroke-miterlimit="1"
                                        style="fill:#ffffff;stroke:#c0c0c0;stroke-miterlimit:1" transform="translate(106.95522,19.462687)" />
                                
                                    <polyline id="seoul" onclick="go_branch('seoul')" stroke-miterlimit="1"
                                        transform="translate(106.95522,19.462687)" style="fill:#ffffff;stroke:#c0c0c0;stroke-miterlimit:1" />
                                
                                    <polyline id="gwangju" onclick="go_branch('gwangju')" stroke-miterlimit="1"
                                        transform="translate(106.95522,19.462687)" style="fill:#ffffff;stroke:#c0c0c0;stroke-miterlimit:1" />
                                
                                    <path id="sejong" onclick="go_branch('sejong')"
                                        d="m 309.28023,486.01769 -7.03,-4.811 -3.025,-4.724 -1.554,-6.834 0.817,-7.381 0.736,-8.568 -5.314,-2.874 -6.213,-8.321 1.799,-5.547 -0.817,-7.454 -3.434,-3.467 2.289,-4.507 6.049,-0.347 11.608,7.281 5.722,-0.173 0.654,2.947 h 2.126 l -0.654,5.374 -3.597,2.6 1.635,4.161 2.616,3.294 v 5.547 l 4.414,1.907 5.632,2.508 2.271,2.85 -1.199,7.167 1.199,2.773 -2.734,1.624 0.676,5.695 -2.247,5.813 -4.905,5.374 -5.068,0.173 -2.452,-2.08 z"
                                        style="fill:#ffffff;stroke:#c0c0c0" />
                                    </svg>
                    </div>
                    <div class="stats-wrap">
                        <ul>
                            <li>강아지</li>
                            <li>고양이</li>
                            <li>기타</li>
                        </ul>
                        <div class="canvas-wrap">
                            <div class="stats">
                                <canvas id="doughnut" class="chartjs" style="display: block;"></canvas>
                            </div>
                            <div class="stats  bar">
    
                                <canvas id="barChart" class="chartjs"
                                    style="display: block; width: 285px; height:300px"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        </section>
    </div>
    
<div id="svg-back"></div>
<svg id="loading" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
	xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	viewBox="0 0 1000 441" style="enable-background: new 0 0 1000 441;"
	xml:space="preserve">



                <path class="back-legs-front"
		d="M721.9,275l-11.3,81c20.1,14.3,18.6,22.6,18.2,24.4c-3.1,11.9-34.8,20.4-54.5,7.4
       c-15.2-10.1-16.7-28.6-16.9-31.8l13-103.6L721.9,275z" />
                <path class="back-legs-back"
		d="M255.1,300.9l15.6,87.3c0,0,72,23.7,72,0s-21.4-29.3-21.4-29.3l-11.7-101.1L255.1,300.9z" />
                <path class="body"
		d="M211.3,109.2C274.2,79.4,382.4,38.8,520.5,39c137.3,0.2,244.8,40.5,307.6,70.2c0,73,0,146,0,219.1
       c-66.1-29.3-175.4-67-313.4-66c-132.8,0.9-238.3,37.2-303.4,66c-7.8-9.8-34.7-46.2-37-102.1C171.8,160.9,204.8,117.5,211.3,109.2z" />

                <path class="ear"
		d="M948.3,273h-13.4c-15.8,0-28.8-13-28.8-28.8V74.6c0-15.8,13-28.8,28.8-28.8h13.4c15.8,0,28.8,13,28.8,28.8
       v169.6C977.1,260,964.1,273,948.3,273z" />
                <path class="ear"
		d="M756.7,273h-13.4c-15.8,0-28.8-13-28.8-28.8V74.6c0-15.8,13-28.8,28.8-28.8h13.4c15.8,0,28.8,13,28.8,28.8
       v169.6C785.5,260,772.5,273,756.7,273z" />

                <path class="head"
		d="M889.4,329.1h-89.1c-27.6,0-50.3-22.6-50.3-50.3V88.5c0-27.6,22.6-50.3,50.3-50.3h89.1
       c27.6,0,50.3,22.6,50.3,50.3v190.4C939.6,306.5,917,329.1,889.4,329.1z" />
                <ellipse class="eyes" cx="801.8" cy="132.9" rx="17.7"
		ry="20.6" />
                <ellipse class="eyes" cx="893.7" cy="132.9" rx="17.7"
		ry="20.6" />
                <path class="nose"
		d="M817.6,200.2c3.6-2.9,14.4-10.7,29.7-10.1c13.5,0.5,23,7.2,26.7,10.1c-1.9,18.9-16.3,32.2-31.1,30.4
       C830,229.2,819.1,216.5,817.6,200.2z" />

                <path class="mouth"
		d="M844.3,247.2c0,0.6,0.7,10.7-6.5,16.9c-6.8,5.9-14.5,2.9-15.2,2.6c-0.9,6.1-1.8,15.8-0.1,27.4
       c1.6,10.5,2.8,18.3,8.4,23.7c8.9,8.5,25,6.9,31.8-2.3c2.8-3.8,3.6-10.9,4.9-24.8c0.9-9.2,1.2-16.8,1.3-22.2
       c-5.8,0.3-13.4-0.5-18.2-6.4C846,256.2,844.2,245.2,844.3,247.2z" />


                <path
		d="M881.4,235.2c0.4,1,0,2.2-0.9,2.7c-0.9,0.4-1.9-0.1-2.3-1.1c-0.4-1,0-2.2,0.9-2.7C880,233.7,881,234.2,881.4,235.2z" />
                <path
		d="M899.9,247c0.4,1,0,2.2-0.9,2.7c-0.9,0.4-1.9-0.1-2.3-1.1c-0.4-1,0-2.2,0.9-2.7S899.5,246,899.9,247z" />
                <path
		d="M891.7,241c0.4,1,0,2.2-0.9,2.7c-0.9,0.4-1.9-0.1-2.3-1.1c-0.4-1,0-2.2,0.9-2.7C890.3,239.5,891.3,240,891.7,241z" />
                <path
		d="M886,248.2c0.4,1,0,2.2-0.9,2.7s-1.9-0.1-2.3-1.1c-0.4-1,0-2.2,0.9-2.7S885.7,247.2,886,248.2z" />
                <path
		d="M892.4,260.4c0.4,1,0,2.2-0.9,2.7c-0.9,0.4-1.9-0.1-2.3-1.1c-0.4-1,0-2.2,0.9-2.7S892,259.3,892.4,260.4z" />
                <path
		d="M895.8,230.4c0.4,1,0,2.2-0.9,2.7s-1.9-0.1-2.3-1.1c-0.4-1,0-2.2,0.9-2.7C894.4,228.9,895.5,229.4,895.8,230.4z" />
                <path
		d="M810.2,236.4c-0.5,1.2-0.1,2.6,0.8,3.1s2.1-0.1,2.5-1.3s0.1-2.6-0.8-3.1S810.7,235.2,810.2,236.4z" />
                <path
		d="M789.6,249.9c-0.5,1.2-0.1,2.6,0.8,3.1s2.1-0.1,2.5-1.3c0.5-1.2,0.1-2.6-0.8-3.1C791.2,248.2,790.1,248.7,789.6,249.9z" />
                <path
		d="M798.8,243c-0.5,1.2-0.1,2.6,0.8,3.1c0.9,0.5,2.1-0.1,2.5-1.3c0.5-1.2,0.1-2.6-0.8-3.1C800.4,241.3,799.3,241.8,798.8,243z" />
                <path
		d="M804.2,251.3c-0.5,1.2-0.1,2.6,0.8,3.1c0.9,0.5,2.1-0.1,2.5-1.3c0.5-1.2,0.1-2.6-0.8-3.1S804.6,250.1,804.2,251.3z" />
                <path
		d="M796.5,265.3c-0.5,1.2-0.1,2.6,0.8,3.1s2.1-0.1,2.5-1.3s0.1-2.6-0.8-3.1C798.1,263.5,796.9,264.1,796.5,265.3z" />
                <path
		d="M795.3,230.9c-0.5,1.2-0.1,2.6,0.8,3.1s2.1-0.1,2.5-1.3c0.5-1.2,0.1-2.6-0.8-3.1S795.8,229.7,795.3,230.9z" />
                <path class="tail"
		d="M211.3,109.2c0,0-99.2,96.2-136.1,74.4c-37-21.7-9.7-164.9-9.7-164.9c-7.6,9.1-45.7,56.2-42.1,124.4
       c0.8,15.2,3.8,71.7,34.3,89.9c51,30.4,152.2-62.3,153.6-63.1l0,0V109.2z" />
                <path class="legs-front"
		d="M211.3,328.3l15.6,87.3c0,0,72,23.7,72,0s-21.4-29.3-21.4-29.3l-11.7-101.1L211.3,328.3z" />
                <path class="legs-front"
		d="M755.5,295.5l-11.3,81c20.1,14.3,18.6,22.6,18.2,24.4c-3.1,11.9-34.8,20.4-54.5,7.4
       c-15.2-10.1-16.7-28.6-16.9-31.8L704,273L755.5,295.5z" />


        </svg>

<script>
// Map관련    
   function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
    
window.onload = function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/animalboard/index",
		method : "GET",
		success : function(data){
			console.log(data);
			if(data.boardList != null) {
				var $ul = $('.bannerbox');
				
				var html = '';
				for(var i in data.boardList) {
					var b = data.boardList[i];
					for(var j in data.attachList) {
						var a = data.attachList[j];
						if(b.aniBoId == a.aniBoId){
							html += '<li>';
							html += '<a href="${ pageContext.request.contextPath }/animalboard/boardView?no='+b.aniBoId+'">';
							html += '<img src="${pageContext.request.contextPath}/resources/editor/multiupload/'+a.aniAtRenamedName+'" alt="실종 및 보호 동물 사진">'
						}
					}
				}
			}
			html += '</a></li>';
			$ul.append(html);
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
	});
	timer();
	var current=0;
	var $interval;

	function timer(){
	  var $interval=setInterval(function(){slide()},2000);                        
	}

	function slide(){
	  $(".bannerbox").animate({left:"-=200px"},1000,function(){
	    $(this).css({"left":0});
	    $(".bannerbox").append( $(".bannerbox").children("li").eq(0) );
	  });    
	  current++;
	  if(current==5)current=0;
	}
	
		$.ajax({
			url : "${ pageContext.request.contextPath}/statis/mainLoadStatis.do",
			dataType:"json",
			method : "GET",
			success : function(res){
				var loadData = [res.loadResult[1], res.loadResult[2], res.loadResult[3], res.loadResult[4], res.loadResult[5], res.loadResult[6], res.loadResult[7]];

				doughnutChart.data.datasets.forEach(function(dataset) {
					dataset.data = loadData;
				});
				barChartTop.data.datasets.forEach(function(dataset) {
					dataset.data = loadData;
				});

				doughnutChart.update();
				barChartTop.update();

				$(".totalStatis").text("총 "+ numberWithCommas(res.loadResult[0]) +" 마리");
			},
			error : function(xhr, status, err){
				console.log("처리실패", xhr, status, err);
			}
		});
	};
    
    var label = ["보호", "입양", "반환", "자연사", "안락사", "방사", "기증"];
    var back = ["#245EFF", "#3DD5FF", "#40F7B4", "#00C788", "#FFAA9D", "#FB5F83", "#BB4BEB"]
    var doughnutChart = new Chart(
            document.getElementById("doughnut"), {
                "type": "doughnut",
                "data": {
                    "labels": label,
                    "datasets": [{
                        "backgroundColor": back
                    }]
                },
                options: {
                    hover: {
                        animationDuration: 0
                    },
                    pieceLabel: {
                        render: 'percentage'
                    },
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        display: false
                    }
                }
            });

        var barOptions_stacked = {
            animation: {
                onComplete: function () {
                    var chartInstance = this.chart;
                    var ctx = chartInstance.ctx;
                    ctx.textAlign = "left";
                    ctx.font = "11px Open Sans";
                    ctx.fillStyle = "black";

                    Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.controller.getDatasetMeta(i);
                        Chart.helpers.each(meta.data.forEach(function (bar, index) {
                            data = dataset.data[index];
                            if (i == 0) {
                                ctx.fillText(data, bar._model.x - 1, bar._model.y);
                            } else {
                                ctx.fillText(data, bar._model.x - 25, bar._model.y + 4);
                            }
                        }), this)
                    }), this);
                }
            }
        };

        var ctx = document.getElementById("barChart");
        var barChartTop = new Chart(ctx, {
            type: 'horizontalBar',
            data: {
                labels: label,

                datasets: [{
                    label: "유기동물 현황(마리)",
                    backgroundColor: back
                }]
            },

            options: {
                barOptions_stacked,
                maintainAspectRatio: false,
                legend: {
                    labels: {
    					fontSize: 18,
                        boxWidth: 0
                    }
                }
            }
        });

     function go_branch(city_do) {
         var Arr = Array("sejong", "chungnam", "jeju", "gyeongnam", "gyeongbuk", "jeonbuk", "chungbuk", "gangwon",
           "gyeonggi", "jeonnam", "ulsan", "busan", "daegu", "daejeon", "incheon", "seoul", "gwangju");
         var strArr = Array("충청북도", "충청남도", "제주특별자치도", "경상남도", "경상북도", "전라북도", "충청북도", "강원도", "서울특별시", "전라남도", "경상남도",
           "경상남도", "경상북도", "충청남도", "서울특별시", "서울특별시", "전라남도");
         var idx = Arr.indexOf(city_do);
		console.log(idx);
         $.ajax({
     			url : "${ pageContext.request.contextPath}/statis/mainStatis.do",
     			data : {
     				area : strArr[idx]
     			},
     			dataType:"json",
     			method : "GET",
     			success : function(res){
     				var loadData = [res.loadResult[1], res.loadResult[2], res.loadResult[3], res.loadResult[4], res.loadResult[5], res.loadResult[6], res.loadResult[7]];

     				doughnutChart.data.datasets.forEach(function(dataset) {
     					dataset.data = loadData;
     				});
     				barChartTop.data.datasets.forEach(function(dataset) {
     					dataset.data = loadData;
     				});

     				doughnutChart.update();
     				barChartTop.update();
     			},
     			error : function(xhr, status, err){
     				console.log("처리실패", xhr, status, err);
     			}
     		});
       }
     
    //강아지 고양이 기타 버튼관련
    var $btn = $(".stats-wrap ul").find("li");
	var kind;
    $btn.eq(0).click(function(){
        $btn.removeClass("on");
        $(this).addClass("on");
        $("polyline").css("fill", "#fff");
    	$("#sejong").css("fill", "#fff");
    	clickCheck = true;
        ajaxBtn("개");
    });
    $btn.eq(1).click(function(){
        $btn.removeClass("on");
        $(this).addClass("on");
        $("polyline").css("fill", "#fff");
    	$("#sejong").css("fill", "#fff");
    	clickCheck = true;
        ajaxBtn("고양이");
        
    });
    $btn.eq(2).click(function(){
        $btn.removeClass("on");
        $(this).addClass("on");
        $("polyline").css("fill", "#fff");
    	$("#sejong").css("fill", "#fff");
    	clickCheck = true;
        ajaxBtn("기타");
    });
	
    function ajaxBtn(kind){
        $.ajax({
 			url : "${ pageContext.request.contextPath}/statis/btnStatis.do",
 			data : {
 				kind : kind
 			},
 			dataType:"json",
 			method : "GET",
 			success : function(res){
 				var loadData = [res.loadResult[1], res.loadResult[2], res.loadResult[3], res.loadResult[4], res.loadResult[5], res.loadResult[6], res.loadResult[7]];

 				doughnutChart.data.datasets.forEach(function(dataset) {
 					dataset.data = loadData;
 				});
 				barChartTop.data.datasets.forEach(function(dataset) {
 					dataset.data = loadData;
 				});

 				doughnutChart.update();
 				barChartTop.update();
 			},
 			error : function(xhr, status, err){
 				console.log("처리실패", xhr, status, err);
 			}
 		});
    }
    
</script>
 <script src="${ pageContext.request.contextPath }/resources/js/d3.min.js"></script>
 <script src="${ pageContext.request.contextPath }/resources/js/map.js"></script>
 
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
