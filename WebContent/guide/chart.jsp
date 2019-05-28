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
<link rel="stylesheet" href="../css/table.css">
<!------------------------ append css ------------------------------>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">

<style>
#backButton {
	border-radius: 4px;
	padding: 8px;
	border: none;
	font-size: 16px;
	background-color: #2eacd1;
	color: white;
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}

.invisible {
	display: none;
}
</style>
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
					<b>ITWILL 도서현황 비율</b>
				</h1>

			</div>
		</header>

		<br> <br>

		<div class="w3-container">
			<div id="chart_div"></div>
			<table
				class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
				<tr>
					<td>프로그래밍</td>
					<td>35.1%</td>
				</tr>
				<tr>
					<td>기타</td>
					<td>15%</td>
				</tr>
				<tr>
					<td>자기계발</td>
					<td>13%</td>
				</tr>
				<tr>
					<td>오라클</td>
					<td>10%</td>
				</tr>
				<tr>
					<td>IT, 자격증</td>
					<td>10%</td>
				</tr>
				<tr>
					<td>서버</td>
					<td>6.3%</td>
				</tr>
				<tr>
					<td>웹.디자인</td>
					<td>6.3%</td>
				</tr>
				<tr>
					<td>네트워크</td>
					<td>6%</td>
				</tr>
			</table>
			
			<div id="chartContainer" style="height: 300px; width: 100%;"></div>
		<button class="btn invisible" id="backButton"> Back</button>
		<script src="https://canvasjs.com/assets/script/jquery-3.3.1.js"></script>
		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		
			<br>
		</div>

		<!------------------------------ 메인 내용 ---------------------------------->

