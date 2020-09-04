<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>마이페이지</title>
 <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
 <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
 <link href="/resources/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
 <link href="/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
 <link href="/resources/assets/vendor/venobox/venobox.css" rel="stylesheet">
 <link href="/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
 <link href="/resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
 <link href="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
 <link href="/resources/assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
 <link href="/resources/assets/css/jin.css" rel="stylesheet">
 <link href="/resources/assets/css/style.css" rel="stylesheet"> 
 
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  
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
	<br>
	<div align="center">
	
	












      <!-- 차트  -->
	  <hr width="60%">	
          <h4 class="titles"> <strong>${ loginVO.id }</strong>님의 문의 유형 별 관심도</h4>
      <hr width="60%">
	  <canvas class="my-4" id="myChart" width="900" height="300"></canvas>

	 <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

    <!-- Graphs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script>
      var ctx = document.getElementById("myChart");
      var myChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
          datasets: [{
            data: [15339, 21345, 18483, 24003, 23489, 24092, 12034],
            lineTension: 0,
            backgroundColor: 'transparent',
            borderColor: '#008C8C',
            borderWidth: 4,
            pointBackgroundColor: '#008C8C'
          }]
        },
        options: {
        responsive: false,
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: false
              }
            }]
          },
          legend: {
            display: false,
          }
        }
      });
    </script>

	</div>
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
</body>
</html>