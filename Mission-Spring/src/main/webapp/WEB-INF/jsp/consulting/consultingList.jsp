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
      
<!-- 여기서부터 검색항목 시작 -->
      	 <select id="mainCategory" name="mainCategory" class="f0" style="width:10%">
                    <option value="">대분류</option>
                    <option value="금융상품">금융상품</option>
                    <option value="금융경험">금융경험</option>
                    <option value="기타">기타</option>
          </select>
          <select id="middleCategory" name="middleCategory" class="f1" style="width:15%">
                     <option value="">중분류</option>
	      </select>
	    <c:if test="${ not empty adminLoginVO and empty loginVO}">  
      		<input type="text" id="searchWord" placeholder="  손님 ID / 이름  및 직원사번 조회" style="width:20%">
      	</c:if>
      	<c:if test="${ empty adminLoginVO and  not empty loginVO}"> 
      		<input type="text" id="searchWord" placeholder="제목으로 검색" style="width:20%">
      	</c:if>
      	
      	<input type="date" id="startDate">-<input type="date" id="endDate">
	    <c:if test="${ not empty adminLoginVO and empty loginVO}">  
      	
	      	<button style="height: 29px;"  class="btn btn-primary px-3 ml-4" onclick="searchByAdmin()">검색</button>
	     </c:if>
	     <c:if test="${ empty adminLoginVO and  not empty loginVO}"> 
      		<button style="height: 29px;"  class="btn btn-primary px-3 ml-4" onclick="searchByUser()">검색</button>
      	</c:if>
<!--       	여기서 검색 항목 끝 -->
      	                                                                      
     <br>
     <br>
       <!--유저 로그인시 보여지는 ui  -->
          <div class="table-responsive" align="center">
            <table class="table table-hover table-sm" style="width:77%">
              <thead>
                <tr class="jj">
                  <th>상담번호</th>
                  <th>등록일시</th>
                  <th>고객유형</th>
                  <th>고객이름</th>
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
                 <tbody id="userConsultingList">
        	 <c:forEach items="${ consultingList }" var="consulting" varStatus="loop">
                 <tr>
                  <td align="center">${ consulting.consultingNo }</td>
                  <td>${ consulting.reportYmd }</td>
                  <td align="center">${ consulting.customerType }</td>
                  <td>${ consulting.id }</td>
                  <td>${ consulting.name }</td>
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
	    </tbody>
       </c:if>
      
               <!-- 관리자로 로그인 시 보여지는 ui --> 
         <c:if test="${ not empty adminLoginVO and empty loginVO}"> 
                 <tbody id="adminConsultingList" >
          <c:forEach items="${ consultingList }" var="consulting" varStatus="loop">
                 <tr>
                  <td align="center">${ consulting.consultingNo }</td>
                  <td>${ consulting.reportYmd }</td>
                  <td>${ consulting.customerType }</td>
                   <td>${ consulting.name }</td>
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
          </c:forEach>
                </tbody>
         </c:if>
       </table>
      </div>
      </div>        
<!-- ====페이징======================================================================================= -->
	<br>
	<div style="margin-left: 45%">
<!-- ---------이전 버튼 구현 --------------------------- -->
			<c:if test="${blockNo != 1 }"> 
			 <c:if test="${ not empty adminLoginVO and  empty loginVO}"> 
				<a href= "${pageContext.request.contextPath}/consultingList/admin/${blockNo - 1}/${blockStartPageNo-1 }">이전</a> &nbsp;
			</c:if>
			
			 <c:if test="${ empty adminLoginVO and  not empty loginVO}"> 
			 <a href= "${pageContext.request.contextPath}/consultingList/${blockNo - 1}/${blockStartPageNo-1 }">이전</a> &nbsp;
			 </c:if>
			</c:if>
			
