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
	System.out.print("qna_Delete - page attribute : "+request.getAttribute("page"));
	int board_num = Integer.parseInt(request.getParameter("board_num"));
	int nowPage = Integer.parseInt(request.getAttribute("page").toString());
	MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");
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
			</div>
		</header>

		<br> <br>

		<div class="w3-container">

			<form action="qnaDeletePro.bo?board_num=<%=board_num%>&page=<%=nowPage %>"
									name="deleteForm" method="post">
									<input type="hidden" name="page" value="<%=nowPage%>" />
									<table>
										<tr>
											<td><label>로그인 비밀번호 : </label></td>
											<td><input type="password" name="member_pass"></td>
										</tr>
									</table>
									<div id="commentsbtn">
										<input type="submit" value="확인"
											class="btn" /> <input type="button" value="취소"
											onclick="history.back()" class="btn" />
									</div>
								</form>
			<br>
		</div>

		<!------------------------------ 메인 내용 ---------------------------------->



		<!--------------- footer ---------------->
		<jsp:include page="../../inc/footer.jsp" />
		<!--------------- footer ---------------->

		<!-- End page content -->
	</div>
</body>
</html>
