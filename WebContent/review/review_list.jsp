<%@page import="vo.book.BookBean"%>
<%@page import="vo.MemberBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");
//  	MemberBean memberBean = (MemberBean)session.getAttribute("memberBean");
 	
 	ArrayList articleList = (ArrayList) request.getAttribute("articleList");
 	ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
 	ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
 	ArrayList<BookBean> bookList = new ArrayList<BookBean>();
 	
 	for (int i = 0 ; i < articleList.size() ; ) {
 		ReviewBean rb = new ReviewBean();
 		MemberBean mb = new MemberBean();
 		BookBean bb = new BookBean();
 		rb = (ReviewBean)articleList.get(i++);
 		mb = (MemberBean)articleList.get(i++);
 		bb = (BookBean)articleList.get(i++);
 		reviewList.add(rb);
 		memberList.add(mb);
 		bookList.add(bb);
 	}

 	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

 	int listCount = pageInfo.getListCount();
 	int nowPage = pageInfo.getPage();
 	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
 	int endPage = pageInfo.getEndPage();
 	
%>    
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/book_list.css">
<!------------------------ append css ------------------------------>

</head>
<body class="w3-light-grey">

<!----------- Sidebar/menu ------------>
<jsp:include page="../inc/sidebar.jsp" />
<!----------- Sidebar/menu ------------>

     
<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main main-start">
	<button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey w3-xlarge w3-left"><i class="fa fa-bars"></i>  Menu</button>
  	
  	<!-- 글쓰기 버튼 -->
  	<button onclick="location.href='reviewWrite.rv'" type="button" class="w3-button w3-teal review-write-pen"><i class="fas fa-pencil-alt"></i></button>
  
  	<!------------------------------ 메인 내용 ---------------------------------->
	<!-- Header -->
  	<header id="portfolio">
    	<div class="w3-container">
    		<h1><b>리뷰 목록</b></h1>
	
			<!----- 도서 검색 input ----->
			<form>
				<select class="category-select">
  					<option value="volvo">Volvo</option>
  					<option value="saab">Saab</option>
  					<option value="mercedes">Mercedes</option>
  					<option value="audi">Audi</option>
				</select>    
    			<input type="text" name="search" placeholder="검색어를 입력해주세요." class="common-search" style="width:70%">
    			<button type="submit" class="common-search-button"><i class="fa fa-search"></i></button>
    		</form>
   			<!----- 도서 검색 input ----->
    
    		<br>
    		<br>
    		<div class="w3-section w3-bottombar w3-padding-16">
      			<span class="w3-margin-right w3-xlarge">카테고리 : </span> 
      			<button class="w3-button w3-black">ALL</button>
      			<button class="w3-button w3-white">프로그래밍</button>
      			<button class="w3-button w3-white">네트워크</button>
      			<button class="w3-button w3-white">서버</button>
      			<button class="w3-button w3-white">웹&디자인</button>
      			<button class="w3-button w3-white">오라클</button>
      			<button class="w3-button w3-white">IT&자격증</button>
      			<button class="w3-button w3-white">자기계발</button>
      			<button class="w3-button w3-white">기타</button>
    		</div>
    	</div>
  </header>
  
   <div class="w3-container">
    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white w3-card book-list-table">
    						<%
								if (articleList != null && listCount > 0) {
							%>
							<%
								for (int i = 0; i < reviewList.size(); i++) {
							%>
      <tr>
        <td>
        	<span class="w3-left w3-xxlarge" style="margin-right: 20px;"><b><%=reviewList.get(i).getNo()%></b></span>
        	<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" class="w3-left" style="margin-left: 5px;">
        	<div>
        		<h4 class="w3-text-teal"><b><a
									href="reviewView.rv?no=<%=reviewList.get(i).getNo()%>&page=<%=nowPage%>"><%=reviewList.get(i).getTitle()%></a></b></h4>
        		<h4 class="review-list-writer"><img src="${pageContext.request.contextPath}/images/main/jjangoo.gif" class="w3-circle" style="width:50px; margin:0">
        			&nbsp;&nbsp;<%=memberList.get(i).getName() %>
        			<span class="w3-opacity">&nbsp;&nbsp;<%=reviewList.get(i).getReg_date()%></span>
        			<span class=review-list-commentlike><i class="far fa-comment-dots"></i>(5)코멘트값 <i class="far fa-thumbs-up"></i>(5)좋아요값</span>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수
        			(<%=reviewList.get(i).getReadcount()%>)
        		</h4>
				<a class="w3-left review-list-content">
					<%=reviewList.get(i).getContent()%>
				</a>
				
				
				
			</div>
      	</td>
      </tr>
      
      						<%
								}
							%>
      
      <tr>
      
    </table><br>
  </div>
  
  	<!-- Pagination -->
  	<div class="w3-center w3-padding-32 w3-xlarge">
    	<div class="w3-bar">
						<%
							if (nowPage <= 1) {
						%>
						 « &nbsp;
						<%
							} else {
						%>
						<a href="reviewList.rv?page=<%=nowPage - 1%>">«</a>&nbsp;
						<%
							}
						%>

						<%
							for (int i = startPage; i <= endPage; i++) {
									if (i == nowPage) {
						%>
						[<%=i%>]
						<%
							} else {
						%>
						<a href="reviewList.rv?page=<%=i%>">[<%=i%>]
						</a>&nbsp;
						<%
							}
						%>
						<%
							}
						%>

						<%
							if (nowPage >= maxPage) {
						%>
						»
						<%
							} else {
						%>
						<a href="reviewList.rv?page=<%=nowPage + 1%>">»</a>
						<%
							}
						%>
					<%
						} else {
					%>
					<section id="emptyArea">등록된 글이 없습니다</section>
					<%
						}
					%>
    	</div>
  	</div>  	
    <!------------------------------ 메인 내용 ---------------------------------->
  
  
  
  	<!--------------- footer ---------------->
	<jsp:include page="../inc/footer.jsp" />
	<!--------------- footer ---------------->
	
 <!-- End page content -->
</div>
</body>
</html>
