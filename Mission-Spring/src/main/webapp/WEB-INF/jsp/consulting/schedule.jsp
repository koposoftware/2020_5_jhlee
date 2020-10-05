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
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.9.1/lang-all.js"></script>        
 -->     <!--  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.9.1/lang-all.js"></script>
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
	
	

tr:first-child>td>.fc-day-grid-event {
border:0px;

}
div.fc-content{
color:#fff;
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
				<div class="modal-body" style="font-size:16px">
				   * 예약하실 시간을 선택해주세요 ( <strong>30분</strong> 단위로 예약이 가능합니다. ) 
				 <br>* 주말 및 공휴일을 제외한 상담은 <strong style="color:red">AM 9:00-PM 6:00</strong> 까지 가능합니다.  </div> 
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
					<option  value="12">16:30-17:00</option>
					<option  value="13">17:30-18:00</option>
			</select>
				<hr>	 
				<div style="text-align: center; margin-bottom: 1.8rem;">
				<textarea name="textarea" cols="105" rows="4" readonly="readonly" style="padding:12px;">[ 개인정보의 수집 목적 및 이용 목적 ]     
하나은행(이하 “당행”이라 합니다)은 개인정보보호법 제30조에 따라 고객의 개인정보 및 권익을 보호하고 개인정보와 관련한 고객의
고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.

제1조(개인정보의 처리 목적)
당행은 개인정보를 다음 각 호의 목적을 위해 처리합니다. 수집된 개인정보는 다음의 목적 외의 용도로는 사용되지 않으며 이용 목적이
변경될 시에는 사전동의를 구할 예정입니다.
-금융 거래/ 상품 서비스 홍보 및 판매 권유 /금융 기록 관리 

제2조(개인정보의 처리 및 보유 기간)
(금융)거래와 관련한 개인(신용)정보는 수집·이용에 관한 동의일로부터 (금융)거래 종료일로부터 5년까지 위 이용목적을 위하여 보유·이용됩니다.
단, (금융)거래 종료일 이후에는 금융사고 조사, 분쟁 해결, 민원처리, 법령상 의무이행 및 당행의 리스크 관리업무만을 위하여 보유·이용됩니다.
				</textarea>
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
                lang : 'ko',
                selectable: true,
                eventLimit : true,
                events: consultingSchedule,
                allDay: 'true',
                eventRender : function(event, element) {
                	if( this.title.includes("휴가")){
                		    $(element).find('.fc-content').css('background-color', 'red'); 
                		    $(element).find('.fc-content').css('border', '0px'); 
                		    $(element).find('span.fc-time').hide();
                	
                	}if( this.title.includes("대출")){
                		 $(element).find('.fc-content').css('background-color', '#34C6BE'); 
                		 $(element).find('.fc-content').css('border', '0px'); 
                		 $(element).find('span.fc-title').hide();
                		 $(element).find('span.fc-title').append('상담');
                		 
                	 }if( this.title.includes("적금")){
                		 $(element).find('.fc-content').css('background-color', '#FF9E9B'); 
                		 $(element).find('.fc-content').css('border', '0px');
                		 $(element).find('span.fc-title').hide();
                	 
                	 }if( this.title.includes("카드")){
                		
           			 	$(element).find('.fc-content').css('background-color', '#FFB400'); 
           		 	 	$(element).find('.fc-content').css('border', '0px'); 
           			    $(element).find('span.fc-title').hide();

                	 }if( this.title.includes("예금")){
           			 	$(element).find('.fc-content').css('background-color', '#FF82FF'); 
           		 	 	$(element).find('.fc-content').css('border', '0px'); 
           			    $(element).find('span.fc-title').hide();
           			
     				}if( this.title.includes(" ")){
     					$(element).find('span.fc-title').hide();
     				}
                },
                eventContent : consultingSchedule,
                eventClick: function(event) {
                	
    				if(confirm('해당 일정을 삭제하시겠습니까?')) {
    					document.location.href="${ pageContext.request.contextPath }/deleteSchedule/${ adminLoginVO.empno }/" + event.title;
    				}
    			},
    			 
    			dayClick: function(date,allDay,jsEvent, view) {
    				var check = date.format('YYYY-MM-DD');
                    var today = moment(new Date(), 'DD.MM.YYYY').format('YYYY-MM-DD');

    				if(check < today)
                    {     alert("현재 날짜보다 이전날짜는 예약이 불가합니다.");
                          $('#calendar').fullCalendar('unselect');
                    }else{
    				if(confirm(date.format()+' '+'상담 예약을 진행 하시겠습니까?')){
    					$('#reserveDate').val(date.format('YYYY-MM-DD'))
    					 $('#calendar').fullCalendar('unselect');
    					checkTime()
    				 }
                    }
    			  },
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
	
	// 시작 날짜 이전의 날짜는 마감날짜에서 선택 불가능하게끔
	//var today = moment(new Date(), 'DD.MM.YYYY').format('YYYY-MM-DD');
	//$("#reserveDate").val().min = today
	
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
	<footer id="footer" style="margin-top:200px">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
</body>
</html>