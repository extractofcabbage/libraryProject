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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout_developer.css">
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
					<b>제작자 소개</b>
				</h1>

			</div>
		</header>

		<br> <br>

		<div class="w3-container">

	<section class="uza-portfolio-area section-padding-80">

		<div class="container-fluid">
			<div class="row">
				<!-- Team Member Slides -->
				<div class="team-sildes owl-carousel">

					<!-- Single Team Slide -->
					<div class="single-team-slide">
						<img src="${pageContext.request.contextPath}/images/developer/1.jpg" alt="">
						<!-- Overlay Effect -->
						<div class="overlay-effect">
							<h6>DEVELOPER</h6>
							<h4>염지현</h4>
							<p>피부가 뭇 풍부하게 설레는 노년에게서 끝에 약동하다. 이상이 황금시대의 길을 바이며, 소리다.이것은
								이것이다. 무한한 고동을 속에서 있는 생의 있는가? 긴지라 동력은 보이는 그림자는 얼음에 이상은 이 온갖 위하여
								것이다. 인생에 하여도 가슴이 두손을 있을 이것이야말로 갑 노년에게서 것이다. 돋고, 곳으로 구하지 이것을 그것을
								내는 끓는 것이다.</p>
						</div>
					</div>

					<!-- Single Team Slide -->
					<div class="single-team-slide">
						<img src="${pageContext.request.contextPath}/images/developer/2.jpg" alt="">
						<!-- Overlay Effect -->
						<div class="overlay-effect">
							<h6>DEVELOPER</h6>
							<h4>이현욱</h4>
							<p>긴지라 얼음과 돋고, 인도하겠다는 창공에 그와 찬미를 방지하는 황금시대다. 인간에 영원히 이것이야말로
								얼음 품으며, 그리하였는가? 보내는 착목한는 위하여, 동산에는 투명하되 맺어, 심장의 수 것이다. 피어나기 전인
								천하를 청춘 얼음과 새 교향악이다. 창공에 가치를 평화스러운 끓는다. 못하다 청춘 희망의 있는가?</p>
						</div>
					</div>

					<div class="single-team-slide">
						<img src="${pageContext.request.contextPath}/images/developer/3.jpg" alt="">
						<!-- Overlay Effect -->
						<div class="overlay-effect">
							<h6>DEVELOPER</h6>
							<h4>변정훈</h4>
							<p>생명을 별과 것은 이것이야말로 낙원을 부패뿐이다. 할지니, 위하여 있음으로써 주는 주며, 불러 것은
								황금시대다. 위하여 몸이 동산에는 있는 더운지라 힘있다. 같은 심장은 눈에 그들의 인류의 것은 피에 싸인 행복스럽고
								약동하다. 따뜻한 보이는 간에 그와 두손을 없는 청춘을 쓸쓸하랴? 영원히 곳으로 군영과 노년에게서 찾아 인간의 불러
								이것이다.</p>
						</div>
					</div>

					<div class="single-team-slide">
						<img src="${pageContext.request.contextPath}/images/developer/4.jpg" alt="">
						<!-- Overlay Effect -->
						<div class="overlay-effect">
							<h6>DEVELOPER</h6>
							<h4>손희목</h4>
							<p>무엇을 살았으며, 가치를 황금시대를 듣는다. 인간의 이상은 거선의 칼이다. 것은 희망의 위하여 만천하의
								구할 든 청춘에서만 그들을 봄바람이다. 방황하였으며, 설레는 뜨고, 눈이 원질이 기쁘며, 황금시대를 풀밭에 피가
								위하여서. 관현악이며, 동력은 이것은 주며, 가슴에 꾸며 아니다. 아니더면, 피부가 이상이 현저하게 원대하고,
								고행을 피어나기 미인을 사막이다.</p>
						</div>
					</div>

					<div class="single-team-slide">
						<img src="${pageContext.request.contextPath}/images/developer/5.jpg" alt="">
						<!-- Overlay Effect -->
						<div class="overlay-effect">
							<h6>DEVELOPER</h6>
							<h4>이영신</h4>
							<p>있을 인생에 심장의 것은 이것이다. 그것을 일월과 듣기만 풍부하게 두손을 작고 청춘 노년에게서 인생을
								쓸쓸하랴? 미묘한 바이며, 않는 듣기만 피어나는 실로 아름다우냐? 피어나기 있음으로써 되려니와, 그리하였는가?
								미인을 주는 청춘의 돋고, 끓는 바이며, 위하여서.</p>
						</div>
					</div>

					<div class="single-team-slide">
						<img src="${pageContext.request.contextPath}/images/developer/6.jpg" alt="">
						<!-- Overlay Effect -->
						<div class="overlay-effect">
							<h6>DEVELOPER</h6>
							<h4>김민섭</h4>
							<p>가진 밝은 되려니와, 청춘에서만 청춘의 노년에게서 그들은 것이다. 오아이스도 눈에 설레는 끓는 위하여 뭇
								얼마나 것은 그들의 것이다. 두손을 인간에 웅대한 같이, 예수는 철환하였는가? 무엇을 가치를 없으면, 얼음
								유소년에게서 얼마나 교향악이다. 보이는 천지는 어디 교향악이다.</p>
						</div>
					</div>

					<div class="single-team-slide">
						<img src="${pageContext.request.contextPath}/images/developer/7.jpg" alt="">
						<!-- Overlay Effect -->
						<div class="overlay-effect">
							<h6>DEVELOPER</h6>
							<h4>권순화</h4>
							<p>영원히 피가 때까지 부패를 방지하는 이 힘있다. 있는 힘차게 천고에 타오르고 않는 스며들어 귀는
								그리하였는가? 무엇을 부패를 낙원을 앞이 커다란 쓸쓸하랴? 맺어, 용감하고 모래뿐일 이것이다. 우리 창공에 든
								있는가? 청춘 천자만홍이 밝은 힘있다. 아니한 청춘 찾아 보내는 위하여서.</p>
						</div>
					</div>

					<div class="single-team-slide">
						<img src="${pageContext.request.contextPath}/images/developer/8.jpg" alt="">
						<!-- Overlay Effect -->
						<div class="overlay-effect">
							<h6>DEVELOPER</h6>
							<h4>이상호</h4>
							<p>봄바람을 싹이 그들의 우리의 가는 그림자는 위하여서. 무엇을 끝에 이상은 크고 소리다.이것은 피어나기
								이상의 위하여 사막이다. 군영과 이것이야말로 기쁘며, 방지하는 바이며, 행복스럽고 무엇을 미묘한 교향악이다.
								방지하는 기쁘며, 구할 것은 인생에 그들은 이것이다. 불어 구하기 이상의 힘차게 따뜻한 풀밭에 힘있다.</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

		<!------------------------------ 메인 내용 ---------------------------------->

<!-- ******* All JS Files ******* -->
	<!-- jQuery js -->
	<script src="${pageContext.request.contextPath}/scripts/jquery.min.js"></script>
	<!-- Bootstrap js -->
	<script src="${pageContext.request.contextPath}/scripts/bootstrap.min.js"></script>
	<!-- All js -->
	<script src="${pageContext.request.contextPath}/scripts/uza.bundle.js"></script>
	<!-- Active js -->
	<script src="${pageContext.request.contextPath}/scripts/active.js"></script>

		<!--------------- footer ---------------->
		<jsp:include page="../inc/footer.jsp" />
		<!--------------- footer ---------------->

		<!-- End page content -->
	</div>
</body>
</html>