<!-- JAVASCRIPTS -->
	<script src="${pageContext.request.contextPath}/scripts/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/jquery.backtotop.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/jquery.mobilemenu.js"></script>

	<!-- Script for Sidebar, Tabs, Accordions, Progress bars and slideshows -->

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		/* 2019 도서현황  */
		google.charts.load('current', {
			packages : [ 'corechart', 'bar' ]
		});
		google.charts.setOnLoadCallback(drawMultSeries);

		function drawMultSeries() {
			var data = google.visualization.arrayToDataTable([
					[ '도서 카테고리', '2019년' ], [ '프로그래밍', 132 ], [ '기타', 56 ],
					[ '자기계발', 45 ], [ '오라클', 37 ], [ 'IT자격증', 37 ],
					[ '서버', 24 ], [ '웹디자인', 24 ], [ '네트워크', 21 ] ]);

			var options = {
				title : 'ITWILL 아이티윌 부산교육센터 도서 현황',
				chartArea : {
					width : '70%',
					height : '60%'
				},
				hAxis : {
					title : '카테고리 도서 권수',
					minValue : 0
				},
				vAxis : {
					title : '카테고리별 도서종류'
				}
			};

			var chart = new google.visualization.BarChart(document
					.getElementById('chart_div'));
			chart.draw(data, options);
		}

		window.onload = function() {

			var totalVisitors = 883000;
			var visitorsData = {
				"New vs Returning Visitors" : [ {
					click : visitorsChartDrilldownHandler,
					cursor : "pointer",
					explodeOnClick : false,
					innerRadius : "75%",
					legendMarkerType : "square",
					name : "New vs Returning Visitors",
					radius : "100%",
					showInLegend : true,
					startAngle : 90,
					type : "doughnut",
					dataPoints : [ {
						y : 519960,
						name : "New Visitors",
						color : "#E7823A"
					}, {
						y : 363040,
						name : "Returning Visitors",
						color : "#546BC1"
					} ]
				} ],
				"New Visitors" : [ {
					color : "#E7823A",
					name : "New Visitors",
					type : "column",
					dataPoints : [ {
						x : new Date("1 Jan 2019"),
						y : 33000
					}, {
						x : new Date("1 Feb 2019"),
						y : 35960
					}, {
						x : new Date("1 Mar 2019"),
						y : 42160
					}, {
						x : new Date("1 Apr 2019"),
						y : 42240
					}, {
						x : new Date("1 May 2019"),
						y : 43200
					}, {
						x : new Date("1 Jun 2019"),
						y : 40600
					}, {
						x : new Date("1 Jul 2019"),
						y : 42560
					}, {
						x : new Date("1 Aug 2019"),
						y : 44280
					}, {
						x : new Date("1 Sep 2019"),
						y : 44800
					}, {
						x : new Date("1 Oct 2019"),
						y : 48720
					}, {
						x : new Date("1 Nov 2019"),
						y : 50840
					}, {
						x : new Date("1 Dec 2019"),
						y : 51600
					} ]
				} ],
				"Returning Visitors" : [ {
					color : "#546BC1",
					name : "Returning Visitors",
					type : "column",
					dataPoints : [ {
						x : new Date("1 Jan 2019"),
						y : 22000
					}, {
						x : new Date("1 Feb 2019"),
						y : 26040
					}, {
						x : new Date("1 Mar 2019"),
						y : 25840
					}, {
						x : new Date("1 Apr 2019"),
						y : 23760
					}, {
						x : new Date("1 May 2019"),
						y : 28800
					}, {
						x : new Date("1 Jun 2019"),
						y : 29400
					}, {
						x : new Date("1 Jul 2019"),
						y : 33440
					}, {
						x : new Date("1 Aug 2019"),
						y : 37720
					}, {
						x : new Date("1 Sep 2019"),
						y : 35200
					}, {
						x : new Date("1 Oct 2019"),
						y : 35280
					}, {
						x : new Date("1 Nov 2019"),
						y : 31160
					}, {
						x : new Date("1 Dec 2019"),
						y : 34400
					} ]
				} ]
			};

			var newVSReturningVisitorsOptions = {
				animationEnabled : true,
				theme : "light2",
				title : {
					text : "New VS Returning Visitors"
				},
				subtitles : [ {
					text : "Click on Any Segment to Drilldown",
					backgroundColor : "#2eacd1",
					fontSize : 16,
					fontColor : "white",
					padding : 5
				} ],
				legend : {
					fontFamily : "calibri",
					fontSize : 14,
					itemTextFormatter : function(e) {
						return e.dataPoint.name
								+ ": "
								+ Math.round(e.dataPoint.y / totalVisitors
										* 100) + "%";
					}
				},
				data : []
			};

			var visitorsDrilldownedChartOptions = {
				animationEnabled : true,
				theme : "light2",
				axisX : {
					labelFontColor : "#717171",
					lineColor : "#a2a2a2",
					tickColor : "#a2a2a2"
				},
				axisY : {
					gridThickness : 0,
					includeZero : false,
					labelFontColor : "#717171",
					lineColor : "#a2a2a2",
					tickColor : "#a2a2a2",
					lineThickness : 1
				},
				data : []
			};

			var chart = new CanvasJS.Chart("chartContainer",
					newVSReturningVisitorsOptions);
			chart.options.data = visitorsData["New vs Returning Visitors"];
			chart.render();

			function visitorsChartDrilldownHandler(e) {
				chart = new CanvasJS.Chart("chartContainer",
						visitorsDrilldownedChartOptions);
				chart.options.data = visitorsData[e.dataPoint.name];
				chart.options.title = {
					text : e.dataPoint.name
				}
				chart.render();
				$("#backButton").toggleClass("invisible");
			}

			$("#backButton")
					.click(
							function() {
								$(this).toggleClass("invisible");
								chart = new CanvasJS.Chart("chartContainer",
										newVSReturningVisitorsOptions);
								chart.options.data = visitorsData["New vs Returning Visitors"];
								chart.render();
							});

		}

		// Side navigation
		function w3_open() {
			var x = document.getElementById("mySidebar");
			x.style.width = "100%";
			x.style.fontSize = "40px";
			x.style.paddingTop = "10%";
			x.style.display = "block";
		}
		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
		}

		// Tabs
		function openCity(evt, cityName) {
			var i;
			var x = document.getElementsByClassName("city");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			var activebtn = document.getElementsByClassName("testbtn");
			for (i = 0; i < x.length; i++) {
				activebtn[i].className = activebtn[i].className.replace(
						" w3-dark-grey", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " w3-dark-grey";
		}

		var mybtn = document.getElementsByClassName("testbtn")[0];
		mybtn.click();

		// Accordions
		function myAccFunc(id) {
			var x = document.getElementById(id);
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}

		// Slideshows
		var slideIndex = 1;

		function plusDivs(n) {
			slideIndex = slideIndex + n;
			showDivs(slideIndex);
		}

		function showDivs(n) {
			var x = document.getElementsByClassName("mySlides");
			if (n > x.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = x.length
			}
			;
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			x[slideIndex - 1].style.display = "block";
		}

		showDivs(1);

		// Progress Bars
		function move() {
			var elem = document.getElementById("myBar");
			var width = 5;
			var id = setInterval(frame, 10);
			function frame() {
				if (width == 100) {
					clearInterval(id);
				} else {
					width++;
					elem.style.width = width + '%';
					elem.innerHTML = width * 1 + '%';
				}
			}
		}
	</script>

		<!--------------- footer ---------------->
		<jsp:include page="../inc/footer.jsp" />
		<!--------------- footer ---------------->

		<!-- End page content -->
	</div>
</body>
</html>
