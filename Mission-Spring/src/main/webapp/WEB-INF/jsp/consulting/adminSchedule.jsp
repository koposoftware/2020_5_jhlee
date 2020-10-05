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

div.fc-content{
 color:#fff;
/* background-color:#ffffff; */
/* border:none; */
}

.fc-day-grid-event {
    margin: 1px 2px 0;
    padding: 0 1px;
   /*  background-color: #ffffff; */
    border: 0px;
    
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
	<br>  <br><br><br>

			<div id="calendar" style="text-align:center">
				<div class="modal-body"><h6 style="text-decoration: underline;">※ 관리자님 상담이 불가한 일정을 추가해주세요</h6></div> 
				<textarea name="textarea" cols="60" rows="1" id="scheduleInfo" style="font-size:20px; width:403px";></textarea>
				<br>
				<input type="date" name="reserveDate" onchange="checkTime()" style="align-self: center ;width:200px;height:37px; font-size:16px;" id="reserveDate"  autofocus="autofocus" >
		
				<select id="reserveTime" name="reserveDate" style="width:140px; width:200px;height:37px; font-size:16px;">
					<option>예약 시간</option>
					<option  value="0">종일</option>
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
					<option  value="12">16:30-17:00</option>
					<option  value="13">17:30-18:00</option>
			   </select>
			<br>
		<!-- 	<input type="date" name="reserveDate2" onchange="checkTime()" style="align-self: center ;width:200px;height:37px; font-size:16px;" id="reserveDate2"  autofocus="autofocus" >
				<select name="reserveDate2" id="reserveTime2" style="width:140px; width:200px;height:37px; font-size:16px;">
					<option>예약 시간</option>
					<option  value="0">종일</option>
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
					<option  value="12">16:30-17:00</option>
					<option  value="13">17:30-18:00</option>
			   </select> -->
				<hr>
			<input type="button" id="enrollmentBtn" class="btn btn-primary px-3 ml-4"  value="접수" style="width:20%; font-size:18px;  align:center;">
			<input type="button"  class="btn btn-primary px-3 ml-4" value="취소"  style="width: 20%; font-size:18px;  align:center;" onClick="history.go(-1)"> 	 
			</div>

 <script>
 
 
 
 //CRUD - 달력 내역 조회
 function getreservationList(){
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
          			end : this.registerationDate2
          			//url : "${ pageContext.request.contextPath }/deleteSchedule/${ adminLoginVO.empno }"
          		/* 	allDay : false,	
          			rendering : 'background',
          			color: '#ff9f89' */
          		});
          		/* console.log("this.title" + this.title)
          		console.log("this.registerationYmd " + this.registerationYmd )
          		console.log(typeof this.registerationYmd ) */
          	});
          	
        /*   	console.log("consultingSchedule : " + consultingSchedule )
          	console.log("consultingSchedule title : " + consultingSchedule['title'] )
          	console.log("consultingSchedule start : " + consultingSchedule['start'] )
          	console.log(consultingSchedule)
          	console.log(event[1]) */
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
            	selectable: true,
            	eventLimit : true,
            	navLinks: true,
                events: consultingSchedule,
                //eventColor: '#fff',
                allDay: 'true',
                eventContent : consultingSchedule,
                eventRender : function(event, element) {
                	if( this.title.includes("휴가")){
                		//var icon  = '<div class="squre" style="width:10px; height:10px; background:red;"></div>'
                		    $(element).find('.fc-content').css('background-color', 'red'); 
                		    $(element).find('.fc-content').css('border', '0px'); 
                           // $(element).find('.fc-content').append(icon); 
                		    $(element).find('span.fc-time').hide();
                	 }if( this.title.includes("대출")){
                		 $(element).find('.fc-content').css('background-color', '#34C6BE'); 
                		 $(element).find('.fc-content').css('border', '0px'); 
                		 
                	 }if( this.title.includes("적금")){
                		 $(element).find('.fc-content').css('background-color', '#FF9E9B'); 
                		 $(element).find('.fc-content').css('border', '0px'); 
                	 
                	 }if( this.title.includes("카드")){
           			 	$(element).find('.fc-content').css('background-color', '#FFB400'); 
           		 	 	$(element).find('.fc-content').css('border', '0px'); 

     				}if( this.title.includes("예금")){
           			 	$(element).find('.fc-content').css('background-color', '#FF82FF'); 
           		 	 	$(element).find('.fc-content').css('border', '0px'); 
     				}
                },
                eventClick: function(event) {
                	
    				if(confirm('해당 일정을 삭제하시겠습니까?')) {
    					document.location.href="${ pageContext.request.contextPath }/deleteSchedule/${ adminLoginVO.empno }/" + event.title;
    				}
    				//callback(events);
    				//window.open(event.url, 'gcalevent', 'width=500, height=500');
    				//return false;
    			},
    			 
    			dayClick: function(date, allDay, jsEvent, view) {
    				
    				var check = date.format('YYYY-MM-DD');
                    var today = moment(new Date(), 'DD.MM.YYYY').format('YYYY-MM-DD');
                	
    				if(check < today)
                    {     alert("현재 날짜보다 이전날짜는 예약이 불가합니다.");
                          $('#calendar').fullCalendar('unselect');
                    }else{
    				if(confirm(date.format()+' '+'일정을 등록하시겠습니까?')){
    					$('#reserveDate').val(date.format('YYYY-MM-DD'))
    					 $('#calendar').fullCalendar('unselect');
    					checkTime()
    				 }
                    }
    				
    			    // change the day's background color just for fun
//     			    $(this).css('background-color', 'red');
    			 /*    if($('input[id=reserveDate]').val() == "종일"){
                    	 $(this).css('background-color', 'red');
                     } */
    			  },
    		});
          	
          }
   
       });
     
  };
 
  
  $(document).ready(function() {
   getreservationList();
});
  
