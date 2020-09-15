<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  
<script src="https://momentjs.com/downloads/moment.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.js'></script>
<link rel='stylesheet' href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css" />
        
     <!--  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.9.1/lang-all.js"></script>
	 -->
</head>
<style>

	body {
		margin: 0;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}


	#calendar {
		max-width: 900px;
		margin: 40px auto;
		padding: 0 10px;
	}

</style>

      <body>
 <header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
</header>
   <br>
	<br>
	<br>
	<section style="align:center">
	<br>
	
	<br>   
<!-- <button type="button" id="btn2" rel="modal:open">달력 소환</button>

<div class="modal" id="modal2" style="margin-left:40%;margin-top:5%">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">상담 예약</h4>
			</div>
			<div class="modal-body">
				
				<div id="calendar">
				
				<div class="modal-body">예약하실 시간을 선택해주세요</div>
				<input type="datetime-local" name="date" style="align-self: center ;width: 20rem" value="reserveDate" >
				<hr>	 
				<div style="text-align: center; margin-bottom: 1.8rem;">
					 <input type="submit" id="enrollmentBtn" class="btn btn-primary px-3 ml-4"  value="접수" style="width: 20%;  align:center;">
					 <input type="button" onclick="closeModal()" class="btn btn-primary px-3 ml-4"  value="취소" style="width: 20%;  align:center;">
				</div>
				
				</div>
			</div>
		</div>
	</div>
</div>

 -->

<!-- 				<form name="eform" > -->
				<div id="calendar">
				<div class="modal-body">* 예약하실 시간을 선택해주세요(30분 단위로 예약이 가능합니다.)</div> 
				<%-- <div> 담당자 :${ consulting.name }</div> --%>
<%-- 				<input type="hidden" class="btn btn-outline-light text-dark" name="id" value="${ consulting.id }">  --%>
<%-- 				<input type="hidden" class="btn btn-outline-light text-dark" name="title" value="${ consulting.title }">  --%>
<%-- 				<input type="hidden" class="btn btn-outline-light text-dark" name="consultingNo" value="${ consulting.consultingNo }">  --%>
<%-- 				<input type="hidden" class="btn btn-outline-light text-dark" name="mainCategory" value="${  consulting.mainCategory }">  --%>
<%-- 				<input type="hidden" class="btn btn-outline-light text-dark" name="middleCategory" value="${ consulting.middleCategory }">  --%>
<%-- 				<input type="hidden" class="btn btn-outline-light text-dark" name="name" value="${ consulting.name }">  --%>
<%-- 				<input type="hidden" class="btn btn-outline-light text-dark" name="consultingChannel" value="${ consulting.consultingChannel }">  --%>
<%-- 				<input type="hidden" class="btn btn-outline-light text-dark" name="adminName" value="${ consulting.adminName }">  --%>
<%-- 				<input type="hidden" class="btn btn-outline-light text-dark" name="empno" value="${ consulting.empno }">  --%>
				
				<input type="datetime-local" name="date" style="align-self: center ;width: 20rem" id="reserveDate" >
				<hr>	 
				<div style="text-align: center; margin-bottom: 1.8rem;">
					 <input type="button" id="enrollmentBtn" class="btn btn-primary px-3 ml-4"  value="접수" style="width: 20%;  align:center;">
					<!--  <input type="button" onclick="close()" class="btn btn-primary px-3 ml-4"  value="취소" style="width: 20%;  align:center;"> -->
					<input type="button"  class="btn btn-primary px-3 ml-4" value="취소"  style="width: 20%;  align:center;" onClick="history.go(-1)"> 
				</div>
				</div>
<!-- 				</form> -->



 <script>
