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
<jsp:include page="../../inc/common-append.jsp" />
<!------------------- CSS/JS ---------------------->

<!------------------------ append css ------------------------------>
<link rel="stylesheet" href="./css/table.css">
<!------------------------ append css ------------------------------>
<!-- 아코디언 자체 css -->
<style>
.accordion_q {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

.accordion_active, .accordion_q:hover {
	background-color: #ccc;
}

.accordion_q:after {
	content: '\002B';
	color: #777;
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.accordion_active:after {
	content: "\2212";
}

.panel_a {
	padding: 0 18px;
	background-color: white;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
}
</style>
<!-- 아코디언 자체 css -->
</head>
<body class="w3-light-grey">

	<!----------- Sidebar/menu ------------>
	<jsp:include page="../../inc/sidebar.jsp" />
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
					<b>FAQ</b>
				</h1>
			</div>
		</header>

		<br> <br>

		<div class="w3-container">

			<button class="accordion_q">소장 자료 현황은 어떻게 되나요?</button>
			<div class="panel_a">
				<p>
					네이버 라이브러리는 크게 매거진/디자인/백과사전과 IT 도서를 보유하고 있습니다.<br>매년 가치 있는 도서를
					선별하여 장서를 더욱 더 확대해 나갈 예정입니다.
				</p>
				<p>&nbsp;</p>
				<p>- 매거진 : &acute;생활/육아&acute;, &acute;패션/미용&acute;,
					&acute;음식/요리&acute;, &acute;자동차/기술/과학/&acute;, &acute;경제/경영&acute;,
					&acute;문화&acute;, &acute;여행/여가&acute;등 7개 카테고리의 잡지 250여 종</p>
				<p>- 디자인 : 건축, 일러스트, 그래픽, 산업디자인, UX, 예술 등의 DESIGN 서적 1만 7천여 권</p>
				<p>- 백과사전 : &lt;두산 세계 대백과사전&gt;등의 &acute;종합백과&acute;와
					&lt;DK대백과&gt; 시리즈 등의 &acute;총서/시리즈&acute;류 1천 3백 여권</p>
				<p>- IT : 인터넷, IT, 프로그래밍, DB 등의 IT 서적 7천여 권</p>
			</div>

			<button class="accordion_q">운영시간은 어떻게 되며, 휴관일은 언제인가요?</button>
			<div class="panel_a">
				<p>- 운영시간 : 평일 09:00 - 19:30 / 주말 10:00 - 19:30</p>
				<p>- 휴관일 : 공휴일, 매월 둘째&넷째 월요일</p>
				<p>&nbsp;</p>
				<p>
					기타 회사에서 임시로 휴관일을 지정할 수 있으며, 공지사항을 통해 안내해드리고 있습니다.<br>휴관일에는 원활한
					도서 이용을 위해 장서 및 시설 점검이 이루어집니다.
				</p>
			</div>

			<button class="accordion_q">도서검색은 어떻게 하나요?</button>
			<div class="panel_a">
				<p>
					네이버 라이브러리 홈페이지(<a href="http://library.navercorp.com/"
						target="_blank">library.navercorp.com</a>)에서 검색하실 수 있습니다.<br>각
					층에 마련된 도서검색 PC를 이용하시면 책의 위치정보를 출력할 수 있어 조금 더 편리하게 이용 가능합니다.
				</p>
			</div>

			<button class="accordion_q">책은 대출할 수 있나요?</button>
			<div class="panel_a">
				<p>
					보다 많은 사람들이 함께 책을 볼 수 있도록 책은 네이버 라이브러리 내에서만 열람할 수 있습니다.<br> 분실로
					인한 불편을 미연에 방지하기 위함이니 양해 부탁드립니다.
				</p>
			</div>

			<button class="accordion_q">복사나 스캔이 가능한가요?</button>
			<div class="panel_a">
				<p>저작권법 보호를 위해 복사 및 스캔서비스는 운영하지 않습니다.</p>
			</div>
			<br>
		</div>


		<!------------------------------ 메인 내용 ---------------------------------->



		<!--------------- footer ---------------->
		<jsp:include page="../../inc/footer.jsp" />
		<!--------------- footer ---------------->

		<!-- 아코디언 스크립트 -->
		<script>
			var acc = document.getElementsByClassName("accordion_q");
			var i;

			for (i = 0; i < acc.length; i++) {
				acc[i].addEventListener("click", function() {
					this.classList.toggle("accordion_active");
					var panel = this.nextElementSibling;
					if (panel.style.maxHeight) {
						panel.style.maxHeight = null;
					} else {
						panel.style.maxHeight = panel.scrollHeight + "px";
					}
				});
			}
		</script>

		<!-- JAVASCRIPTS -->
		<script
			src="${pageContext.request.contextPath}/layout/scripts/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/layout/scripts/jquery.backtotop.js"></script>
		<script
			src="${pageContext.request.contextPath}/layout/scripts/jquery.mobilemenu.js"></script>
		<!-- JAVASCRIPTS -->
		
		<!-- 아코디언 스크립트 -->
		<!-- End page content -->
	</div>
</body>
</html>
