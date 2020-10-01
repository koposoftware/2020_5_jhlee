<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>영업점 찾기</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  
 </head>

  <script src="resources/assets/vendor/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6&libraries=clusterer"></script>
  <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
   /*  .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');} */
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
   /*  .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;} */
 /*    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')} */
    .info .link {color: #5085BB;}
  </style>
  
 <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
/* #placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;} */
#placesList .info .tel {color:#009900;}
/* #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;} */
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

<body class="bg-light">
<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
</header>
<br>
<br>
<br><br><br><br><br>

   <section id="contact" class="contact">
      <div class="container">

        <div class="section-title">
          <h2>영업점 찾기</h2>
          <p></p>
        </div> 
      </div>

       <main class="page-content margin-top-80">
      	
      	<div class="map_wrap" style="width:50%; margin-left:450px">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white" style="height:30%">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="종로구 하나은행" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
    </div>
</main>
 <script>     
 
 var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(37.5664063, 126.9796956), // 지도의 중심좌표 
        level : 5 // 지도의 확대 레벨 
    });
 
 
/*  var imageSrc = '${pageContext.request.contextPath}/resources/assets/img/hana_marker.png', // 마커이미지의 주소입니다    
 
 imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
 imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
   
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
 markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
 position: markerPosition, 
 image: markerImage // 마커이미지 설정 
});
 
//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  
 */
    
    // 마커 클러스터러를 생성합니다 
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    });
 
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    $.get("${ pageContext.request.contextPath }/map/branchLatLng.json", 
    	function(data) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        var markers = $(data.positions).map(function(i, position) {
            return new kakao.maps.Marker({
                position : new kakao.maps.LatLng(position.latitude, position.longtitude)
           
            });
        });
       
        //오버레이 표시 전에 , 지점 목록을 지운다.
        //displayList('clear');
        //마커에 커스텀 오버레이 표시 
        for(var i=0; i< data.positions.length; i++){
        	displayInfo(markers[i], data.positions[i])
        }
        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
        //100px에 마커있으면 마커생성
        clusterer.setGridSize(100);
    });     
  
    
    
   
   //인포메시지 보여주는 함수 
   function displayInfo(infomarker, infodata){
	   $.ajax({
		 url : '${pageContext.request.contextPath}/map/searchBranch/'+infodata.branchNo,   
         type : 'get',
         success : function(data){
        	 var data = JSON.parse(data)
        	 var content = ''
        	 content += '<div class="wrap"style="height:200px">'
        	 content += '   <div class="info" style="height:200px">'
        	 content += '      <div class="title">'
        	 content += data.branchName
        	 content += '          <div class="close" onclick="closeCustomOverlay()" title="닫기"></div>'
        	 content += '          </div>'
        	 content += '          <div class="body" style="height:200px">'
        	 content += '             <div class="desc">'
        	 content += '                <div class="locInfo"><b>(주소)</b><br>'
        	 content += data.loc
        	 content += '                 </div>'
        	 content += '                 <div class="locInfo"><b>(전화번호)</b><br>'
        	 content += data.phoneNumber1 
        	 content += '                <div class="locInfo"><b>| 운영시간 |</b><br>'
        	 content += data.startTime + '―' + data.finishTime
        	 content += '                </div>'
             content += '           </div>'
             content += '                </div>'
             content += '                </div>'
             content += '       <button class="btn btn-outline-info btn-sm mx-auto" onclick=branchDetail(\''+infodata.branchNo+'\')>상세보기</button>'
             content += '            </div>'
             content += '          </div>'
        	 displayOverlay(infomarker, content, data)
         }
	   })
   }
   var clickedOverlay = null;
   function closeCustomOverlay(){
	   if(clickedOverlay != null ){
		   clickedOverlay.setMap(null);
		   clickedOverlay = null;
	   }
   }
   //클릭했을 때 overlay 출력될 수 있도록 클릭이벤트 등록시킴
    function displayOverlay(infomarker, content, data){
	   var customOverlay = new kakao.maps.CustomOverlay({
		   content : content,
		   position: infomarker.getPosition()
	   });
   	  kakao.maps.event.addListener(infomarker, 'click', function(){
   		  if(clickedOverlay != null){
			closeCustomOverlay()
			clickedOverlay = null;
   		  }
   		  customOverlay.setMap(map);
   	  	  customOverlay.setZIndex(3);
   	  	  map.panTo(infomarker.getPosition());
   	  	  clickedOverlay = customOverlay;
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