<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>상담리스트</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="/resources/assets/css/offcanvas.css" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include> 

<style>
*{margin:0;padding:0;}
body {background-color:#fafafa;padding:50px;}
h1 {font-family:tahoma;color:#999;font-size:24px;}
/* P{font-family:����;font-size:12px;letter-spacing:-1px;margin-bottom:40px;} */


.search-box {
    background: url("/resources/assets/img/searchbar.png") no-repeat scroll left top transparent;
    height: 30px;
    margin-top: 5px;
    overflow: hidden;
    width: 288px;
}

input.search-field {
    background: none repeat scroll 0 0 transparent;
    border: 0 none;
    color: #666666;
    float: left;
	font-family:tahoma;
    height: 26px;
    line-height: 26px;
    margin: 0;
    padding: 1px 0 0 14px;
    width: 232px;
}
input.search-go {
    background: url("img/searchbar.png") no-repeat scroll right 0 transparent;
    border: 0 none;
    cursor: pointer;
    float: left;
    height: 30px;
    margin: 0;
    padding: 0; 
    width: 42px;
}

</style>

 <script>

function doAction(customerInformId){
	
	location.href="${ pageContext.request.contextPath }/myPage/" + customerInformId;
}

function goReport(reportNo){
	location.href="${ pageContext.request.contextPath }/consulting/admin/" + reportNo;
}

</script>
</head>

<body>
	<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
	</header>
	<br>
	<br>
	<br>
	<section>
	<br>
	<br>
	 <c:if test="${ not empty adminLoginVO and empty loginVO}">  
       <main role="main" class="container">
      <div class="my-3 p-3 bg-white rounded box-shadow">
        <h6 class="border-bottom border-gray pb-2 mb-0">최근 상담 업데이트</h6>
        <div class="media text-muted pt-3">
          <img data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1" alt="" class="mr-2 rounded">
          <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <strong class="d-block text-gray-dark">@username</strong>
            Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
          </p>
        </div>
        <div class="media text-muted pt-3">
          <img data-src="holder.js/32x32?theme=thumb&bg=e83e8c&fg=e83e8c&size=1" alt="" class="mr-2 rounded">
          <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <strong class="d-block text-gray-dark">@username</strong>
            Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
          </p>
        </div>
        <div class="media text-muted pt-3">
          <img data-src="holder.js/32x32?theme=thumb&bg=6f42c1&fg=6f42c1&size=1" alt="" class="mr-2 rounded">
          <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <strong class="d-block text-gray-dark">@username</strong>
            Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
          </p>
        </div>
        <small class="d-block text-right mt-3">
          <a href="#">All updates</a>
        </small>
      </div>
      </main>
     </c:if>
      
      <div align="center">
      <c:if test="${ empty adminLoginVO and  not empty loginVO}">  
         <div class="section-title">
          <h2>${ loginVO.id }님의 상담 리스트</h2>
        </div>
      </c:if>
      <c:if test="${ not empty adminLoginVO and empty loginVO}">  
      <div class="section-title">
          <h2>상담 리스트 조회</h2>
        </div>
      </c:if>
      	 <select name="mainCategory" class="f0" style="width:10%">
                    <option>대분류</option>
                    <option value="금융상품">금융상품</option>
                    <option value="금융경험">금융경험</option>
                    <option value="기타">기타</option>
          </select><button style="height: 27px;" class="btn btn-primary px-3 ml-4" >검색</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	<input type="text"><button style= "height: 28px;" class="btn btn-primary px-3 ml-4" >검색</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	<input type="date">-<input type="date"><button style="height: 29px;"  class="btn btn-primary px-3 ml-4" >검색</button>
      	                                                                      
     <!--  	<div class="search-box">
		<form method="get" action="#">
			<input size="15" class="search-field" name="s" id="s" value="Search.." onfocus="if(this.value == 'Search..') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Search..';}" type="text">
			<input value="" class="search-go" type="submit"> 
		</form>
		</div> -->
     <br>
     <br>
       <!--유저 로그인시 보여지는 ui  -->
          <div class="table-responsive" align="center">
            <table class="table table-hover table-sm" style="width:77%";>
              <thead>
                <tr class="jj">
                  <th>상담번호</th>
                  <th>등록일시</th>
                  <th>고객유형</th>
                  <th>ID</th>
                  <th>생일</th>
                  <th>대분류</th>
                  <th>중분류</th>
                  <th>제목</th>
                  <th>담당직원</th>
                  <th>사원번호</th>
                  <th>진행상태</th>
                  <th>추가상담</th>
                </tr>
              </thead>
              <c:if test="${ empty adminLoginVO and  not empty loginVO}"> 
        	 <c:forEach items="${ customerConsultingList }" var="consulting" varStatus="loop">
                 <tbody>
                 <tr>
                  <td align="center">${ consulting.consultingNo }</td>
                  <td>${ consulting.reportYmd }</td>
                  <td align="center">${ consulting.customerType }</td>
                  <td>${ consulting.id }</td>
                  <td>${ consulting.birth }</td>
                  <td>${ consulting.mainCategory }</td>
                  <td>${ consulting.middleCategory }</td>
                  <td>${ consulting.title }</td>
                  <td>${ consulting.adminName }</td>
                  <td>${ consulting.empno }</td>
                  <td align="center">${ consulting.progress }</td>
                  <td align="center">${ consulting.addConsulting } 
                  <button onclick="openModal(${ consulting.consultingNo })" class="btn btn-primary px-3 ml-4">신청</button>
                  </td>
                 </tr>
                </tbody>
              
                
                <!-- 모달 창 -->  
	  <div class="modal fade" id="reserveModal${ consulting.consultingNo }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="text-align: center;">
				<div class="modal-header">
					<h6 class="modal-title" id="exampleModalLabel"><strong>추가 상담 예약</strong></h6>
					<!-- <button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
					<!-- <button class="close" type="button" data-dismiss="modal" aria-label="Close"> </button> -->
				</div>
				<div class="modal-body">예약하실 날짜를 선택해주세요</div>
				<input type="datetime-local" name="date" style="align-self: center ;width: 20rem" value="reserveDate" >
				<hr>	 
				<div style="text-align: center; margin-bottom: 1.8rem;">
					 <input type="submit" id="enrollmentBtn" class="btn btn-primary px-3 ml-4"  value="접수" style="width: 20%;  align:center;">
					 <input type="button" onclick="closeModal()" class="btn btn-primary px-3 ml-4"  value="취소" style="width: 20%;  align:center;">
				</div>
			</div>
		  </div>
	     </div>
	    </c:forEach>
       </c:if>
      
               <!-- 관리자로 로그인 시 보여지는 ui --> 
         <c:if test="${ not empty adminLoginVO and empty loginVO}"> 
          <c:forEach items="${ consultingList }" var="consulting" varStatus="loop">
                 <tbody>
                 <tr>
                  <td align="center">${ consulting.consultingNo }</td>
                  <td>${ consulting.reportYmd }</td>
                  <td>${ consulting.customerType }</td>
                  <td><a href="javascript:doAction('${ consulting.id }')">${ consulting.id }</a></td>
                  <td>${ consulting.birth }</td>
                  <td>${ consulting.mainCategory }</td>
                  <td>${ consulting.middleCategory }</td>
                  <td><a href="javascript:goReport(${ consulting.consultingNo })">${ consulting.title }</a></td>
                  <td>${ consulting.adminName }</td>
                  <td>${ consulting.empno }</td>
                  <td align="center">${ consulting.progress }</td>
                  <td align="center">${ consulting.addConsulting } 
                 </tr>
                </tbody>
          </c:forEach>
         </c:if>
       </table>
      </div>
      </div>        
        <br>
	</section> 
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<footer id="footer">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include>
    
<script>

function openModal(consultingNo) {
	$("#reserveModal"+consultingNo).modal("show")
	
}

function closeModal() {
	$(".modal").modal("hide")
}
 
//  $('#reserveBtn').click(function(e){
// 	 e.preventDefault(); 
// 	$('#reserveModal').modal("show");
	 
//  });
	
 </script>
    
</body>
</html>