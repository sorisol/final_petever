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
  <title>admin-report</title>

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
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${ pageContext.request.contextPath }/admin/admin.do">
          <div class="sidebar-brand-icon">
              <img src="${pageContext.request.contextPath}/resources/images/adminlogo.png" alt="" style="width: 45px;">
            </div>
        <div class="sidebar-brand-text">Petever</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="${ pageContext.request.contextPath }/admin/admin.do">
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
      
      <li class="nav-item active">
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

        <!-- Begin Page Content -->
        <div class="container-fluid">
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">신고게시글</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive" style="overflow: hidden;">
                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                  <div class="row">
                    <div class="col-sm-12 col-md-6">
                      <div id="dataTable_filter" class="dataTables_filter">
                      	<label>Search:<input id="adminSearch" type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable"></label>
                      	<a href="#" id="searchYn" class="btn btn-success btn-circle btn-sm" style="font-weight: bold; font-size: 16px;">
                	        Y
                        </a>
                        <a href="#" id="searchyN" class="btn btn-warning btn-circle btn-sm" style="font-weight: bold; font-size: 16px;">
                        	N
                       	</a>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-12">
                    <style>
                    	.table{
                    		font-size:12px;
                    	}
                    </style>
                      <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0"
                        role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                        <thead style="background-color:#f8f9fc;">
                          <tr role="row">
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Name: activate to sort column ascending" style="width: 4%;text-align:center;">번호</th>
                            <th class="sorting_desc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Position: activate to sort column ascending" style="width: 6%;"
                              aria-sort="descending">피신고인</th>
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Office: activate to sort column ascending" style="width: 6%;">신고인</th>
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Age: activate to sort column ascending" style="width: 60%;">사유</th>
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Start date: activate to sort column ascending" style="width: 8%;">날짜</th>
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Salary: activate to sort column ascending" style="width: 6%;text-align:center;">게시여부</th>
                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                              aria-label="Salary: activate to sort column ascending" style="width: 10%;">확인</th>
                          </tr>
                        </thead>
                        <tbody id="reportTable">
                        <form action="" id="setRows">
							<input type="hidden" name="rowPerPage" value="10">
						</form>
                        <c:forEach var="rep" items="${list}">
                          <tr role="row" class="odd eval-contents">
                            <td style="text-align:center;" class=""> <a href="${pageContext.request.contextPath}/reviewBoard/reviewBoardView.do?no=${rep.aniBoId}" style="color:#858796;">${rep.aniBoId}</a></td>
                            <td class="sorting_1">${rep.userId}</td>
                            <td>${rep.repDoUser}</td>
                            <td style="background: #f8f9fc;font-size:14px;">${rep.repContent}</td>
                            <td>${rep.repDate}</td>
                            <td style="text-align:center;font-size:24px;">${rep.repDisplay}</td>
                            <td>
                              <a href="#"  id="reportDel" class="btn btn-info btn-circle btn-sm"  onclick="reportDel('${ rep.aniBoId }')">
                                <i class="align-middle fas fa-fw fa-sync-alt"></i>
                              </a>
                            <c:if test="${rep.repDisplay eq 'Y'}">
                              <a href="#" id="reportYN" class="btn btn-warning btn-circle btn-sm" style="font-weight: bold; font-size: 16px;" onclick="reportYN('${ rep.aniBoId }','${ rep.repDisplay }')">
                                N
                              </a>
                            </c:if>
                            <c:if test="${rep.repDisplay eq 'N'}">
                              <a href="#" id="reportYN" class="btn btn-success btn-circle btn-sm" style="font-weight: bold; font-size: 16px;" onclick="reportYN('${ rep.aniBoId }','${ rep.repDisplay }')">
                                Y
                              </a>
                            </c:if>
                          	  <a href="#"  id="reportRemove" class="btn btn-danger btn-circle btn-sm"  onclick="reportRemove('${ rep.aniBoId }')">
                                X
                              </a>
                              </td>
                          </tr>
                          </c:forEach>
                          <script src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
                        </tbody>
                      </table>
                    </div>
                  </div>
              </div>
            </div>
          </div>
        </div>
</div>
</div>
</div>
<form name="reportDelFrm" action="reportDel.do" method="POST">
	<input type="hidden" name="no"/>
	<input type="hidden" name="col"/>