<!-- ---------페이지 구현 --------------------------- -->			
			<c:forEach var="i" begin="${blockStartPageNo }" end="${blockEndPageNo }">
				<c:choose>
				
					<c:when test="${pageNo == i }"> <!-- 현 페이지 넘버와 클릭할수있는 페이지 넘버가 같으면 링크없애줌 -->
						${i }&nbsp;|&nbsp;
					</c:when>
					
					<c:otherwise>
					<c:if test="${ not empty adminLoginVO and  empty loginVO}"> 
						<a href="${pageContext.request.contextPath}/consultingList/admin/${blockNo}/${i }">${i }&nbsp;</a>|&nbsp;
					</c:if>
					<c:if test="${ empty adminLoginVO and not empty loginVO}"> 
						<a href="${pageContext.request.contextPath}/consultingList/${blockNo}/${i }">${i }&nbsp;</a>|&nbsp;
					</c:if>
					</c:otherwise>
					
				</c:choose>
			</c:forEach>
			
<!-- ---------다음 버튼 구현 --------------------------- -->	
			<c:if test="${blockNo != totalBlockCnt}">&nbsp;
			<c:if test="${ not empty adminLoginVO and  empty loginVO}"> 
				<a href="${pageContext.request.contextPath}/consultingList/admin/${blockNo + 1}/${blockEndPageNo+1 }">다음</a> &nbsp;
			</c:if>
			<c:if test="${ empty adminLoginVO and not empty loginVO}"> 
				<a href="${pageContext.request.contextPath}/consultingList/${blockNo + 1}/${blockEndPageNo+1 }">다음</a> &nbsp;
			</c:if>
			</c:if>
	</div>	
	
<!-- ==== 페이징 끝! ================================================================== -->	


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


//유저단 검색

function searchByUser() {
	let mainCategory = $("#mainCategory").val()
	let middleCategory = $("#middleCategory").val()
	let searchWord = $("#searchWord").val()
	let startDate = $("#startDate").val()
	let endDate = $("#endDate").val()

	console.log(mainCategory)
	console.log(middleCategory)
	console.log(searchWord)
	console.log(startDate )
	console.log(endDate)

	if(mainCategory != '' || middleCategory != '' || searchWord != '' || startDate != '' || endDate != '') {
	
	$.ajax({
		url : "${pageContext.request.contextPath}/searchConsultingById",
		type : 'get',
		data : {
			mainCategory :  mainCategory,
			middleCategory : middleCategory, 
			searchWord : searchWord, 
			startDate : startDate, 
			endDate : endDate 
		},
		success : function(data) {
			console.log("성공")
//			console.log(typeof data)
			let cd = JSON.parse(data) 
			console.log(cd)
			$("#userConsultingList").empty()
			for (key in cd) {
				
				console.log(cd[key]["id"])
				
				let str = ""
				
				str += "<tr>";
				str += '<td align="center">' + cd[key]["consultingNo"] + '</td>'
				str += '<td>' + cd[key]['reportYmd'] + '</td>'
				str += '<td>' + cd[key]['customerType'] + '</td>'
				str += '<td>' + cd[key]['name'] + '</td>'
				str += '<td>' + '<a href="javascript:doAction(' + cd[key]['id'] + ')">' + cd[key]['id'] +'</a>' + '</td>'
				str += '<td>' + cd[key]['birth'] + '</td>'
				str += '<td>' + cd[key]['mainCategory'] + '</td>'
				str += '<td>' + cd[key]['middleCategory'] + '</td>'
				str += '<td>' + '<a href="javascript:goReport(' + cd[key]['consultingNo'] + ')">' + cd[key]['title'] +'</a>' + '</td>'
              str += '<td>' + cd[key]['adminName'] + '</td>'
              str += '<td>' + cd[key]['empno'] + '</td>'
              str += '<td align="center">' + cd[key]['progress'] +'</td>'
              str += '<td align="center">' + cd[key]['addConsulting']
              str += '<button onclick="openModal(' + cd[key]['consultingNo'] + ')" class="btn btn-primary px-3 ml-4">' + '신청' + '</button>'
              str += '</td>'
              str += '<tr>';
              
              $("#userConsultingList").append(str)

			}
			
		},
		error : function() {
			console.log("실패")
		}
		
		
		
	})
} else {
	location.href = "${pageContext.request.contextPath}/consultingList"
}		
}





function searchByAdmin() {
// 	let mainCategory = document.sForm.mainCategory.value
	let mainCategory = $("#mainCategory").val()
	let middleCategory = $("#middleCategory").val()
	let searchWord = $("#searchWord").val()
	let startDate = $("#startDate").val()
	let endDate = $("#endDate").val()

	console.log(mainCategory)
	console.log(middleCategory)
	console.log(searchWord)
	console.log(startDate )
	console.log(endDate)

	if(mainCategory != '' || middleCategory != '' || searchWord != '' || startDate != '' || endDate != '') {
	
	$.ajax({
		url : "${pageContext.request.contextPath}/searchConsulting",
		type : 'get',
		data : {
			mainCategory :  mainCategory,
			middleCategory : middleCategory, 
			searchWord : searchWord, 
			startDate : startDate, 
			endDate : endDate 
		},
		success : function(data) {
			console.log("성공")
// 			console.log(typeof data)
			let cd = JSON.parse(data) 
			console.log(cd)
			$("#adminConsultingList").empty()
			for (key in cd) {
				
				console.log(cd[key]["id"])
				
				let str = ""
				
				str += "<tr>";
				str += '<td align="center">' + cd[key]["consultingNo"] + '</td>'
				str += '<td>' + cd[key]['reportYmd'] + '</td>'
				str += '<td>' + cd[key]['customerType'] + '</td>'
				str += '<td>' + cd[key]['name'] + '</td>'
				str += '<td>' + '<a href="javascript:doAction(' + cd[key]['id'] + ')">' + cd[key]['id'] +'</a>' + '</td>'
				str += '<td>' + cd[key]['birth'] + '</td>'
				str += '<td>' + cd[key]['mainCategory'] + '</td>'
				str += '<td>' + cd[key]['middleCategory'] + '</td>'
				str += '<td>' + '<a href="javascript:goReport(' + cd[key]['consultingNo'] + ')">' + cd[key]['title'] +'</a>' + '</td>'
                str += '<td>' + cd[key]['adminName'] + '</td>'
                str += '<td>' + cd[key]['empno'] + '</td>'
                str += '<td align="center">' + cd[key]['progress'] +'</td>'
                str += '<td align="center">' + cd[key]['addConsulting'] +'</td>'
                str += '<tr>';
                
                $("#adminConsultingList").append(str)

			}
			
		},
		error : function() {
			console.log("실패")
		}
		
		
		
	})
} else {
	location.href = "${pageContext.request.contextPath}/consultingList/admin"
 }		
}




function doAction(customerInformId){
	
	location.href="${ pageContext.request.contextPath }/myPage/" + customerInformId;
}

function goReport(reportNo){
	location.href="${ pageContext.request.contextPath }/consulting/admin/" + reportNo;
}
 



function openModal(consultingNo) {
	$("#reserveModal"+consultingNo).modal("show")
	
}

function closeModal() {
	$(".modal").modal("hide")
}


$(document).ready(function(){
	var pr=['예금','적금','카드','대출','연금','펀드','보험','외환','수표','금'];
	var ex=['모바일','인터넷','콜센터','창구','원격'];
	var et=['기타'];
		$('.f0').change(function(){
			var sel = $(this).val();
// 			console.log(sel);
			if(sel == '금융상품'){
				$('.op').remove();
				$.each(pr,function(i,item){
					$('.f1').append('<option class="op">'+item+'</option>');
				});
			}
			if(sel == '금융경험'){
				$('.op').remove();
				$.each(ex,function(i,item){
					$('.f1').append('<option class="op">'+item+'</option>');
				});
			}
			if(sel == '기타'){
				$('.op').remove();
				$.each(et,function(i,item){
					$('.f1').append('<option class="op">'+item+'</option>');
				});
			}
		});
}); 
 
//  $('#reserveBtn').click(function(e){
// 	 e.preventDefault(); 
// 	$('#reserveModal').modal("show");
	 
//  });
	
 </script>
    
</body>
</html>