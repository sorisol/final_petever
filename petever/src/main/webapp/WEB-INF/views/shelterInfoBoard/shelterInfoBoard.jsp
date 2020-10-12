<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shelterInfoBoard.css">
<link href="${pageContext.request.contextPath}/resources/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<style>

@media screen and (max-width: 39.9375em) {
  .pagination:after {
    display: inline-block;
    content: attr(data-page) " of " attr(data-total);
    position: relative;
    text-align: center;
    width: 80px;
    right: 80px;
  }
  .pagination-next {
    position: relative;
    left: 80px;
  }
}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
@media screen and (max-width: 39.9375em) {
  .pagination:after {
    display: inline-block;
    content: attr(data-page) " of " attr(data-total);
    position: relative;
    text-align: center;
    width: 80px;
    right: 80px;
  }
  .pagination-next {
    position: relative;
    left: 80px;
  }
}
</style>

   <div id="main-wrap">
       <section class="main"></section>
 	      <section class="content-wrap">
           <h1>유기동물 보호소 연락처</h1>
           <p>유기동물 보호소들을 여러분들께 제공합니다.</p>
           <div class="content">
               <div class="border">
				 <div class="table-responsive" style="margin-left: 100px">
					<table id="shelterTable" class="table table-striped table-bordered table-hover" >
						<thead>
							<tr>
								<th width="20%" style="text-align: center;">관할구역</th>
								<th width="20%" style="text-align: center;">보호센터명</th>
								<th width="15%" style="text-align: center;">전화번호</th>
								<th>보호센터주소</th>
							</tr>
						</thead>
						<!-- tbody 태그 필요 없음. -->
					</table>
                    </div>
				
				
                   <div class="post-wrap">
                   
                   </div>

                   </div>
               </div>
           
       </section>
   </div>


<script src="${pageContext.request.contextPath}/resources/js/plugins/dataTables/datatables.min.js"></script>
<script type="text/javascript">
				
			    function setShelterTable(){
			    	userTable = $('#shelterTable').dataTable({
						pageLength: 10,
						pagingType : "full_numbers",
						bPaginate: true,
						bLengthChange: false,
						lengthMenu : [ [ 1, 3, 5, 10, -1 ], [ 1, 3, 5, 10, "All" ] ],
						responsive: true,
						bAutoWidth: false,
						processing: true,
						ordering: false,
						serverSide: true,
						searching: false,
				        ajax : {
				            "url": "${pageContext.request.contextPath}/shelterInfoBoard/shelterInfoBoardList.do",
				            "type":"POST",
				          //  "data":param
				         },
						columns : [					//target
							{data: "orgNm"},		//0
							{data: "careNm"},	//1
							{data: "careTel"},		//2
							{data: "careAddr"}	//3
						],
						columnDefs : [
							{
				                "targets": 2,
				                "className": "text-center"
				            },
				            {
				                "targets": [0,1,2,3],
				                "orderable": false
				            } 
				        ],
				        dom: '<"html5buttons"B>lTfgtip',
				        buttons: [
			 	            {extend: 'copy'},
				            {extend: 'csv'},
				            {extend: 'excel', title: 'ExampleFile'},
				            {extend: 'pdf', title: 'ExampleFile'},
				            {extend: 'print',
				             customize: function (win){
				                    $(win.document.body).addClass('white-bg');
				                    $(win.document.body).css('font-size', '10px');
				
				                    $(win.document.body).find('table')
				                            .addClass('compact')
				                            .css('font-size', 'inherit');
				            }
				            } 
				        ]
				
				    });
			    }
				
			    $(document).ready(function(){
			    	setShelterTable();
			    });
				
				
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>