</form>
<form name="reportRemoveFrm" action="reportRemove.do" method="POST">
	<input type="hidden" name="no"/>
	<input type="hidden" name="col"/>
</form>
<form name="reportYNFrm" action="reportYN.do" method="POST">
	<input type="hidden" name="no"/>
	<input type="hidden" name="yn"/>
	<input type="hidden" name="col"/>
</form>

</body>
<script>
function reportRemove(num){
	if(confirm("게시글을 삭제하시겠습니까?") == false)
		return;
	var frm = document.reportRemoveFrm;

	frm.no.value = num;
	frm.col.value = "review";
	frm.submit();
}
function reportDel(num){
	if(confirm("신고 철회하시겠습니까?") == false)
		return;
	var frm = document.reportDelFrm;

	frm.no.value = num;
	frm.col.value = "review";
	frm.submit();
}
function reportYN(num,reportYn){
	if(confirm("게시 철회하시겠습니까?") == false)
		return;
	var frm = document.reportYNFrm;

	frm.no.value = num;
	frm.yn.value = reportYn;
	frm.col.value = "review";
	frm.submit();
}

$("#searchYn").click(function() { 
	$.ajax({
		url : "${ pageContext.request.contextPath}/admin/reportYn.do",
		data : {
			yn : 'Y'
		},
		dataType:"json",
		method : "GET",
		success : function(data){
			displayResultTable("reportTable", data.list);
			var $setRows = $('#setRows');

			$setRows.submit(function (e) {
				e.preventDefault();
				var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

				var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
				if (!rowPerPage) {
					alert(zeroWarning);
					return;
				}
				$('#nav').remove();
				var $products = $('#dataTable');

				$products.after('<div id="nav" class="paging pagination">');
				
				var $tr = $($products).find('.eval-contents');
				var rowTotals = $tr.length;

				var pageTotal = Math.ceil(rowTotals/ rowPerPage);
				var i = 0;

				for (; i < pageTotal; i++) {
					$('<a></a>')
							.attr('rel', i)
							.html(i + 1)
							.appendTo('#nav');
				}

				$tr.addClass('off-screen')
						.slice(0, rowPerPage)
						.removeClass('off-screen');

				var $pagingLink = $('#nav a');
				$pagingLink.on('click', function (evt) {
					evt.preventDefault();
					var $this = $(this);
					if ($this.hasClass('active')) {
						return;
					}
					$pagingLink.removeClass('active');
					$this.addClass('active');

					var currPage = $this.attr('rel');
					var startItem = currPage * rowPerPage;
					var endItem = startItem + rowPerPage;

					$tr.css('opacity', '0.0')
							.addClass('off-screen')
							.slice(startItem, endItem)
							.removeClass('off-screen')
							.animate({opacity: 1}, 100);

				});

				$pagingLink.filter(':first').addClass('active');

			});


			$setRows.submit();
				
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
	});	
});

$("#searchyN").click(function() { 
	$.ajax({
		url : "${ pageContext.request.contextPath}/admin/reportYn.do",
		data : {
			yn : 'N'
		},
		dataType:"json",
		method : "GET",
		success : function(data){
			displayResultTable("reportTable", data.list);
			var $setRows = $('#setRows');

			$setRows.submit(function (e) {
				e.preventDefault();
				var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

				var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
				if (!rowPerPage) {
					alert(zeroWarning);
					return;
				}
				$('#nav').remove();
				var $products = $('#dataTable');

				$products.after('<div id="nav" class="paging pagination">');
				
				var $tr = $($products).find('.eval-contents');
				var rowTotals = $tr.length;

				var pageTotal = Math.ceil(rowTotals/ rowPerPage);
				var i = 0;

				for (; i < pageTotal; i++) {
					$('<a></a>')
							.attr('rel', i)
							.html(i + 1)
							.appendTo('#nav');
				}

				$tr.addClass('off-screen')
						.slice(0, rowPerPage)
						.removeClass('off-screen');

				var $pagingLink = $('#nav a');
				$pagingLink.on('click', function (evt) {
					evt.preventDefault();
					var $this = $(this);
					if ($this.hasClass('active')) {
						return;
					}
					$pagingLink.removeClass('active');
					$this.addClass('active');

					var currPage = $this.attr('rel');
					var startItem = currPage * rowPerPage;
					var endItem = startItem + rowPerPage;

					$tr.css('opacity', '0.0')
							.addClass('off-screen')
							.slice(startItem, endItem)
							.removeClass('off-screen')
							.animate({opacity: 1}, 100);

				});

				$pagingLink.filter(':first').addClass('active');

			});


			$setRows.submit();
				
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
	});	
});

$("#adminSearch").keyup(function() { 
	var keyword = $(this).val();
	console.log(keyword);
	$.ajax({
		url : "${ pageContext.request.contextPath}/admin/reportReviewSearch.do",
		data : {
			keyword : keyword
		},
		dataType:"json",
		method : "GET",
		success : function(data){
			displayResultTable("reportTable", data.list);
			var $setRows = $('#setRows');

			$setRows.submit(function (e) {
				e.preventDefault();
				var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

				var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
				if (!rowPerPage) {
					alert(zeroWarning);
					return;
				}
				$('#nav').remove();
				var $products = $('#dataTable');

				$products.after('<div id="nav" class="paging pagination">');
				
				var $tr = $($products).find('.eval-contents');
				var rowTotals = $tr.length;

				var pageTotal = Math.ceil(rowTotals/ rowPerPage);
				var i = 0;

				for (; i < pageTotal; i++) {
					$('<a></a>')
							.attr('rel', i)
							.html(i + 1)
							.appendTo('#nav');
				}

				$tr.addClass('off-screen')
						.slice(0, rowPerPage)
						.removeClass('off-screen');

				var $pagingLink = $('#nav a');
				$pagingLink.on('click', function (evt) {
					evt.preventDefault();
					var $this = $(this);
					if ($this.hasClass('active')) {
						return;
					}
					$pagingLink.removeClass('active');
					$this.addClass('active');

					var currPage = $this.attr('rel');
					var startItem = currPage * rowPerPage;
					var endItem = startItem + rowPerPage;

					$tr.css('opacity', '0.0')
							.addClass('off-screen')
							.slice(startItem, endItem)
							.removeClass('off-screen')
							.animate({opacity: 1}, 100);

				});

				$pagingLink.filter(':first').addClass('active');

			});


			$setRows.submit();
				
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
	});	
});

function displayResultTable(id, data){
	var $container = $("#" + id);

	var html = "";
	if(Object.keys(data).length > 0){
		html += "<form action='' id='setRows'><input type='hidden' name='rowPerPage' value='10'></form>"
		for(var i in data){
			var list = data[i];
			html += "<tr role='row' class='odd eval-contents'>";
			html += "<td style='text-align:center;'> <a href='${pageContext.request.contextPath}/animalboard/boardView?no="+list.aniBoId +"' style='color:#858796;'>"+list.aniBoId +"</a></td>";
			html += "<td>" + list.userId + "</td>";
			html += "<td>" + list.repDoUser + "</td>";
			html += "<td style='background: #f8f9fc;font-size:14px;'>" + list.repContent + "</td>";			
			html += "<td>" + list.repDate + "</td>";			
			html += "<td style='text-align:center;font-size:24px;'>" + list.repDisplay + "</td>";			
			html += "<td> <a href='#'  id='reportDel' class='btn btn-info btn-circle btn-sm mr-1'  onclick='reportDel("+list.aniBoId +")'> <i class='align-middle fas fa-fw fa-sync-alt'></i> </a>";
			if(list.repDisplay=='Y'){
				html += `<a href='#' id='reportYN' class='btn btn-warning btn-circle btn-sm mr-1' style='font-weight: bold; font-size: 16px;' onclick="reportYN(`
				html += "'"+list.aniBoId+"','"+list.repDisplay+"'";
				html += `)">N</a>`;
			}
			if(list.repDisplay=='N'){
				html += `<a href='#' id='reportYN' class='btn btn-success btn-circle btn-sm mr-1' style='font-weight: bold; font-size: 16px;' onclick="reportYN(`
				html += "'"+list.aniBoId+"','"+list.repDisplay+"'";
				html += `)">Y</a>`;
			}
			html += "<a href='#'  id='reportRemove' class='btn btn-danger btn-circle btn-sm'  onclick='reportRemove("+list.aniBoId+")'>X</a>"			
			html += "</td>";
			html += "</tr>";
		}
	}
	else {
		html += "<tr><td colspan='7'>검색된 결과가 없습니다.</td></tr>";
	}	 

	$container.html(html);
	
}
</script>
</html>