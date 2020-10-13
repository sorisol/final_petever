<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"
	integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg=="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"
	integrity="sha512-vBmx0N/uQOXznm/Nbkp7h0P1RfLSj0HQrFSzV8m7rOGyj30fYAOKHYvCNez+yM8IrfnW0TCodDEjRqf6fodf/Q=="
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/chartjs-plugin-labels.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/utils.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/statis.css" />
<script src="${pageContext.request.contextPath}/resources/js/loading.js"></script>
<div id="main-wrap">
	<section class="main"></section>
	<section class="content-wrap">
		<h1>유기동물 통계</h1>
		<form action="${pageContext.request.contextPath}/statis/statisXml.do"
			method="POST">
			<input type="submit" value="전송" style="" />
		</form>
		<p>전국 모든지역 유기동물 현황</p>
		<div class="content">
			<div class="shelter-search-wrap">
				<form id="searchFrm" method="GET">
					<label for="city">시도</label> <select name="city" id="city"></select>
					<label for="province">구/군</label> <select name="province"
						id="province"></select> <input type="date" id="startDay"
						name="trip-start" value="2017-01-01" min="2017-01-01"
						max="2020-09-21"> <input type="date" id="endDay"
						name="trip-start" value="2020-09-26" min="2017-01-01"
						max="2020-09-26"> <input type="button" value="검색"
						id="search-btn">
				</form>
			</div>
			<div class="stats-wrap">
				<div class="canvas-wrap">
					<div class="stats">
						<canvas id="doughnut" class="chartjs"></canvas>
					</div>
					<div class="stats bar">
						<canvas id="barChart" class="chartjs"></canvas>
					</div>
				</div>
				<article class="total-wrap">
					<h1 class="totalStatis">총 ${ allCnt } 마리</h1>
					<hr
						style="width: 500px; background-color: white; height: 1px; border: none; margin: 0 auto;">
					<p>
						현재 <span id="area" style="color:white; font-weight:bold; font-size:20px;">대한민국</span> 유기된 동물 <br />Data provided by OpenApi Animal and
						Plant Quarantine Agency.
					</p>
				</article>
				<div class="canvas-wrap">
					<div class="area">
						<canvas id="AreabarChart1" class="chartjs"></canvas>
					</div>
					<div class="area">
						<canvas id="AreabarChart2" class="chartjs"></canvas>
					</div>
				</div>
			</div>
		</div>
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
</body>
<script>
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	window.onload = function(){
		$.ajax({
			url : "${ pageContext.request.contextPath}/statis/loadStatis.do",
			dataType:"json",
			method : "GET",
			success : function(res){
				var loadData = [res.loadResult[1], res.loadResult[2], res.loadResult[3], res.loadResult[4], res.loadResult[5], res.loadResult[6], res.loadResult[7]];
				var ajaxLable = ["서울", "경기", "인천", "강원", "충남", "충북", "경북", "경남", "전남", "전북", "제주"];
				var adoptSum = 0;
				var euthanasiaSum = 0;
				var adoptChartData = new Array();
				var euthanasiaChartData = new Array();
				var labelCity = $("select[name=city]").val();
				
				for(var i = 0; i <(res.adopt).length; i++){
					adoptSum+=res.adopt[i];
					euthanasiaSum+=res.euthanasia[i];
				}
				for(var j = 0; j <(res.adopt).length; j++){
					adoptChartData[j] = Math.round((res.adopt[j]/adoptSum)*10000)/100;
					euthanasiaChartData[j] = Math.round((res.euthanasia[j]/euthanasiaSum)*10000)/100;
				}

				$(".area").css("height","500px");
				
				doughnutChart.data.datasets.forEach(function(dataset) {
					dataset.data = loadData;
				});
				barChartTop.data.datasets.forEach(function(dataset) {
					dataset.data = loadData;
				});

				addData(adoptChart, ajaxLable, adoptChartData, labelCity, 1);
				
				addData(euthanasiaChart, ajaxLable, euthanasiaChartData, labelCity, 2);

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
    var back = ["#245EFF", "#3DD5FF", "#40F7B4", "#00C788", "#FFAA9D", "#FB5F83", "#BB4BEB"];

	function getColorRed(){
    	var colorData = [];
		for(var a=0; a<35 ; a++){
			if(a%2==0){
				colorData.push("#FEC2C0");
			}else{
				colorData.push("#f08080");
			}
		}
		return colorData;
    }

    function getColorBlue(){
    	var colorData = [];
		for(var a=0; a<35 ; a++){
			if(a%2==0){
				colorData.push("#A4DFF9");
			}else{
				colorData.push("#51B5E0");
			}
    	}
		return colorData;
    }
    
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

        var ctx = document.getElementById("AreabarChart1");
        var adoptChart = new Chart(ctx, {
            type: 'horizontalBar',
            data: {
                labels: ["서울", "경기", "인천", "강원도", "충남", "충북", "경북", "경남", "전남", "전북", "제주도"],

                datasets: [{
                    label: "지역별 입양 및 보호율(%) 17.01.01 ~ 현재",
                    barPercentage: 0.5,
                    barThickness: 15,
                    maxBarThickness: 15,
                    minBarLength: 2,
                    backgroundColor: getColorBlue()
                }]
            },

            options: {
                barOptions_stacked,
                maintainAspectRatio: false,
                legend: {
                    labels: {
                        fontColor: "#51B5E0",
    					fontSize: 18,
                        boxWidth: 0
                    }
                },
    			hover: {
    				animationDuration: 0
    			},
    			animation: {
    				duration: 1,
    				onComplete: function () {
    					var chartInstance = this.chart,
    						ctx = chartInstance.ctx;
    					ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
    					ctx.fillStyle = 'black';
    					ctx.textAlign = 'center';
    					ctx.textBaseline = 'bottom';
    					
    					this.data.datasets.forEach(function (dataset, i) {
    						var meta = chartInstance.controller.getDatasetMeta(i);
    						meta.data.forEach(function (bar, index) {
    							var data = dataset.data[index];							
    							ctx.fillText(data+'%', bar._model.x-15, bar._model.y+6);
    						});
    					});
    				}
    			}
            }
        });

        var ctx = document.getElementById("AreabarChart2");
        var euthanasiaChart = new Chart(ctx, {
            type: 'horizontalBar',
            data: {
            	labels: ["수도권", "강원도", "충남", "충북", "경북", "경남", "전남", "전북", "제주도"],

                datasets: [{
                    label: "지역별 안락사 및 자연사율(%) 17.01.01 ~ 현재",
                    barPercentage: 0.5,
                    barThickness: 15,
                    maxBarThickness: 15,
                    minBarLength: 2,
                    backgroundColor: getColorRed()
                }]
            },

            options: {
                barOptions_stacked,
                maintainAspectRatio: false,
                legend: {
                    labels: {
                        fontColor: "red",
    					fontSize: 18,
                        boxWidth: 0
                    }
                },
    			hover: {
    				animationDuration: 0
    			},
    			animation: {
    				duration: 1,
    				onComplete: function () {
    					var chartInstance = this.chart,
    						ctx = chartInstance.ctx;
    					ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
    					ctx.fillStyle = 'black';
    					ctx.textAlign = 'center';
    					ctx.textBaseline = 'bottom';
    					
    					this.data.datasets.forEach(function (dataset, i) {
    						var meta = chartInstance.controller.getDatasetMeta(i);
    						meta.data.forEach(function (bar, index) {
    							var data = dataset.data[index];							
    							ctx.fillText(data+'%', bar._model.x-15, bar._model.y+6);
    						});
    					});
    				}
    			}
            }
        });
    
	$("#search-btn").click(function(){
		var city = $("#city").val();
		var province = $("#province").val();
		var startDay = $("#startDay").val();
		var endDay = $("#endDay").val();
		console.log(city, province, startDay, endDay);
		var paramArea;
		switch(area){
			case"area1" : paramArea = area1; break;
			case"area2" : paramArea = area2; break;
			case"area3" : paramArea = area3; break;
			case"area4" : paramArea = area4; break;
			case"area5" : paramArea = area5; break;
			case"area6" : paramArea = area6; break;
			case"area7" : paramArea = area7; break;
			case"area8" : paramArea = area8; break;
			case"area9" : paramArea = area9; break;
			case"area10" : paramArea = area10; break;
			case"area11" : paramArea = area11; break;
			case"area12" : paramArea = area12; break;
			case"area13" : paramArea = area13; break;
			case"area14" : paramArea = area14; break;
			case"area15" : paramArea = area15; break;
			case"area16" : paramArea = area16; break;
		}
		console.log(paramArea);
		if($("#city option:selected").val() == "전국"){
			$.ajax({
				url : "${ pageContext.request.contextPath}/statis/searchStatis.do",
				data : {
					city : city,
					province : province,
					startDay : startDay,
					endDay : endDay,
					paramArea : JSON.stringify(paramArea)
				},
				dataType:"json",
				method : "GET",
				success : function(res){
					var ajaxStaticData = [ res.areaResult[1], res.areaResult[2], res.areaResult[3], res.areaResult[4], res.areaResult[5], res.areaResult[6], res.areaResult[7]];
					var ajaxLable = ["서울", "경기", "인천", "강원", "충남", "충북", "경북", "경남", "전남", "전북", "제주"];
					var adoptSum = 0;
					var euthanasiaSum = 0;
					var adoptChartData = new Array();
					var euthanasiaChartData = new Array();
					var labelCity = $("select[name=city]").val();
									
					for(var i = 0; i <(res.adopt).length; i++){
						adoptSum+=res.adopt[i];
						euthanasiaSum+=res.euthanasia[i];
					}
					for(var j = 0; j <(res.adopt).length; j++){
						adoptChartData[j] = Math.round((res.adopt[j]/adoptSum)*10000)/100;
						euthanasiaChartData[j] = Math.round((res.euthanasia[j]/euthanasiaSum)*10000)/100;
					}
					
					doughnutChart.data.datasets.forEach(function(dataset) {
						dataset.data = ajaxStaticData;
					});
					barChartTop.data.datasets.forEach(function(dataset) {
						dataset.data = ajaxStaticData;
					});

					addData(adoptChart, ajaxLable, adoptChartData, labelCity, 1);
					
					addData(euthanasiaChart, ajaxLable, euthanasiaChartData, labelCity, 2);

					doughnutChart.update();
					barChartTop.update();

					$(".totalStatis").text("총 "+ numberWithCommas(res.areaResult[0])+" 마리");
					$("#area").text("대한민국");
				},
				error : function(xhr, status, err){
					console.log("처리실패", xhr, status, err);
				}
			});
			return;
		}
		$.ajax({
			url : "${ pageContext.request.contextPath}/statis/searchStatis.do",
			data : {
				city : city,
				province : province,
				startDay : startDay,
				endDay : endDay,
				paramArea : JSON.stringify(paramArea)
			},
			dataType:"json",
			method : "GET",
			success : function(res){
				var ajaxStaticData = [ res.areaResult[1], res.areaResult[2], res.areaResult[3], res.areaResult[4], res.areaResult[5], res.areaResult[6], res.areaResult[7]];
				var ajaxLable = paramArea;
				var adoptSum = 0;
				var euthanasiaSum = 0;
				var adoptChartData = new Array();
				var euthanasiaChartData = new Array();
				var labelCity = $("select[name=city]").val();
				
				for(var i = 0; i <(res.adopt).length; i++){
					adoptSum+=res.adopt[i];
					euthanasiaSum+=res.euthanasia[i];
				}
				for(var j = 0; j <(res.adopt).length; j++){
					adoptChartData[j] = Math.round((res.adopt[j]/adoptSum)*10000)/100;
					euthanasiaChartData[j] = Math.round((res.euthanasia[j]/euthanasiaSum)*10000)/100;
				}

				if(ajaxLable.length > 10){
					$(".area").css("height","600px");
				}
				
				doughnutChart.data.datasets.forEach(function(dataset) {
					dataset.data = ajaxStaticData;
				});
				barChartTop.data.datasets.forEach(function(dataset) {
					dataset.data = ajaxStaticData;
				});

				addData(adoptChart, ajaxLable, adoptChartData, labelCity, 1);
				
				addData(euthanasiaChart, ajaxLable, euthanasiaChartData, labelCity, 2);

				doughnutChart.update();
				barChartTop.update();

				$(".totalStatis").text("총 "+ numberWithCommas(res.areaResult[0])+" 마리");
				$("#area").text($("select[name=city]").val()+" "+$("select[name=province]").val());
			},
			error : function(xhr, status, err){
				console.log("처리실패", xhr, status, err);
			}
		});
	});
	
	function addData(chart, label, data, labelCity, num) {
	    chart.data.labels =label;
	    chart.data.datasets.forEach((dataset) => {
		    if(num==1){
	    	dataset.label =labelCity+" 지역별 입양 및 보호율(%) 17.01.01 ~ 현재";
			}else if(num==2){
	    	dataset.label =labelCity+" 지역별 안락사 및 자연사율(%) 17.01.01 ~ 현재";
			}
	        dataset.data = data;
	    });
	    chart.update();
	}
    
        var area0 = ["전국", "서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도",
            "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주특별자치도"
        ];
        var area1 = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구",
            "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"
        ];
        var area2 = ["계양구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"];
        var area3 = ["대덕구", "동구", "서구", "유성구", "중구"];
        var area4 = ["광산구", "남구", "동구", "북구", "서구"];
        var area5 = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
        var area6 = ["남구", "동구", "북구", "중구", "울주군"];
        var area7 = ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구",
            "중구", "해운대구", "기장군"
        ];
        var area8 = ["고양시", "과천시", "광주시", "구리시", "군포시", "김포시", "남양주시", "부천시", "성남시", "수원시",
            "시흥시", "안산시", "안성시", "양주시", "오산시", "용인시", "파주시", "평택시", "포천시",
            "하남시", "화성시", "가평군", "양평군", "여주군"
        ];
        var area9 = ["강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군",
            "철원군", "평창군", "홍천군", "화천군", "횡성군"
        ];
        var area8 = ["고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시",
            "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시",
            "하남시", "화성시", "가평군", "양평군", "여주시", "연천군"
        ];
        var area10 = ["제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군"];
        var area11 = ["계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "부여군", "서천군", "예산군", "청양군", "태안군", "홍성군"];
        var area12 = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군",
            "진안군"
        ];
        var area13 = ["광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군",
            "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"
        ];
        var area14 = ["경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군",
            "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"
        ];
        var area15 = ["거제시", "김해시", "창원시 마산합포회원구", "밀양시", "사천시", "양산시", "진주시", "창원시 진해구", "창원시 의창성산구", "통영시", "거창군", "고성군", "남해군",
            "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"
        ];
        var area16 = ["제주특별자치도"];
        var area;
    $(function () {

        $("select[name=city]").each(function () {
            console.log(this);
            $selectCity = $(this);
            $.each(eval(area0), function () {
                $selectCity.append("<option value=" + this + ">" + this + "</option>");
            })
            $selectCity.next().next().append("<option value=''>전국</option>");
        });

        $("select[name=city]").change(function () {
            area = "area" + $("option", $(this)).index($("option:selected", $(
                this))); //선택지역의 구군 Array
            console.log(area);
            var $province = $(this).next().next(); //성택영역 구군 객체
            // console.log($gugun);
            $("option", $province).remove();

            if (area == "area0") {
                $province.append("<option value=''>전국</option>");
            } else {
                $.each(eval(area), function () {
                    $province.append("<option value=" + this + ">" + this + "</option>");
                });
            }
        });
    });
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />