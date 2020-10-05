<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>추가상담 리스트</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  
<link href="/resources/assets/css/album.css" rel="stylesheet">
<script>

	
function goReport(reportNo){
		location.href="${ pageContext.request.contextPath }/consulting/admin/" + reportNo;
	}	 
	
function goMember(customerId){
	location.href="${ pageContext.request.contextPath }/myPage/" + customerId;
}

function calendar(){
	location.href="${ pageContext.request.contextPath }/adminSchedule";
}

function userCalendar(){
	location.href="${ pageContext.request.contextPath }/userSchedule";
}

function progress(consultingNo){
	location.href="${ pageContext.request.contextPath }/updateProgress/" +consultingNo;
}

function goReport(reportNo){
	location.href="${ pageContext.request.contextPath }/consulting/admin/" + reportNo;
}


function consultingList(){
	location.href="${ pageContext.request.contextPath }/consultingList/1/1";
}




</script>
<style>
body {background-color:#fafafa;padding:0px;}
a#ho:hover{
	color:#008C8C;
	text-decoration: underline;
}

*, ::after, ::before {
    box-sizing: content-box;
    }
    
.btn-outline-primary{
border-width:0px!important;
font-size:15px;
font-weight:600;
}    

</style>
</head>
<body>
<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
	</header>
	<br>
	<br>
	<br><br><br>
	<section>
      <div class="album py-5 bg-light">
        <div class="container">
 	 <div align="center">
 	 <br>
 	<c:if test="${ empty adminLoginVO and not empty loginVO}">
 	  <div class="section-title">
          <h2>MY 추가 상담 리스트</h2>
          <br>
          <!-- <i class="icofont-calendar"></i> --><input type="button" class="btn btn-primary px-3 ml-4" id="calendar" style="height:40px; font-size:20px" onclick="userCalendar()" value="내 달력보기">
       </div>
    </c:if>
    	<c:if test="${ not empty adminLoginVO and empty loginVO}">
        <div class="section-title">
         <c:if test="${ adminLoginVO.type eq 'C' or 'V' or 'I'}">
          <h2>  ${ adminLoginVO.admin_name } 상담사님의  추가 상담 리스트</h2>
         </c:if>
          <c:if test="${ adminLoginVO.type eq 'B' }">
           <h2>  ${ adminLoginVO.admin_name } 행원님의  추가 상담 리스트</h2>
          </c:if>
          
          <br>
            <!-- <i class="icofont-calendar"></i> --><input type="button" class="btn btn-primary px-3 ml-4" id="calendar" style="height:40px" onclick="calendar()" value="내 달력보기">
        </div>	
    </c:if>
    </div>
      <br>
      <div class="row">
      <!-- 유저 로그인 시 ui -->
      <c:if test="${ empty adminLoginVO and not empty loginVO}">
       <c:forEach items="${ userAddConsultingList }" var="register" varStatus="loop">
            <div class="col-md-4">
              <div class="card mb-4 shadow rounded content">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail">
                <div class="card-body">
                  <p class="card-text" style="color:#2C4964;font-size:19px">
				 <strong>상담번호</strong>: ${ register.consultingNo }<br>
				 <strong>대분류</strong>: ${ register.mainCategory }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				 <strong>중분류</strong>: ${ register.middleCategory }<br>
				<strong>손님 ID</strong>: <a href="javascript:goMember('${ register.id }')" style="color:#2C4964" id="ho">${ register.id }</a><br>
				<strong>손님 성함</strong>: ${ register.name }<br>
				<strong>제목</strong>: ${ register.title }<br>
				<strong>상담채널</strong>: ${ register.consultingChannel }<br>                   
                <strong>담당직원</strong>: ${ register. adminName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>사원번호</strong>:  ${ register.empno }<br>
                <strong style="color:#008C8C">추가 상담 예약일시: ${ register.registerationDate }</strong><br> 
                  </p>
                  <hr>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-secondary" onclick="consultingList()"><strong>목록</strong></button>&nbsp;&nbsp;
                      <button type="button" class="btn btn-secondary" onclick="delSchedule(${ register.consultingNo })"><strong>접수취소</strong></button>
                    </div>
                    <small class="text-muted"><strong>${ register.no }</strong></small>
                  </div>
                </div>
              </div>
            </div>
            <script>
         function delSchedule(consultingNo){
	
			$.ajax({
		    	url: "${ pageContext.request.contextPath }/delSchedule/" +consultingNo,
		    	type:"post",
		    	data:{
		    		name : '${ register.name }',
		    		registerationDate  : '${ register.registerationDate }', 
		    	},
		    	success:function(){
		    		alert("${ register.registerationDate } 상담이 접수 취소되었습니다.");
		    		document.location.href = "${ pageContext.request.contextPath }/consultingList/1/1";
		    	},
		    	error : function(){
		    		alert('접수 취소 실패')
		    	}
		      })
         }
               </script>     
            </c:forEach>
           </c:if>
             
             
          <!-- 관리자 로그인 시 ui -->  
          <c:if test="${ not empty adminLoginVO and empty loginVO}">
      		<c:forEach items="${ adminAddConsultingList }" var="register" varStatus="loop">
            <div class="col-md-4">
              <div class="card mb-4 shadow rounded content">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail">
                <div class="card-body">
                  <p class="card-text" style="color:#2C4964; font-size:19px">
				 <strong>상담번호</strong>: ${ register.consultingNo }<br>
				 <strong>대분류</strong>: ${ register.mainCategory }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				 <strong>중분류</strong>: ${ register.middleCategory }<br>
				<strong>손님 ID</strong>:  <a href="javascript:goMember('${ register.id }')" style="color:#2C4964" id="ho">${ register.id }</a><br>
				<strong>손님 성함</strong>: ${ register.name }<br>
				<strong>제목</strong>: <a href="javascript:goReport(${ register.consultingNo })" style="color:#2C4964" id="ho"><strong>${ register.title }</strong></a><br>
				<strong>상담채널</strong>: ${ register.consultingChannel }<br>                   
                <strong>담당직원</strong>: ${ register.adminName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>사원번호</strong>:  ${ register.empno }<br>
                
                <strong style="color:#008C8C">추가 상담 예약일시: ${ register.registerationDate }</strong><br> 
                  </p>
                  <hr>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-secondary" onclick="goReport(${ register.consultingNo })"><strong>상세보기</strong></button>&nbsp;&nbsp;
                      <button type="button" class="btn btn-secondary" onclick="sendConsultingModal(${ register.consultingNo })"><strong>상담전달</strong></button>&nbsp;&nbsp;
                      <button type="button"class="btn btn-outline-primary" onclick="openModal(${ register.consultingNo })"><strong>알림전송</strong></button>
                       &nbsp;&nbsp; <button type="submit" class="btn btn-warning" onclick="progress(${ register.consultingNo })"><strong>상태: ${ register.progress }</strong></button>
                    </div>
                    <small class="text-muted"><strong>${ register.no }</strong></small>
                  </div>
                </div>
              </div>
             </div>
             
             
           <!-- 문자 알림 전송 모달 창 -->  
	 <div class="modal fade" id="sendModal${ register.consultingNo }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top:300px">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="color:#444444"><strong>문자 알림 전송</strong></h5>
				</div>
				<div class="modal-body">문자 알림을 전송하시겠습니까?</div>
				<div class="modal-footer">
			  <button onclick="sendMsg()"class="btn btn-outline-primary" style="width: 20%; font-size:20px"><strong>전송</strong></button>
			 <input type="button" onclick="closeModal()" class="btn btn-outline-primary"  value="취소" style="width: 20%; font-size:20px;  align:center;">
				</div>
			</div>
		</div>
	</div>
    
    
          <!-- 상담 전달 모달 창 -->  
	 <div class="modal fade" id="sendConsultingModal${ register.consultingNo }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top:300px">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="color:#444444"><strong>상담 전달하기</strong></h5>
				</div><br>
				
				<select name="empno" style="width:470px; margin-left:15px;"> 
				 <option value="hn0801">hn0801(창구)</option>
				  <option value="hn0802">hn0802(창구)</option>
				 <option value="hnc1001">hnc1001(콜센터)</option>
				 <option value="hnc1002">hnc1002(콜센터)</option>
				 <option value="hnv2004">hnv2004(원격)</option>
				  <option value="hni3001">hni3001(원격)</option>
				</select>
				
				<div class="modal-body"> 해당 상담을 전달하시겠습니까?</div>
				<div class="modal-footer">
			  <button type="submit" onclick="sendConsulting(${ register.consultingNo })"class="btn btn-outline-primary" style="width: 20%; font-size:20px"><strong>전달하기</strong></button>
			 <input type="button" onclick="closeModal()" class="btn btn-outline-primary"  value="취소" style="width: 20%; font-size:20px;  align:center;">
				</div>
			</div>
		</div>
	</div>
    
    <script> /* 문자 알림 전송하기 */
    
    function openModal(consultingNo) {
    	$("#sendModal"+consultingNo).modal("show")
    }
    
    
    function sendMsg(no){
	
	$.ajax({
    	url: "${pageContext.request.contextPath}/sendMsg",
    	type:"post",
    	data:{
    		name : '${ register.name }',
    		registerationDate  : '${ register.registerationDate }', 
    	},
    	success:function(){
    	alert("${ register.name }님께 예약 알림 문자 전송 완료 되었습니다.");
    	document.location.href = '${ pageContext.request.contextPath }/addConsulting/admin'
    	
    	},
    	error : function(){
    		alert('문자보내기 실패')
    	}
      })
	}
    
    function closeModal() {
    	$(".modal").modal("hide")
    }
    
    
    
    function sendConsultingModal(consultingNo){
    	$("#sendConsultingModal"+consultingNo).modal("show")
    }
    
    function sendConsulting(consultingNo){
	location.href="${ pageContext.request.contextPath }/sendConsulting/" +consultingNo;
		} 
    
    </script>        
    </c:forEach>
           </c:if>     
            </div>
           </div>
         </div>
         
  
         
         
	</section>
	<footer id="footer" style="margin-top:200px">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include> 
    
</body>
</html>