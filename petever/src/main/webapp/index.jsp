<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"
        integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg=="
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"
        integrity="sha512-vBmx0N/uQOXznm/Nbkp7h0P1RfLSj0HQrFSzV8m7rOGyj30fYAOKHYvCNez+yM8IrfnW0TCodDEjRqf6fodf/Q=="
        crossorigin="anonymous"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/chartjs-plugin-labels.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/utils.js"></script>

<%-- 한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <article class="content">
                <p class="title">■ 실종 동물 / 보호</p>
                <ul>
                    <li>
                        <img src="${ pageContext.request.contextPath }/resources/images/dog1.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                    <li>
                        <img src="${ pageContext.request.contextPath }/resources/images/dog2.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                    <li>
                        <img src="${ pageContext.request.contextPath }/resources/images/dog3.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                    <li>
                        <img src="${ pageContext.request.contextPath }/resources/images/dog4.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                    <li>
                        <img src="${ pageContext.request.contextPath }/resources/images/dog5.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                    <li>
                        <img src="${ pageContext.request.contextPath }/resources/images/dog6.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                    <li>
                        <img src="${ pageContext.request.contextPath }/resources/images/dog7.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                    <li>
                        <img src="${ pageContext.request.contextPath }/resources/images/dog8.jpg" alt="실종 및 보호 동물 사진">
                    </li>
                </ul>
            </article>
            <article class="total-wrap">
                <h1>총 1,824,339마리</h1>
                <hr style="width: 500px; background-color: white; height: 1px; border:none; margin: 0 auto;">
                <p>현재 대한민국 유기된 동물  <br/>adipisicing elit. Et accusamus ipsum provident</p>
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
                            <li class="on">강아지</li>
                            <li>고양이</li>
                            <li>기타</li>
                        </ul>
                        <div class="canvas-wrap">
                            <div class="stats">
                                <canvas id="doughnut" class="chartjs" style="display: block;"></canvas>
                            </div>
                            <div class="stats">
    
                                <canvas id="barChart" class="chartjs"
                                    style="display: block; width: 285px; height:300px"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        </section>
    </div>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
    // Map관련
    var label = ["보호", "입양", "반환", "자연사", "안락사", "방사", "기증"];
    var data = [30826, 132424, 57400, 116877, 98876, 3896, 7893];
    var back = ["#245EFF", "#3DD5FF", "#40F7B4", "#00C788", "#FFAA9D", "#FB5F83", "#BB4BEB"]
    new Chart(
        document.getElementById("doughnut"), {
            "type": "doughnut",
            "data": {
                "labels": label,
                "datasets": [{
                    "data": data,
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
    var myChart = new Chart(ctx, {
        type: 'horizontalBar',
        data: {
            labels: label,

            datasets: [{
                label: "유기동물 현황(마리)",
                data: data,
                backgroundColor: back
            }]
        },

        options: {
            barOptions_stacked,
            legend: {
                labels: {
                    boxWidth: 0
                }
            }
        }
    });

    //강아지 고양이 기타 버튼관련
    var $btn = $(".stats-wrap ul").find("li");

    $btn.eq(0).click(function(){
        $btn.removeClass("on");
        $(this).addClass("on");
    });
    $btn.eq(1).click(function(){
        $btn.removeClass("on");
        $(this).addClass("on");
    });
    $btn.eq(2).click(function(){
        $btn.removeClass("on");
        $(this).addClass("on");
    });
</script>
 <script src="${ pageContext.request.contextPath }/resources/js/d3.min.js"></script>
 <script src="${ pageContext.request.contextPath }/resources/js/map.js"></script>
