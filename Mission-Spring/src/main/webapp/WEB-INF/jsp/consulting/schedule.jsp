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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
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
				<div id="calendar">
				<div class="modal-body">* 예약하실 시간을 선택해주세요(30분 단위로 예약이 가능합니다.) 
				 <br>*일요일 및 공휴일을 제외한 상담은 AM9:00-PM6:00까지 가능합니다.</div> 
				<input type="date" name="reserveDate" onchange="checkTime()" style="align-self: center ;width:200px;height:37px; font-size:16px;" id="reserveDate" >
				
				<select id="reserveTime" style="width:140px; width:200px;height:37px; font-size:16px;">
					<option>예약 시간</option>
					<option  value="1">9:00-9:30</option>
					<option  value="2">9:30-10:00</option>
					<option  value="3">10:30-11:00</option>
					<option  value="4">11:00-11:30</option>
					<option  value="5">11:30-12:00</option>
					<option  value="6">13:00-13:30</option>
					<option  value="7">13:30-14:00</option>
					<option  value="8">14:00-14:30</option>
					<option  value="9">14:30-15:00</option>
					<option  value="10">15:00-15:30</option>
					<option  value="11">15:30-16:00</option>
					<option  value="11">16:30-17:00</option>
					<option  value="11">17:30-18:00</option>
			</select>
				<hr>	 
				
				<div style="text-align: center; margin-bottom: 1.8rem;">
				<textarea name="textarea" cols="105" rows="8" readonly="readonly" style="padding:12px;">개인정보의 수집 목적 및 이용 목적</textarea>
	 			 <br />
     			 <div align="center">
	 			 <input name="" type="checkbox" value="" style="border:0; background-color:#ffffff;">
	 			 <font color="#776091;"><b> 개인정보 취급방침에 동의함</b></font>
      			 <br><br>
				
					<input type="button" id="enrollmentBtn" class="btn btn-primary px-3 ml-4"  value="접수" style="width: 20%;  align:center;">
					<input type="button"  class="btn btn-primary px-3 ml-4" value="취소"  style="width: 20%;  align:center;" onClick="history.go(-1)"> 
	  			</div>
	  			</div>
				</div>


 <script>
 
 
 //CRUD - 달력 내역 조회
 function getreservationList(){ //댓글 있는 곳 로드시, 댓글 추가 시 댓글리스트가 뜨게끔 
     //ajax통해서 해당 게시물의 댓글리스트를 조회  => <div id="replyList"></div> 조회데이터 업데이트 
   $.ajax({
        url : '${ pageContext.request.contextPath }/schedule/${ consulting.empno }', //관리자 로그인시 adminLoginVO로 바꾸기
        type : 'get',
        plugins: ["interaction", "dayGrid"],
        //datatype: "json",
        success : function(data){ //db에서 가져와
        
        let reservationList = JSON.parse(data);
        console.log("reservationList")
        console.log(reservationList)
        
        var consultingSchedule = [];
        
          $(reservationList).each(function(){
             consultingSchedule.push({
              title : this.title,//(이건 너가 vo에 저장해준 이름으로 일단 임의로 컨설팅타이틀이라고 함)
              start : this.registerationDate,
              timezone: this.registerationTime //(얘도 마찬가지로 너가 정한 이름으로 고쳐)

             });
             console.log("this.title" + this.title)
             console.log("this.registerationYmd " + this.registerationYmd )
             console.log(typeof this.registerationYmd )
          });

        console.log("consultingSchedule : " + consultingSchedule )
        console.log("consultingSchedule title : " + consultingSchedule['title'] )
        console.log("consultingSchedule start : " + consultingSchedule['start'] )
        console.log(consultingSchedule)

           
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
                eventContent : consultingSchedule,
               
              /*   dayRender: function (date, cell) {
                    cell.css("background-color", "red");
                } */
             /*    eventClick: function(event) {
    				// opens events in a popup window
    				window.open(event.url, 'gcalevent', 'width=700,height=600');
    				return false;
    			} *//* ,
                dayClick: function() {
                    alert('상담 예약을 진행 하시겠습니까?'); 
                    } */
             });
       
          }
   
       });

  };
 
  
  $(document).ready(function() {
   getreservationList();
});
  
function checkTime() {
	let registerationDate = $("#reserveDate").val();
	console.log("상담예약 선택한 날짜: " + registerationDate )
	   $.ajax({
	        url : '${ pageContext.request.contextPath }/schedule/${ consulting.empno }', //관리자 로그인시 adminLoginVO로 바꾸기
	        type : 'get',
	        plugins: ["interaction", "dayGrid"],
	        //datatype: "json",
	        success : function(data){ //db에서 가져와
	        
	        let disableTime = [];
	        let reservationList = JSON.parse(data);
// 	        console.log("reservationList")
// 	        console.log(reservationList)
	        
	        $(reservationList).each(function() {
	        	let a = this.registerationDate.split(" ")
	        	let reservedDate = a[0]
		        console.log("이미예약된날짜:" + reservedDate )
	        	
				if (reservedDate ==  registerationDate ) {
					disableTime.push(this.registerationTime)
					
				}
			})
			console.log("불가능한 시간 배열: " + disableTime)
			console.log(typeof disableTime)
			
			for ( i in disableTime) {
				console.log("안되는시간 for문 " + disableTime[i])
				$("#reserveTime option[value*='" + disableTime[i] +  "']").prop('disabled',true);
			}


// 	        console.log("불가능한시간: " +  disableTime)
	          },
	          error : function() {
				console.log("실패")
			}
	   
	       });	
     }

  
//CRUD-달력 내역 추가 
  $(document).ready(function(){
	 
	$('#enrollmentBtn').click(function(){
		let registerationDate = $("#reserveDate").val();
		let registerationTime = $("#reserveTime").val();
		let registerationTime2 = $("#reserveTime option:checked").text();
		let a = registerationTime2 .split("-")
		let subTime = a[0]
		
		console.log(registerationDate )
		console.log(subTime )
		console.log(registerationTime )
		console.log( "일시" + registerationDate + " " + subTime )
// 		let a = registerationYmd.split('T');
// 		let registeration = a.join(' ');

	 	$.ajax({
			url : '${ pageContext.request.contextPath }/enrollmentSchedule',
			type : 'post',
			async : false,
			data : {
				title : '${ consulting.title }', 
				registerationDate : registerationDate + " " + subTime, 
				registerationTime : registerationTime, 
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
		    	alert(registerationDate+" "+registerationTime + '에 상담이 추가 접수 되었습니다. 리스트에서 확인해주세요.') 
		        document.location.href="${ pageContext.request.contextPath }/addConsulting";
// 		    	window.location.reload()
		    	 //callback(events);
			}, 
			error : function(){
				alert('실패')
			}, complete : function(){
			
			}
			
		})		
	})
}) 
 
//CRUD-D 달력 일정 삭제 
/* $(document).ready(function(){
		$(document).on('click','delBtn', function(){ 
			
			if(!confirm('댓글을 삭제하시겠습니까?'))return;
			
			let replyNo = $(this).attr('id'); //버튼객체의 id = no를 가져옴 
			
			$.ajax({ //삭제하기 위해서 ajax통신 다시 
				url: '${ pageContext.request.contextPath }/reply/' + replyNo + '/${inquiry.no}',
				type: 'delete',
				success : function(){
					//alert('성공')
					getReplyList()
				},error: function(){
					alert('실패') 
				}
			});
			
		})
	}) */	
	

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