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
<%
//자체테스트용 아이디설정
// 	String email = "like2hyun@naver.com";
// 	int no = 11;
// 	session.setAttribute("email", email);
// 	session.setAttribute("memberNo",no);

%>
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
  	
  	<!-- Main-img -->
  	<div class="w3-container main-space">
   		<button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey w3-xlarge w3-left" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
    	<img src="${pageContext.request.contextPath}/images/main/library.jpg" alt="mainimg" class="main-img w3-left w3-card">
    	<div class="top-left-text"><span style="font-size: 20px;">짱구의 원픽...</span><br>부산 아이티윌 도서관<br>빠른 검색은 요기요 <i class="fa fa-hand-o-down"></i></div>
 		<div class="bottom-left-search">
 			<input type="text" name="search" placeholder="검색어를 입력해주세요."><button><i class="fa fa-search"></i></button>
 		</div>
  		<div class="bottom-right-text"><b>이것이 부산<br>아이티윌 도서관!</b></div>
    		<img src="${pageContext.request.contextPath}/images/main/poongseong.png" class="bottom-right-img">
    		<img src="${pageContext.request.contextPath}/images/main/jjangoo.gif" class="bottom-right-img2">
  		</div>
  	<!-- Main-img -->
  	
  	<br>
  	
  	 <!-- center -->  
  	<div class="w3-card w3-white center-book-space w3-left">
  		<h1 class="best-subject"><b>베스트 대여!</b></h1>
  		<div class="best-book">
  			<div class="w3-card w3-margin w3-margin-top w3-left" style="width:100%">
  				<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" style="width:100%">
    			<div class="w3-container w3-blue">
     				<h2 class="w3-center"><b>1위</b></h2>
    			</div>
  			</div>
  		</div>
    	
  		<div class="best-book">
  			<div class="w3-card w3-margin w3-margin-top w3-left" style="width:100%">
  				<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" style="width:100%">
    			<div class="w3-container w3-blue">
     				<h2 class="w3-center"><b>2위</b></h2>
    			</div>
  			</div>
  		</div>
    		
  		<div class="best-book">
  			<div class="w3-card w3-margin w3-margin-top w3-left" style="width:100%">
  				<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" style="width:100%">
    			<div class="w3-container w3-blue">
     				<h2 class="w3-center"><b>3위</b></h2>
    			</div>
  			</div>
  		</div>
    	
  		<div class="best-book">
  			<div class="w3-card w3-margin w3-margin-top w3-left" style="width:100%">
  				<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" style="width:100%">
    			<div class="w3-container w3-blue">
     				<h2 class="w3-center"><b>4위</b></h2>
    			</div>
  			</div>
  		</div>
  	</div>
  	
  	<div class="w3-card w3-right w3-white center-book-space-small w3-center">
  	</div>
  	
    <!------------------------------ 메인 내용 ---------------------------------->
  
  
  
  	<!--------------- footer ---------------->
	<jsp:include page="../inc/footer.jsp" />
	<!--------------- footer ---------------->
	
 <!-- End page content -->
</div>
</body>
</html>
