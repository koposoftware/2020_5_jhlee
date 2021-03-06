<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div id="calendar">
				
				<div class="modal-body">예약하실 시간을 선택해주세요</div>
				<input type="datetime-local" name="date" style="align-self: center ;width: 20rem" value="reserveDate" >
				<hr>	 
				<div style="text-align: center; margin-bottom: 1.8rem;">
					 <input type="submit" id="enrollmentBtn" class="btn btn-primary px-3 ml-4"  value="접수" style="width: 20%;  align:center;">
					 <input type="button" onclick="closeModal()" class="btn btn-primary px-3 ml-4"  value="취소" style="width: 20%;  align:center;">
				</div>
				
				</div>


<!-- var fc2 = null
var mm2 = null
var m_chk1 = 0

var start2 = moment().format('YYYY-MM-DD HH:')+'00'
var end2 = moment().add(2, 'hour').format('YYYY-MM-DD HH:')+'00'

var events2 =[
	{
		title: "일정2",
		start: start2,
		backgroundColor:'#ccc',
		end: end2
	},
]

function open_fc2(){
	fc2 = $('#calendar').fullCalendar({
		defaultView: 'agendaWeek',
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay,listWeek',
		},
		events:events2,
		displayEventEnd: true,
		slotDuration: '01:00:00'
	})
}

$(function(){
	$('#btn2').click(function(){
		mm2 = $('#modal2').modal()
		mm2.on('shown.bs.modal', function () {
			//shown.bs.modal이벤트가 다중으로 발생하는 걸 방지하기 위한 부분
			
			m_chk1++
			if( m_chk1 == 1){
				if(fc2){
					fc2.fullCalendar('rerenderEvents')
					$('#calendar').fullCalendar( 'addEventSource', events2 )
				}
				else {
					open_fc2(events2)
				}
			}
		})
	})
})


function closeModal() {
	$(".modal").modal("hide")
} -->
 
 <script>
  
  $(document).ready(function() {

		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: '2020-09-12',
			businessHours: true, // display business hours
			editable: true,
			events: [
				{
					title: 'Business Lunch',
					start: '2020-09-03T13:00:00',
					constraint: 'businessHours'
				},
				{
					title: 'Meeting',
					start: '2020-09-13T11:00:00',
					constraint: 'availableForMeeting', // defined below
					color: '#257e4a'
				},
				{
					title: 'Conference',
					start: '2020-09-18',
					end: '2020-09-20'
				},
				{
					title: 'Party',
					start: '2020-09-29T20:00:00'
				},

				// areas where "Meeting" must be dropped
				{
					id: 'availableForMeeting',
					start: '2020-09-11T10:00:00',
					end: '2020-09-11T16:00:00',
					rendering: 'background'
				},
				{
					id: 'availableForMeeting',
					start: '2020-09-13T10:00:00',
					end: '2020-09-13T16:00:00',
					rendering: 'background'
				},

				// red areas where no events can be dropped
				{
					start: '2020-09-24',
					end: '2020-09-28',
					overlap: false,
					rendering: 'background',
					color: '#ff9f89'
				},
				{
					start: '2020-09-06',
					end: '2020-09-08',
					overlap: false,
					rendering: 'background',
					color: '#ff9f89'
				},
				 {
                    title : "Click for Google"
                  , url : "http://google.com/"
                  , start : "2020-09-28"
              }
			],
	          dayClick: function() {
	             alert('상담 예약을 진행 하시겠습니까?'); 
	       
	          }
	      
		});
		
	});

 -->
  
 //ajax db연동? 
  
   $(document).ready(function() {
	  displayLoading(true);
	  $.ajax({
	   
	     type : "POST" //"POST", "GET"
	     , url : "/shows/calendarAjax.do" //Request URL
	     , dataType : "json" //전송받을 데이터타입
	                 , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
	     , error : function(request, status, error) {
	     alert("code : " + request.status + "\r\nmessage : " + request.reponseText);
	     }
	     , success : function(data) {
	     setCalendar(data.data);
	     displayLoading(false);
	    }
	   });
	  
	 
	 });
	 
	 function setCalendar( data ){
	  var date = new Date();
	  var d = date.getDate();
	  var m = date.getMonth();
	  var y = date.getFullYear();
	  var jsonData = JSON.stringify(data).replace(/\"/gi,"");
	 
	 
	  
	  $("#calendar a").click(function(){
	   $(this).attr("href","javascript:goDetail('"+$(this).attr("href")+"')");
	  });
	  
	 }
	  

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