function checkTime() {
	
	// 시작 날짜 이전의 날짜는 마감날짜에서 선택 불가능하게끔
	//document.getElementById("reserveDate2").min = $("#reserveDate").val()
	
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
			
			if (disableTime.includes("0")) {
				for (var i = 0; i <= 13; i++) {
					
				$("#reserveTime option[value*='" + i +  "']").prop('disabled',true);
				}
				
			} else {
			
			for ( i in disableTime) {
				console.log("안되는시간 for문 " + disableTime[i])
				$("#reserveTime option[value*='" + disableTime[i] +  "']").prop('disabled',true);
			}
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
		
		let subTime;
		if (registerationTime2 == '종일') {
			subTime = " ";
		 
		} else {
			let a = registerationTime2 .split("-")
			subTime = a[0]
		}
		
		let events;
		
		console.log(registerationDate )
		console.log(subTime )
		console.log(registerationTime )
		console.log( "일시" + registerationDate + " " + subTime )
		
// 		let a = registerationYmd.split('T');
// 		let registeration = a.join(' ');
        var x =	Math.floor(Math.random()*100)+102;
        var consultingNo = x;
        var data;
	 	$.ajax({
			url : '${ pageContext.request.contextPath }/enrollmentByAdmin',
			type : 'post',
			async : false,
			data : {
				consultingNo : consultingNo,
				title : scheduleInfo, 
				registerationDate : registerationDate + " " + subTime, 
				registerationTime : registerationTime,
				empno : '${ adminLoginVO.empno }',
// 				display:'background',
// 				color:'red' 
			}, 
			success : function(){
		    	getreservationList(); //전체 일정리스트 호출
		    	 alert(registerationDate +" "+registerationTime + '에 새로운 일정이 추가 되었습니다.')
		    	// $('#calendar').fullCalendar('renderEvent', data, true);
		    	 //callback(events);
		    	//document.location.href="${ pageContext.request.contextPath }/addConsulting";
		    	 window.location.reload()
		     
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
	<footer id="footer" style="margin-top:200px">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
</body>
</html>