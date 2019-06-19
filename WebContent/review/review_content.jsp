<%@page import="vo.ReviewBean"%>
<%@page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	ReviewBean reviewBean = (ReviewBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/star-rating.css">
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
	<button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey w3-xlarge w3-left" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  
  
  
  	<!------------------------------ 메인 내용 ---------------------------------->
<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;">

  <!-- The Grid -->
  <div class="w3-row-padding">
  
    <!-- Left Column -->
    <div class="w3-col m2" style="max-width: 334px;">
    
      <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
          <img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" style="width: 99%;" >
        </div>
      </div><br>

    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
    <div class="w3-col m9" style="margin-bottom: 10px;">
    
      <div class="w3-container w3-card w3-white w3-margin-bottom  book-content" style="height: 282px">
        <h4 class="w3-text-grey"><i class="fa fa-bookmark fa-fw w3-margin-right w3-large w3-text-teal"></i>제목입니당 너어어무 긴 제목입니당  </h4>
        <div class="w3-container">
          <p class="w3-large"><b class="w3-opacity">저자 : </b></p>
          <p class="w3-large"><b class="w3-opacity">출판사 : </b>변정훈 오퍼레이션 컴퍼니</p>
          <p class="w3-large"><b class="w3-opacity">출판일 : </b>1999년 99월 99일</p>
          <p class="w3-large"><b class="w3-opacity">카테고리 : </b>자바 / 프로그래밍</p>
          <p class="w3-large"><b class="w3-opacity">평점 : </b>
          		<i class="far fa-star w3-text-orange"></i>
      			<i class="fa fa-star w3-text-orange"></i>
      			<i class="fa fa-star w3-text-orange"></i>
      			<i class="fa fa-star w3-text-orange"></i>
      			<i class="fas fa-star-half-alt w3-text-orange"></i>(평점 : 9) </p>
      			<hr>
        </div>
      </div>
     </div>
	
	<!-- Center Column -->
	<div class="w3-col m11">
      <div class="w3-container w3-card w3-white">
        <div class="w3-center" style="margin-top: 30px">
          <h3><%=reviewBean.getTitle() %></h3>
          <h5><span class="w3-opacity">by<%=reviewBean.getWriter() %><br><%=reviewBean.getReg_date() %> &nbsp;&nbsp;&nbsp;  <%=reviewBean.getReadcount() %></span></h5>
        </div>
        <div class="review-content w3-justify w3-margin">
        
        	<!-- 글내용 넣는곳 -->
          	<p>
          	<%=reviewBean.getContent() %>
		   	</p>
		   	<!-- 글내용 넣는곳 -->
					    
		  	<!-- 이미지 넣는곳 -->
		   	<p class="w3-center">
		   	</p>
		  <!-- 이미지 넣는곳 -->
		  
		  <p class="w3-center"><button class="w3-button w3-white w3-border" onclick="likeFunction(this)" value="unlike"><b><i class="fa fa-thumbs-up"></i> Like</b></button>
		  	<a href="#" class="w3-right" style="margin-left: 10px">삭제</a>
		  	<a href="#" class="w3-right">수정</a>
		  </p>
        </div>
        
        <div class="w3-margin review-content">
         	<hr>
        	<p><span class="w3-padding-small"><b>Comments  </b> <span class="w3-badge">2</span></span></p>
       		<br>
        	<textarea class="w3-input w3-border book-comment-input" placeholder="내용을 입력해주세요."></textarea>
        	<span><button class="w3-button w3-padding-large w3-white w3-border w3-large" style="vertical-align: top; height: 79px"><b>등록</b></button></span>
        
        	<!-------------------------------- 댓글 -------------------------------------->
        	<div class="w3-row">
        		<hr>
      			<div class="w3-col m2 text-center">
        			<img class="w3-circle" src="${pageContext.request.contextPath}/images/main/jjangoo.gif" style="width:96px;height:96px">
      			</div>
      			<div class="w3-col m10 w3-container">
        			<h4>하하맨하하맨하하맨하하맨하하맨하하맨하하맨하하맨하하맨하하맨 
        				<span class="w3-opacity w3-medium">Sep 29, 2014, 9:12 PM &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">수정</a> <a href="#">삭제</a></span>
 					</h4>
        			<p>니가 책을 읽는다공? 하하하하하하핳하하하핳하하</p><br>
      			</div>
    		</div>
      		<!-------------------------------- 댓글 ---------------------------------------->
      
      		<!-------------------------------- 댓글 -------------------------------------->
        	<div class="w3-row">
        		<hr>
      			<div class="w3-col m2 text-center">
        			<img class="w3-circle" src="${pageContext.request.contextPath}/images/main/jjangoo.gif" style="width:96px;height:96px">
      			</div>
      			<div class="w3-col m10 w3-container">
       				<h4>하하맨하하맨하하맨하하맨하하맨하하맨하하맨하하맨하하맨하하맨 
        				<span class="w3-opacity w3-medium">Sep 29, 2014, 9:12 PM &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">수정</a> <a href="#">삭제</a></span>
 					</h4>
        			<p>니가 책을 읽는다공? 하하하하하하핳하하하핳하하</p><br>
      			</div>
    		</div>
      		<!-------------------------------- 댓글 ---------------------------------------->
    	</div>
    
      </div>
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
  <!-- End Page Container -->
</div>  	
    <!------------------------------ 메인 내용 ---------------------------------->
  
  
  
  	<!--------------- footer ---------------->
	<jsp:include page="../inc/footer.jsp" />
	<!--------------- footer ---------------->
	
 <!-- End page content -->
</div>
</body>
</html>
