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
		<header>
			<div class="w3-container">
				<h1>
					<b>도서대여순서</b>
				</h1>
			</div>
		</header>

		<br> <br>

		<div class="w3-container">

			<img alt="howTo" src="images/howto.png"> <!-- Modal -->
		<div id="id01" class="w3-modal">
			<div class="w3-modal-content w3-card-4 w3-animate-top">
				<header class="w3-container w3-theme-l1">
					<span
						onclick="document.getElementById('id01').style.display='none'"
						class="w3-button w3-display-topright">×</span>
					<h4>도서대여 이용안내</h4>
					<h5>
						내용 <i class="fa fa-smile-o"></i>
					</h5>
				</header>
				<div class="w3-padding">
					<p>대여권수: 2권, 2주간</p>
					<p>대여/반납: 대여일- 매주 수요일, 금요일 오후 5:30분 접수처
					<p>
						<i class="fa fa-smile-o"></i> 조퇴 시: 사전수령/<i class="fa fa-smile-o"></i>
						결석 시: 익일 수령
					</p>
					<p>
						<i class="fa fa-smile-o"></i> 도서사이트에서 도서 목록 확인 후
						(http://libweb.itwills.co.kr/libweb/opac/index.php) 매주 수요일, 금요일
						12:00까지 접수처에서 도서 신청서를 작성하셔야 합니다. (첫 대여시 신규회원 등록서 작성)
					<p>
						<i class="fa fa-smile-o"></i> 대여/반납은 본인이 도서신청서에 직접 작성합니다. (단, 반납은
						대리반납이 가능합니다.)
					</p>
					<p>재 대여: 동일한 도서는 반납 3일 경과 후 재 대여 가능합니다.</p>
					<p>연장: 대여기간은 2주간으로 연장할 수 없습니다.</p>
					<p>연체: 연체일수 만큼 도서 대여 불가능합니다.</p>
					<p>분실 및 훼손: 동일 도서 또는 동일 CD로 현물변상 또는 시가에 상당하는 금액으로 변상해야 합니다.</p>
				</div>
				<footer class="w3-container w3-theme-l1">
					<p>ITWILL 아이티윌부산교육센터</p>
				</footer>
			</div>
		</div>

		<div class="w3-row-padding w3-center w3-margin-top">
			<div class="w3-third">
				<div class="w3-card w3-container" style="min-height: 460px">
					<h3>도서 검색</h3>
					<i class="fa fa-desktop w3-margin-bottom w3-text-theme"
						style="font-size: 120px"></i>

					<table>
						<tr>
							<th>1. 도서검색은 키워드, 제목, 저자, 주제, 청구번호로 검색이 가능합니다</th>
						</tr>
						<tr>
							<th>2. 전체도서 검색 시 키워드 없이 검색 누를 시 전체도서 검색이 가능합니다.</th>
						</tr>
						<tr>
							<th>3. 연도별로 최신도서 검색이 가능합니다.</th>
						</tr>
					</table>

				</div>
			</div>

			<div class="w3-third">
				<div class="w3-card w3-container" style="min-height: 460px">
					<h3>대여 및 반납</h3>
					<i class="fa fa-css3 w3-margin-bottom w3-text-theme"
						style="font-size: 120px"></i>
					<table border="1">
						<tr>
							<th>1. 대여일은 매주 수요일, 금요일 오후 5:30pm 10층 접수처에서 가능합니다. 따라서 매주
								수요일, 금요일 12:00pm 까지 접수처에서 도서대여신청서를 작성하셔야 합니다.<br> <br>
								※ 조퇴 시 : 사전수령 / ※결석 시 : 익일 수령(익일 수령시에도 도서대여일은 수or금요일로 처리됩니다.)
							</th>
						</tr>
						<tr>
							<th>2. 대여/반납은 본인이 도서대여신청서에 직접 작성 합니다.(단, 반납은 대리반납이 가능합니다.)<br>
								<br> ※ 신규회원(첫 도서대여)의 경우 신규회원등록서를 작성하셔야 합니다.
							</th>
						</tr>
					</table>
				</div>
			</div>

			<div class="w3-third">
				<div class="w3-card w3-container" style="min-height: 460px">
					<h3>규정</h3>
					<i class="fa fa-diamond w3-margin-bottom w3-text-theme"
						style="font-size: 120px"></i>
					<table border="1">
						<tr>
							<th>1. 대여권수 : 2주간 2권<br> <br> 재대여 : 동일한 도서는 반납 3일
								경과 후 재대여 가능<br> <br> 연장 : 대여기간은 2주간으로 연장 불가<br> <br>
								연체 : 연체일수만큼 도서대여 불가<br> <br>
							</th>
						</tr>
						<tr>
							<th>2.분실 및 훼손 : 동일도서 또는 동일CD로 현물변상 또는 시가에 상당하는 금액으로 변상해야
								합니다.</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
		</main>
			<br>
		</div>

		<!------------------------------ 메인 내용 ---------------------------------->



		<!--------------- footer ---------------->
		<jsp:include page="../inc/footer.jsp" />
		<!--------------- footer ---------------->

		<!-- End page content -->
	</div>
</body>
</html>
