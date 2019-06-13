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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsiveslides.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes.css">
<!------------------------ append css ------------------------------>

<!------------------------ append js ------------------------------>
<script src="${pageContext.request.contextPath }/scripts/responsiveslides.min.js"></script>
<!------------------------ append js ------------------------------>

<script>
    // You can also use "$(window).load(function() {"
    $(function () {

      // Slideshow 1
      $("#slider1").responsiveSlides({
        auto: true,
        pager: true,
        nav: true,
        speed: 500,
        maxwidth: 800,
        namespace: "centered-btns"
      });
      
   // Slideshow 2
      $("#slider2").responsiveSlides({
        auto: true,
        pager: true,
        nav: true,
        speed: 500,
        maxwidth: 800,
        namespace: "centered-btns"
      });
      
    });
 </script>
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
	<button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-aqua w3-xlarge w3-left" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  
  	<!------------------------------ 메인 내용 ---------------------------------->
  	
  	<!-- Main-img -->
  	<div class="w3-container main-space">
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
  	 
  	<!-- 베스트 대여 -->
  	<div class="w3-card w3-pale-red center-book-space w3-left w3-padding" >
  		<h3 class="w3-center"  style="margin: 10px 0 0 0"><b>베스트 대여</b></h3>
    	<div class="rslides_container">
      		<ul class="rslides" id="slider1">
        		<li><img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" alt="베스트 대여" class="w3-card"><h4 class="w3-center" style="margin: 0">1위</h4></li>
        		<li><img src="${pageContext.request.contextPath}/images/main/jjangoo.gif" alt="베스트 대여" class="w3-card"><h4 class="w3-center" style="margin: 0">2위</h4></li>
        		<li><img src="${pageContext.request.contextPath}/images/main/jjangoo.gif" alt="베스트 대여" class="w3-card"><h4 class="w3-center" style="margin: 0">3위</h4></li>
      		</ul>
    	</div>
  	</div>
  	
  	<!-- 최신 리뷰 -->
  	<div class="w3-card w3-right w3-sand center-book-space-right w3-center w3-padding">
		<h3 class="w3-center"  style="margin: 10px 0 0 0"><b>최신 리뷰</b></h3>
  		
  		<div class="rslides_container">
      		<ul class="rslides" id="slider2">
        		<li>
        			<div class="w3-left center-book-review-img" style="margin-left: 35px">
        				<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" alt="최신 리뷰" class="w3-card" >
        			</div>
        			<div class="center-book-review">
        				<h4>제목입니다 제목 맞나요?</h4>
        				나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살
        				나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살
        				나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살
        			</div>
        			<h4 class="w3-center w3-clear" style="margin: 0"><a href="#">글보기</a></h4>
        		</li>
        		
        		<li>
        			<div class="w3-left center-book-review-img" style="margin-left: 35px">
        				<img src="${pageContext.request.contextPath}/images/main/jjangoo.gif" alt="최신 리뷰" class="w3-card" >
        			</div>
        			<div class="center-book-review">
        				<h4>제목입니다 제목 맞나요?</h4>
        				나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살
        				나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살
        				나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살
        			</div>
        			<h4 class="w3-center w3-clear" style="margin: 0"><a href="#">글보기</a></h4>
        		</li>
        		
        		<li>
        			<div class="w3-left center-book-review-img" style="margin-left: 35px">
        				<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" alt="최신 리뷰" class="w3-card" >
        			</div>
        			<div class="center-book-review">
        				<h4>제목입니다 제목 맞나요?</h4>
        				나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살
        				나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살
        				나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살나무아미타불 관세음 보살
        			</div>
        			<h4 class="w3-center w3-clear" style="margin: 0"><a href="#">글보기</a></h4>
        		</li>
      		</ul>
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
