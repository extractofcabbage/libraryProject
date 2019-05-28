<%@page import="vo.BoardBean"%>
<%@page import="vo.MemberBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!------------------- CSS/JS ---------------------->
<jsp:include page="../inc/common-append.jsp" />
<!------------------- CSS/JS ---------------------->

<!------------------------ append css ------------------------------>
<link rel="stylesheet" href="./css/table.css">
<!------------------------ append css ------------------------------>

</head>
<body class="w3-light-grey">

	<!----------- Sidebar/menu ------------>
	<jsp:include page="../inc/sidebar.jsp" />
	<!----------- Sidebar/menu ------------>


	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main main-start">
		<button
			class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey w3-xlarge w3-left"
			onclick="w3_open();">
			<i class="fa fa-bars"></i>  Menu
		</button>



		<!------------------------------ 메인 내용 ---------------------------------->
		<!-- Header -->
		<header id="portfolio">
			<div class="w3-container">
				<h1>
					<b>오시는길</b>
				</h1>

			</div>
		</header>

		<br> <br>

		<div class="w3-container">
<b>
						부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층<br> 기관명 : 아이티윌 부산교육센터<br>
						TEL : 051-803-0909 &nbsp; FAX : 051-803-0979 &nbsp; 이메일 :
						class@itwillbs.co.kr 
					</b>
					<div id="map" style="width: 550px; height: 450px; margin-top: 50px;"></div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94e4a001d8136f6c27ad20e1e520770a"></script>
					<script>
						var lat = '35.158430';
						var lng = '129.062072';
						var container = document.getElementById('map');
						var options = {
							center : new daum.maps.LatLng(lat, lng),
							level : 3
						};

						var map = new daum.maps.Map(container, options);
						var markerPosition = new daum.maps.LatLng(lat, lng);

						// 마커를 생성합니다
						var marker = new daum.maps.Marker({
							position : markerPosition
						});

						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
	
						var iwContent = '<div style="padding:5px;">아이티윌 부산교육센터 <br>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://map.daum.net/link/to/아이티윌 부산교육센터,'+ lat +','+ lng +'" style="color:blue" target="_blank">길찾기</a>&nbsp;<a href="http://map.daum.net/link/map/아이티윌 부산교육센터,'+ lat +','+ lng +'" style="color:blue" target="_blank">크게보기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						iwPosition = new daum.maps.LatLng(lat, lng); //인포윈도우 표시 위치입니다

						// 인포윈도우를 생성합니다
						var infowindow = new daum.maps.InfoWindow({
							position : iwPosition,
							content : iwContent
						});

						// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
						infowindow.open(map, marker);
						
						var mapTypeControl = new daum.maps.MapTypeControl();

						// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
						// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
						map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						var zoomControl = new daum.maps.ZoomControl();
						map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
						
					</script>

			<br>
		</div>

		
		<!------------------------------ 메인 내용 ---------------------------------->

<!-- JAVASCRIPTS -->
	<script src="${pageContext.request.contextPath}/scripts/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/jquery.backtotop.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/jquery.mobilemenu.js"></script>

		<!--------------- footer ---------------->
		<jsp:include page="../inc/footer.jsp" />
		<!--------------- footer ---------------->

		<!-- End page content -->
	</div>
</body>
</html>