//CRUD - R
 function getreservationList(){ //댓글 있는 곳 로드시, 댓글 추가 시 댓글리스트가 뜨게끔 
     //ajax통해서 해당 게시물의 댓글리스트를 조회  => <div id="replyList"></div> 조회데이터 업데이트 
//    console.log(${ consulting.consultingNo })
//    console.log('${ consulting.empno }')
   $.ajax({
        url : '${ pageContext.request.contextPath }/schedule/${ consulting.empno }', //관리자 로그인시 adminLoginVO로 바꾸기
        type : 'get',
        //datatype: "json",
        success : function(data){ //db에서 가져와
        
        //$('#enrollmentBtn').empty(); //조회에 있던것 지우기 위해 	추가한것**
//         console.log(typeof data)
//         console.log(data)
        
        
        let reservationList = JSON.parse(data);
        console.log("reservationList")
        console.log(reservationList)
        
        var consultingSchedule = [];
        
          $(reservationList).each(function(){
             consultingSchedule.push({
              title : this.title,//(이건 너가 vo에 저장해준 이름으로 일단 임의로 컨설팅타이틀이라고 함)
              start : this.registerationYmd //(얘도 마찬가지로 너가 정한 이름으로 고쳐)
              
//               console.log("this.title" + this.title)
//               console.log("this.registerationYmd " + this.registerationYmd )
        /*    consultingNO : this.consultingNo,
              mainCategory: this.maninCategory,
              middleCategory: this.middleCategory,
              id: this.id,
              name: this.name,
              consultingChannel : this.consultingChannel,
              adminName : this.adminName,
              empno: this.empno */
             });
             console.log("this.title" + this.title)
             console.log("this.registerationYmd " + this.registerationYmd )
             console.log(typeof this.registerationYmd )
          });
//           let l = JSON.parse(consultingSchedule);
        console.log("consultingSchedule : " + consultingSchedule )
        console.log("consultingSchedule title : " + consultingSchedule['title'] )
        console.log("consultingSchedule start : " + consultingSchedule['start'] )
        
//         console.log(l)
        
           
          $('#calendar').fullCalendar({
                header: {
                   left: 'prev,next today',
                   center: 'title',
                   right: 'month,agendaWeek,agendaDay'
                },
                /* defaultDate: '2020-09-12', */
                businessHours: true, // display business hours
                editable: true,
                locale: "ko",
                events: consultingSchedule,
                
                dayClick: function() {
                    alert('상담 예약을 진행 하시겠습니까?'); 
                    }
             });
          }
       });
  };
 
  
  $(document).ready(function() {
   getreservationList();
});

  
//CRUD-C	
  $(document).ready(function(){
	 
	$('#enrollmentBtn').click(function(){
// 		let reservationYmd = document.eform.date.value;
		let registerationYmd = $("#reserveDate").val();
// 		let title = document.eform.title.value;
// 		let consultingNo = document.eform.consultingNo.value;
// 		let mainCategory = document.eform.mainCategory.value;
// 		let middleCategory = document.eform.middleCategory.value;
// 		let id = document.eform.id.value;
// 		let name = document.eform.name.value;
// 		let consultingChannel = document.eform.consultingChannel.value;
// 		let adminName  = document.eform.adminName.value;
// 		let empno  = document.eform.empno.value;

		let a = registerationYmd.split('T');
		let registeration = a.join(' ');
// 		console.log(b)
// 		console.log(registerationYmd)
// 		console.log(typeof parseInt('${ consulting.consultingNo }'))
// 		console.log(parseInt('${ consulting.consultingNo }'))
		//  /reply/insert?boardNo=12&content=aaa&writer=bbb 
			
	 	$.ajax({
			url : '${ pageContext.request.contextPath }/enrollmentSchedule',
			type : 'post',
			data : {
				title : '${ consulting.title }', 
				registerationYmd : registeration, 
				consultingNo : parseInt('${ consulting.consultingNo }'),
				mainCategory: '${ consulting.mainCategory }',
	            middleCategory: '${ consulting.middleCategory }', 
	            id: '${ consulting.id }',
	            name: '${ consulting.name }',
	            consultingChannel : '${ consulting.consultingChannel }',
	            adminName : '${ consulting.adminName }',
	            empno: '${ consulting.empno }',
			}, 
			success : function(){
		    	getreservationList(); //전체 댓글리스트 호출
		    	alert(registeration + '에 상담이 추가 접수 되었습니다. 리스트에서 확인해주세요.')
		    		document.location.href="${ pageContext.request.contextPath }/addConsulting";
		    	
			}, 
			error : function(){
				alert('실패')
			}, complete : function(){
				//성공하던 실패하던 경우 값 지워주기 화면단에서
				//document.eform.reservationYmd.value ='';
				
			}
			
		})		
	})
}) 
 


</script>

 
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
</body>
</html>