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

				<div id="calendar">
				
				<div class="modal-body">* 예약하실 시간을 선택해주세요(30분 단위로 예약이 가능합니다.)</div> 
				<%-- <div> 담당자 :${ consulting.name }</div> --%>
				<input type="datetime-local" name="date" style="align-self: center ;width: 20rem" id="reserveDate" >
				<hr>	 
				<div style="text-align: center; margin-bottom: 1.8rem;">
					 <input type="submit" id="enrollmentBtn" class="btn btn-primary px-3 ml-4"  value="접수" style="width: 20%;  align:center;">
					 <input type="button" onclick="close()" class="btn btn-primary px-3 ml-4"  value="취소" style="width: 20%;  align:center;">
				</div>
				
				</div>



 <script>
//CRUD - R
 function getreservationList(){ //댓글 있는 곳 로드시, 댓글 추가 시 댓글리스트가 뜨게끔 
     //ajax통해서 해당 게시물의 댓글리스트를 조회  => <div id="replyList"></div> 조회데이터 업데이트 
 
   $.ajax({
        url : '${ pageContext.request.contextPath }/schedule/${ adminLoginVO.empno }', //관리자 로그인시 adminLoginVO로 바꾸기
        type : 'get',
        //datatype: "json",
        success : function(data){ //db에서 가져와
        
        //$('#enrollmentBtn').empty(); //조회에 있던것 지우기 위해 	추가한것**
        console.log(typeof data)
        console.log(data)
        
        
        let reservationList = JSON.parse(data);
        console.log(reservationList)
        
        var consultingSchedule = [];
        
          $(reservationList).each(function(){
             consultingSchedule.push({
              title : this.title,//(이건 너가 vo에 저장해준 이름으로 일단 임의로 컨설팅타이틀이라고 함)
              start : this.registerationYmd //(얘도 마찬가지로 너가 정한 이름으로 고쳐)
             });
          });
           
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