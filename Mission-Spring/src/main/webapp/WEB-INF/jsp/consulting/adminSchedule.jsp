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
.fc-event{
background-color:#F17676;
border:0px!important;
}
.fc-content{
    background-color:#F17676;
    color:white;
    border-color:0;
}
.fc-event-container{
border-width:0px;
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
				<div id="calendar" style="text-align:center">
				<div class="modal-body"><h6 style="text-decoration: underline;">※ 관리자님 상담이 불가한 일정을 추가해주세요</h6></div> 
				<textarea name="textarea" cols="60" rows="1" id="scheduleInfo" style="font-size:20px; width:403px";></textarea>
				<br>
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
			</select>
			
				<hr>
			<input type="button" id="enrollmentBtn" class="btn btn-primary px-3 ml-4"  value="접수" style="width:20%; font-size:18px;  align:center;">
			<input type="button"  class="btn btn-primary px-3 ml-4" value="취소"  style="width: 20%; font-size:18px;  align:center;" onClick="history.go(-1)"> 	 
			</div>

 <script>
 
 
 //CRUD - 달력 내역 조회
 function getreservationList(){ //댓글 있는 곳 로드시, 댓글 추가 시 댓글리스트가 뜨게끔 
     //ajax통해서 해당 게시물의 댓글리스트를 조회  => <div id="replyList"></div> 조회데이터 업데이트 
   
	
   $.ajax({
        url : '${ pageContext.request.contextPath }/schedule/${ adminLoginVO.empno }', //관리자 로그인시 adminLoginVO로 바꾸기
        type : 'get',
        plugins: ["interaction", "dayGrid"],
        //datatype: "json", 
        async : false,
        success : function(data){ //db에서 가져와
        
        	let reservationList = JSON.parse(data);
        	console.log("reservationList")
        	console.log(reservationList)
        
        	var consultingSchedule = [];
        	//var url='usa__en@holiday.calendar.google.com';
        
          	$(reservationList).each(function(){
          		consultingSchedule.push({
          			title : this.title,
          			start : this.registerationDate,
          			//url : "${ pageContext.request.contextPath }/deleteSchedule/${ adminLoginVO.empno }"
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
                eventClick: function(event) {
                	
    				if(confirm('해당 일정을 삭제하시겠습니까?')) {
    					document.location.href="${ pageContext.request.contextPath }/deleteSchedule/${ adminLoginVO.empno }/" + event.title;
    				}
    				//callback(events);
    				//window.open(event.url, 'gcalevent', 'width=500, height=500');
    				//return false;
    			},

                dayClick: function() {
                    alert('상담 예약을 진행 하시겠습니까?');
                },
          	/* $('#calendar').fullCalendar('updateEvent', event); */
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
	        url : '${ pageContext.request.contextPath }/schedule/${ adminLoginVO.empno }', //관리자 로그인시 adminLoginVO로 바꾸기
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
		let scheduleInfo = $("#scheduleInfo").val();
		let registerationDate = $("#reserveDate").val();
		let registerationTime = $("#reserveTime").val();
		let registerationTime2 = $("#reserveTime option:checked").text();
		let a = registerationTime2 .split("-")
		let subTime = a[0]
		
		let events;
		
		console.log(registerationDate )
		console.log(subTime )
		console.log(registerationTime )
		console.log( "일시" + registerationDate + " " + subTime )
		
// 		let a = registerationYmd.split('T');
// 		let registeration = a.join(' ');
        var x =	Math.floor(Math.random()*100)+102;
        var consultingNo = x;
	 	$.ajax({
			url : '${ pageContext.request.contextPath }/enrollmentByAdmin',
			type : 'post',
			async : false,
			data : {
				consultingNo : consultingNo,
				title : scheduleInfo, 
				registerationDate : registerationDate + " " + subTime, 
				registerationTime : registerationTime,
				empno : '${ adminLoginVO.empno }'
			}, 
			success : function(){
		    	getreservationList(); //전체 댓글리스트 호출
		    	 alert(registerationDate +" "+registerationTime + '에 새로운 일정이 추가 되었습니다.') 
		    	
		    	/* $('#calendar').fullCalendar('updateEvent', event); */
		    	 
		    	 //document.location.reload();
		    	
		    	window.location.reload()
		    	 //callback(events);
		    	//document.location.href="${ pageContext.request.contextPath }/addConsulting";
		    	 
			}, 
			error : function(){
				alert('실패')
			}, complete : function(){
			
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