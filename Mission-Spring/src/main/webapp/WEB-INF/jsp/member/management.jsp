<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>실적 관리</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  


<style>

/* .chartjs-render-monitor {

style="width:600px!important";
style="height:600px!important";
} */
</style>

</head>
<body>
<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
</header>
<section style="align:center; margin-bottom:100px">
  		<div class="section-title" style="margin-top:170px; margin-bottom:0px"> 
          <h2>실적 관리</h2>
        </div>

<br><br><br><br><br><br><br>
 	<div align="center" class="d-flex m-3" style="margin-left:150px!important">
	<canvas  id="myChart" width="500" height="500"></canvas> &nbsp;&nbsp;&nbsp;&nbsp;
	<canvas  id="myChart2" width="500" height="500"></canvas>  &nbsp;&nbsp;&nbsp;&nbsp;
	<canvas id="horizontalBar"  width="500" height="500"></canvas>  
	
</div>
</section>
	
 
<script> 
    var mainList = new Array(); //data배열 틀을 만들어줌 빈리스트에
    
    <c:forEach items="${chart}" var="chart">  // 반복돌면서 값을 push 리스트에 값을 넣어줌 
     var a = ${chart.consultingNo};
     mainList.push(a);
     </c:forEach>
     console.log(mainList)
    
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: { //x축여러개 일경우엔 parsing해서 넣는다. x축 경우의수에 따라서, 무조건 고정이면 박아주기 
			labels: ['금융상품', '금융경험', '기타'],
			datasets: [{
				label: '대분류별 상담 문의 건수',
				data: mainList,  //y축 값을 나타냄 
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
	

	//두번째 차트 
	var ctx = document.getElementById('myChart2');
	var myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
			datasets: [{
				label: '최근 상담 건수(일주일 내)',
				data: [12, 19, 3, 5, 2, 3],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 2
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
 
	
	//세번째 차트 
	 new Chart(document.getElementById("horizontalBar"), {
	"type": "horizontalBar",
	"data": {
	"labels": ["예금", "적금", "대출", "카드", "보험", "펀드", "외환", "연금","기타"],
	"datasets": [{
	"label": "금융상품 별 상담 문의 건수",
	"data": [22, 33, 55, 12, 86, 23, 14],
	"fill": false,
	"backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
	"rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)",
	"rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"
	],
	"borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)",
	"rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)"
	],
	"borderWidth": 1
	}]
	},
	"options": {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
		});
	
	//네번째 차트

</script>

	<footer id="footer" style="margin-top:200px">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include> 
</body>
</html>