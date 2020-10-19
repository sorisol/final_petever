<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
          <!-- Bootstrap core JavaScript-->
        <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
<script>
<c:if test="${ not empty msg }">
	alert('${ msg }');
</c:if>
</script>
  <title>admin</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/admin.css" rel="stylesheet">
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color: #373b44;">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
          <div class="sidebar-brand-icon">
              <img src="${pageContext.request.contextPath}/resources/images/adminlogo.png" alt="" style="width: 45px;">
            </div>
        <div class="sidebar-brand-text">Petever</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/admin.do">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>AdminPage</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <li class="nav-item">
        <a class="nav-link collapsed" href="${ pageContext.request.contextPath }/admin/adminAnimalReport.do" >
          <i class="fas fa-fw fa-cog"></i>
          <span>신고게시글(유기동물)</span>
        </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="${ pageContext.request.contextPath }/admin/adminReviewReport.do" >
          <i class="fas fa-fw fa-cog"></i>
          <span>신고게시글(리뷰)</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="${ pageContext.request.contextPath }/admin/adminUser.do">
          <i class="fas fa-fw fa-wrench"></i>
          <span>회원정보 조회</span>
        </a>
      </li>


      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-warning btn-icon-split">
            <span class="icon text-white-50">
              <i class="fas fa-arrow-right"></i>
            </span>
            <span class="text">메인페이지 돌아가기</span>
          </a>

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>


          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                      aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>


            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600">Admin</span>
              </a>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

		<style>
			.report-table{
				font-size:14px;
			}
		</style>

        <!-- Begin Page Content -->
        
        <div style="display:flex;">
		  <div class="col-sm-6">
		    <div class="card shadow">
		    <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">유기동물 게시판 신고<span style="font-size:14px;float:right;">최근(3일) : ${animalCnt }</span></h6>
            </div>
		      <div class="card-body">
		        <table class="table table-bordered dataTable report-table" width="100%" cellspacing="0"
                        role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                        <thead style="background-color:#f8f9fc;">
                          <tr role="row">
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Name: activate to sort column ascending" style="width: 5%;text-align:center;">번호</th>
                            <th class="sorting_desc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Position: activate to sort column ascending" style="width: 9%;"
                              aria-sort="descending">피신고인</th>
                            <th class="sorting_desc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Position: activate to sort column ascending" style="width: 5%;"
                              aria-sort="descending">신고</th>
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Office: activate to sort column ascending" style="width: 9%;">신고인</th>
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Start date: activate to sort column ascending" style="width: 19%;">날짜</th>
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Salary: activate to sort column ascending" style="width: 9%;text-align:center;">게시여부</th>
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Salary: activate to sort column ascending" style="width: 4%;">확인</th>
                          </tr>
                        </thead>
                        <tbody id="reportTable">
                        <c:forEach var="rep" items="${animalList}">
                          <tr role="row" class="odd">
                            <td style="text-align:center;" class=""> <a href="${pageContext.request.contextPath}/animalboard/boardView?no=${rep.aniBoId}" style="color:#858796;">${rep.aniBoId}</a></td>
                            <td class="sorting_1">${rep.userId}</td>
                            <td class="sorting_1">a</td>
                            <td>${rep.repDoUser}</td>
                            <td>${rep.repDate}</td>
                            <td style="text-align:center;font-size:24px;">${rep.repDisplay}</td>
                            <td>
                            <c:if test="${rep.repDisplay eq 'Y'}">
                              <a href="#" id="reportYN" class="btn btn-warning btn-circle btn-sm" style="font-weight: bold; font-size: 16px;" onclick="reportYN('${ rep.aniBoId }','${ rep.repDisplay }','animal')">
                                N
                              </a>
                            </c:if>
                            <c:if test="${rep.repDisplay eq 'N'}">
                              <a href="#" id="reportYN" class="btn btn-success btn-circle btn-sm" style="font-weight: bold; font-size: 16px;" onclick="reportYN('${ rep.aniBoId }','${ rep.repDisplay }','animal')">
                                Y
                              </a>
                            </c:if>
                              </td>
                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                      <a class="nav" style="float:right;font-size:14px;" href="${ pageContext.request.contextPath }/admin/adminAnimalReport.do" >
				          <span>더보기 ></span>
				     </a>
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-6">
		    <div class="card shadow">
		    <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">리뷰 게시판 신고<span style="font-size:14px;float:right;">최근(3일) : ${reviewCnt }</span></h6>
            </div>
		      <div class="card-body">
		        <table class="table table-bordered dataTable report-table" width="100%" cellspacing="0"
                        role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                        <thead style="background-color:#f8f9fc;">
                          <tr role="row">
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Name: activate to sort column ascending" style="width: 5%;text-align:center;">번호</th>
                            <th class="sorting_desc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Position: activate to sort column ascending" style="width: 9%;"
                              aria-sort="descending">피신고인</th>
                            <th class="sorting_desc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Position: activate to sort column ascending" style="width: 5%;"
                              aria-sort="descending">신고</th>
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Office: activate to sort column ascending" style="width: 9%;">신고인</th>
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Start date: activate to sort column ascending" style="width: 19%;">날짜</th>
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Salary: activate to sort column ascending" style="width: 9%;text-align:center;">게시여부</th>
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Salary: activate to sort column ascending" style="width: 4%;">확인</th>
                          </tr>
                        </thead>
                        <tbody id="reportTable">
                        <c:forEach var="rep" items="${reviewList}">
                          <tr role="row" class="odd">
                            <td style="text-align:center;" class=""> <a href="${pageContext.request.contextPath}/animalboard/boardView?no=${rep.aniBoId}" style="color:#858796;">${rep.aniBoId}</a></td>
                            <td class="sorting_1">${rep.userId}</td>
                            <td class="sorting_1">a</td>
                            <td>${rep.repDoUser}</td>
                            <td>${rep.repDate}</td>
                            <td style="text-align:center;font-size:24px;">${rep.repDisplay}</td>
                            <td>
                            <c:if test="${rep.repDisplay eq 'Y'}">
                              <a href="#" id="reportYN" class="btn btn-warning btn-circle btn-sm" style="font-weight: bold; font-size: 16px;" onclick="reportYN('${ rep.aniBoId }','${ rep.repDisplay }','review')">
                                N
                              </a>
                            </c:if>
                            <c:if test="${rep.repDisplay eq 'N'}">
                              <a href="#" id="reportYN" class="btn btn-success btn-circle btn-sm" style="font-weight: bold; font-size: 16px;" onclick="reportYN('${ rep.aniBoId }','${ rep.repDisplay }','review')">
                                Y
                              </a>
                            </c:if>
                              </td>
                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                      <a class="nav" style="float:right;font-size:14px;" href="${ pageContext.request.contextPath }/admin/adminReviewReport.do" >
				          <span>더보기 ></span>
				     </a>
		      </div>
		    </div>
		  </div>
		</div>
		
        <div class="container mt-3">
        <div class="card-header py-3 shadow">
              <h6 class="m-0 font-weight-bold text-primary">반려동물 인식표<span style="font-size:14px;float:right;">최근(3일) : ${reviewCnt }</span></h6>
            </div>
		  <div id="dataTable" class="row row-cols-1 row-cols-sm-2 row-cols-md-2" style="margin-left:0px;">
		  <form action="" id="setRows" style="display:none;">
				<input type="hidden" name="rowPerPage" value="4">
			</form>
            	<c:forEach items="${ list }" var="list">
            	<div class="card mb-3 eval-contents" style="max-width: 546px;">
				  <div class="row no-gutters">
				    <div class="col-md-4">
				      <div class="ani-tag-front">
                        <div class="ani-info-tag1" value="${ list.tagColor }">
                        	<div class="animal-tag-img" id="ani-kind-${ list.tagAniKind }" value="${ list.tagAniKind }" ></div><br />
                        	<label class="animal-tag-font" id="preview-name" value="${ list.tagFont }" for="">${ list.tagAniName }</label>
                        </div>
                       <label class="preview-label preview-front" for="">앞면</label>
                   	</div>
                   	<div class="ani-tag-front">
                        <div class="ani-info-tag2" value="${ list.tagColor }">
                            <label class="animal-tag-font" id="preview-ssn" value="${ list.tagFont }" for="">${ list.tagAniSsn }</label><br>
                            <label class="animal-tag-font" id="preview-person-name" value="${ list.tagFont }" for="">${ list.tagPersonName }</label><br>
                            <label class="animal-tag-font" id="preview-person-phone" value="${ list.tagFont }" for="">${ list.tagPersonPhone }</label><br>
                        </div>
                        <label class="preview-label preview-back" for="">뒷면</label>
                   	</div>
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <div class="ani-tag-ssg">
	                    	<label class="ani-ssg1">수령인: </label><br /><label class="ani-ssg2">${ list.ssgName }</label><br />
	                    	<label class="ani-ssg1">연락처: </label><br /><label class="ani-ssg2">${ list.ssgTel }</label><br />
	                    	<label class="ani-ssg1">수령지: </label><br /><label class="ani-ssg2"style="margin-bottom: 0px;">(${ list.ssgAddr0 }) ${ list.ssgAddr1 }</label><br />
	                    	<label class="ani-ssg1"></label><label class="ani-ssg2" style="margin: 0px;">${ list.ssgAddr2 }</label><br />
	                    	<label class="ani-ssg1">결제일시: </label><br /><label class="ani-ssg2">${ list.buyDate }</label><br />
	                    	<%-- <fmt:parseDate value="${ list.buyDate }" pattern="yyyy.MM.dd"/> --%>
	                    </div>
				      </div>
				    </div>
				  </div>
				</div>
				</c:forEach>
				<script src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
		  </div>
	  </div>
