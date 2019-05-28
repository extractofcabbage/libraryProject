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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function openSearch() {

		var wish_title = document.wishbookinfo.wish_title.value;

		if (wish_title == "") {
			window.open("wishBookSearchForm.bo?wish_title=#", "post",
					"height = 700, width = 1900");
		} else if (wish_title != "") {
			window.open("wishBookSearchForm.bo?wish_title=" + wish_title,
					"post", "height = 700, width = 1900");
		}
	}

	function searchISBN(isbn) {
		event.preventDefault();
		if (isbn !== undefined && isbn !== "") {
			$
					.ajax({
						url : "https://dapi.kakao.com/v3/search/book",
						headers : {
							'Authorization' : 'KakaoAK 4100fbb20c986e901f35db27dac3f106'
						},
						type : "get",
						data : {
							query : isbn,
							target : 'isbn'
						},
						success : function(result) {
							let data = result.documents[0];
							
							var imageIn = data.thumbnail;
							$("#wish_title").val(data.title);
							$('#wish_authors').val(data.authors);
							$('#wish_publisher').val(data.publisher);
							$('#wish_price').val(data.price);
							$('#wish_image').val(data.thumbnail);
							let date = data.datetime.split('T')[0];
							$('#wish_publish_date').val(date);

							$('#imageView').empty();
							$('#imageView').append("<img src="+imageIn+">");
							
// 							alert(document.wishbookinfo.wish_price.value);
						}
					});
		}
	}
</script>
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
					<b>희망도서 신청</b>
				</h1>
			</div>
		</header>

		<br> <br>

		<div class="w3-container">

			<form action="wishBookSubscriptionPro.bo" method="post"
						name="wishbookinfo">
						<input type="hidden" id="wish_image" name="wish_image">
						<table id="wishbook">
							<tr>
								<th class="n1"><label for="wish_title">도서명</label></th>
								<td><input type="text" name="wish_title" class="input_box"
									required="required" id="wish_title"><input
									type="button" value="검색" name="search" class="btn"
									onclick="openSearch()"></td>

							</tr>
							<tr>
								<th class="n1"><label for="wish_authors">저자</label></th>
								<td><input type="text" name="wish_authors"
									class="input_box" required="required" id="wish_authors"></td>

							</tr>
							<tr>
								<th class="n1"><label for="wish_publisher">출판사</label></th>
								<td><input type="text" name="wish_publisher"
									id="wish_publisher" class="input_box" required="required"></td>

							</tr>
							<tr>
								<th class="n1"><label for="wish_publish_date">출판일자</label></th>
								<td><input type="text" name="wish_publish_date"
									id="wish_publish_date" class="input_box" required="required"/></td>

							</tr>
							<tr>
								<th class="n1"><label for="wish_isbn">ISBN</label></th>
								<td><input type="text" name="wish_isbn" class="input_box"
									required="required" id="wish_isbn" /><input type="button"
									value="isbn으로 가져오기" class="btnisbn"
									onclick="searchISBN($('#wish_isbn').val());"></td>


							</tr>
							<tr>
								<th class="n1"><label for="wish_price">가격</label></th>
								<td><input type="number" name="wish_price" class="input_box"
									id="wish_price" required="required"/></td>
							</tr>
							<tr>
								<th class="imageth"><label for="imageView">이미지</label></th>
								<td id="imageView"></td>
							</tr>
						</table>
						<div id="table_search">
							<input type="submit" value="등록" class="btn"> <input
								type="reset" value="다시쓰기" class="btn">
						</div>
					</form>
			<br>
		</div>

		
		<!------------------------------ 메인 내용 ---------------------------------->

	<!-- JAVASCRIPTS -->
	<script
		src="${pageContext.request.contextPath}/layout/scripts/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/layout/scripts/jquery.backtotop.js"></script>
	<script
		src="${pageContext.request.contextPath}/layout/scripts/jquery.mobilemenu.js"></script>

		<!--------------- footer ---------------->
		<jsp:include page="../../inc/footer.jsp" />
		<!--------------- footer ---------------->

		<!-- End page content -->
	</div>
</body>
</html>
