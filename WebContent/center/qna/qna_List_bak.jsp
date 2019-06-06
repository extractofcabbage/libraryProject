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
<%
	ArrayList list = (ArrayList) request.getAttribute("articleList");
	ArrayList<BoardBean> articleList1 = (ArrayList) list.get(0);
	ArrayList<MemberBean> articleList2 = (ArrayList) list.get(1);
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	// 	MemberBean memberBean = (MemberBean)request.getAttribute("memberBean");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>
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
					<b>Q&A</b>
				</h1>

				<!----- 도서 검색 input ----->
				<form>
					<select class="category-select">
						<option value="getTitle">제목</option>
						<option value="content">내용</option>
						<option value="name">작성자</option>
					</select> <input type="text" name="search" placeholder="검색어를 입력해주세요."
						class="common-search" style="width: 70%">
					<button type="submit" class="common-search-button"
						style="width: 10%">
						<i class="fa fa-search"></i>
					</button>
				</form>
				<!----- 도서 검색 input ----->
			</div>
		</header>

		<br> <br>

		<div class="w3-container">

			<table
				class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
				<tr class="w3-red w3-large" style="font-weight: bold;">
					<td class="table-num">번호</td>
					<td class="table-title">제목</td>
					<td class="table-writer">작성자</td>
					<td class="table-date">작성일</td>
					<td class="table-count">조회수</td>
				</tr>
				<%
					if (articleList1 != null && listCount > 0) {
						for (int i = 0; i < articleList1.size(); i++) {
				%>
				<tr>
					<td class="table-num"><%=articleList1.get(i).getNo()%></td>
					<td class="table-title">
					<a href="qnaDetail.bo?board_num=<%=articleList1.get(i).getNo()%>&page=<%=nowPage%>"><%=articleList1.get(i).getTitle()%></a></td>
					<td class="table-writer"><%=articleList2.get(i).getName()%></td>
					<td class="table-date"><%=articleList1.get(i).getReg_date()%></td>
					<td class="table-count"><%=articleList1.get(i).getReadcount()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<section>등록된 글이 없습니다.</section>
				<%
					}
				%>
			</table>
			<br>
		</div>

		<!-- Pagination -->
		<div class="w3-center w3-padding-32 w3-xlarge">
			<div class="w3-bar">
			<%if(nowPage <= 1) {%>
			<a class="w3-bar-item w3-button w3-hover-black">«</a>&nbsp;
	<%} else {%>
			<a href="qnaList.bo?page=<%=nowPage - 1%>" class="w3-bar-item w3-button w3-hover-black">«</a>&nbsp;
	<%} %>
	
	<%for(int i = startPage; i <= endPage; i++) { 
			if(i == nowPage) { %>
				<a  class="w3-bar-item w3-black w3-button"><%=i %></a>
		<%} else { %>
				<a class="w3-bar-item w3-button w3-hover-black" href="qnaList.bo?page=<%=i %>"><%=i %></a>&nbsp;
		<%} %>
	<%} %>
	
	<%if(nowPage >= maxPage) { %>
			<a class="w3-bar-item w3-button w3-hover-black">»</a>
	<%} else { %>
			<a class="w3-bar-item w3-button w3-hover-black" href="qnaList.bo?page=<%=nowPage + 1 %>">»</a>
	<%} %>
			</div>
		</div>
		<div id="table_search">
			<form action="#" method="post">
				<input type="text" name="keyword" class="input_box"> 
				<input type="submit" value="search" class="btn"> 
				<input type="button" value="글쓰기" onclick="location.href='qnaWrite.bo'" class="btn">
			</form>
		</div>
		<!------------------------------ 메인 내용 ---------------------------------->



		<!--------------- footer ---------------->
		<jsp:include page="../../inc/footer.jsp" />
		<!--------------- footer ---------------->

		<!-- End page content -->
	</div>
</body>
</html>