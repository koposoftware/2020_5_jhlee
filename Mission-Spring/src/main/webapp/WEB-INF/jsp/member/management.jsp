<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>실적 관리</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  

</head>
<body>
<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
</header>
<section style="align:center">

   <div class="col-md-8">
                        <div class="card">
                            <div class="card-header d-block">
                                <h4 class="card-title">SKILL BARS </h4>
                                <p class="mb-0 subtitle">add <code>.progress-animated</code> to change the style</p>
                            </div>
                            <div class="card-body">
                                <h6>Photoshop
                                    <span class="pull-right">85%</span>
                                </h6>
                                <div class="progress ">
                                    <div class="progress-bar bg-danger progress-animated" style="width: 85%; height:6px;" role="progressbar">
                                        <span class="sr-only">60% Complete</span>
                                    </div>
                                </div>
                                <h6 class="mt-4">Code editor
                                    <span class="pull-right">90%</span>
                                </h6>
                                <div class="progress">
                                    <div class="progress-bar bg-info progress-animated" style="width: 90%; height:6px;" role="progressbar">
                                        <span class="sr-only">60% Complete</span>
                                    </div>
                                </div>
                                <h6 class="mt-4">Illustrator
                                    <span class="pull-right">65%</span>
                                </h6>
                                <div class="progress">
                                    <div class="progress-bar bg-success progress-animated" style="width: 65%; height:6px;" role="progressbar">
                                        <span class="sr-only">60% Complete</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
</section>
	<br><br><br><br><br><br><br><br>
   <br><br><br><br><br><br><br><br>
   	<br><br><br><br><br><br><br><br>
   <br><br><br><br><br><br><br><br>
	<footer id="footer">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include> 
</body>
</html>