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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/write.css">
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
  
  
  	<div class="w3-clear"></div>
  	<!------------------------------ 메인 내용 ---------------------------------->
  	<div class="review-write-container" style="margin-top: 40px">
 		<form class="review-write-animate" action="/action_page.php">
     		<div class="review-write-slideshow-container">

     			<!-- 읽은 책 목록 4개단위로 뜰 수 있도록 구현해주세요~ -->
     			<div class="review-write-mySlides review-write-fade">
     				<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" width="170px" height="240px" class="review-write-img-shake">
  					<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" width="170px" height="240px" class="review-write-img-shake">
  					<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" width="170px" height="240px" class="review-write-img-shake">
  					<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" width="170px" height="240px" class="review-write-img-shake">
				</div>

				<div class="review-write-mySlides review-write-fade">
  					<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" width="170px" height="240px" class="review-write-img-shake">
 			 		<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" width="170px" height="240px" class="review-write-img-shake">
  					<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" width="170px" height="240px" class="review-write-img-shake">
  					<img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" width="170px" height="240px" class="review-write-img-shake">
				</div>

				<div class="review-write-mySlides review-write-fade">
  					<img src="./sample-img/hahaha.gif" width="170px" height="240px" class="review-write-img-shake" >
  					<img src="./sample-img/jjangoo.gif" width="170px" height="240px" class="review-write-img-shake">
  					<img src="./sample-img/hahaha.gif" width="170px" height="240px" class="review-write-img-shake">
  					<img src="./sample-img/jjangoo.gif" width="170px" height="240px" class="review-write-img-shake">
				</div>


				<a class="review-write-prev" onclick="plusSlides(-1)">&#10094;</a>
				<a class="review-write-next" onclick="plusSlides(1)">&#10095;</a>

			</div>
			<br>

			<div style="text-align:center">
  				<span class="review-write-dot" onclick="currentSlide(1)"></span> 
  				<span class="review-write-dot" onclick="currentSlide(2)"></span> 
  				<span class="review-write-dot" onclick="currentSlide(3)"></span> 
			</div>
			
			<div style="text-align: center">리뷰를 쓰실 책을 선택해주세요</div>
     
     		<!-- 글쓰기 시작 -->
    		<input type="text" id="fname" name="firstname" class="review-write-text" placeholder="제목을 입력해주세요.">
	
    		<textarea id="subject" name="subject" class="review-write-text" placeholder="내용을 입력해주세요." style="height: 500px"></textarea>
			
			<input type="file" class="review-write-text">
			
			<div style="text-align: center">
    			<input type="submit" value="글쓰기" class="review-write-btn">
    			<input type="button" value="취소" class="review-write-btn" >
			</div>
  
      		<div class="clearfix"></div>
  		</form>
	</div>


<script>

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("review-write-mySlides");
  var dots = document.getElementsByClassName("review-write-dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace("review-write-active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " review-write-active";
}

</script>
    <!------------------------------ 메인 내용 ---------------------------------->
  
  
  
  	<!--------------- footer ---------------->
	<jsp:include page="../inc/footer.jsp" />
	<!--------------- footer ---------------->
	
 <!-- End page content -->
</div>
</body>
</html>