</div>
       
</div>

<form name="reportYNFrm" action="reportYN.do" method="POST">
	<input type="hidden" name="no"/>
	<input type="hidden" name="yn"/>
	<input type="hidden" name="col"/>
</form>

</body>
<script>
function prevDay(days) {
	   var d = new Date();
	   var dayOfMonth = d.getDate();
	   d.setDate(dayOfMonth - days);
	   return getDateStr(d);
	}
function getDateStr(myDate){
	   var year = myDate.getFullYear();
	   var month = ("0"+(myDate.getMonth()+1)).slice(-2);
	   var day = ("0"+myDate.getDate()).slice(-2);
	   return ( year + '-' + month + '-' + day );
}

function reportYN(num,reportYn,column){
	if(confirm("게시 철회하시겠습니까?") == false)
		return;
	var frm = document.reportYNFrm;

	frm.no.value = num;
	frm.yn.value = reportYn;
	frm.col.value = column;
	frm.submit();
}
</script>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Sunflower:wght@500&display=swap" rel="stylesheet">
<script>
$(function(){
	
	$(".ani-info-tag1").each(function () {
		var $color = $(this).attr('value');

        if ($color == 'silver') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_silver_2.png)');
        } else if ($color == 'gold') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_gold_2.png)');
        } else if ($color == 'rosegold') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_rosegold_2.png)');
        }
    });

	$(".ani-info-tag2").each(function () {
		var $color = $(this).attr('value');

        if ($color == 'silver') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_silver_2.png)');
        } else if ($color == 'gold') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_gold_2.png)');
        } else if ($color == 'rosegold') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_rosegold_2.png)');
        }
    });

    $(".animal-tag-img").each(function() {
    	var $kind = $(this).attr('value');
        
		if($kind == '포메라니안'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/ani_pome.png)');
		} else if($kind == '진돗개'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/ani_jindo.png)');
		} else if($kind == '시바견'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/ani_siba.png)');
		}
    });

     $(".animal-tag-font").each(function() {
          var $font = $(this).attr('value');
          console.log($font);
          $(this).attr('style', 'font-family : '+ $font +'!important'); 
     });

	
});

</script>
</html>