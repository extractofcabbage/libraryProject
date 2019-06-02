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
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main main-start">
	<button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey w3-xlarge w3-left" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  
  
  
  	<!------------------------------ 메인 내용 ---------------------------------->
  	<!-- Header -->
	<header>
		<div class="w3-container">
			<h1>
				<b>도서대여방법</b>
			</h1>
		</div>
	</header>
		
  	<div class="w3-row-padding w3-center w3-margin-top">
		<div class="w3-third">
  			<div class="w3-card w3-container w3-white" style="min-height:460px">
  				<h3>Responsive</h3><br>
  				<i class="fa fa-desktop w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
  				<p>Built-in responsiveness</p>
  				<p>Mobile first fluid grid</p>
  				<p>Fits any screen sizes</p>
  				<p>PC Tablet and Mobile</p>
  			</div>
		</div>

		<div class="w3-third">
  			<div class="w3-card w3-container w3-white" style="min-height:460px">
  				<h3>Standard CSS</h3><br>
  				<i class="fa fa-css3 w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
  				<p>Standard CSS only</p>
  				<p>Easy to learn</p>
  				<p>No need for jQuery</p>
  				<p>No JavaScript library</p>
  			</div>
		</div>

		<div class="w3-third">
  			<div class="w3-card w3-container w3-white" style="min-height:460px">
  				<h3>Design</h3><br>
  				<i class="fa fa-diamond w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
  				<p>Paper like design</p>
  				<p>Bold colors and shadows</p>
  				<p>Equal across platforms</p>
  				<p>Equal across devices</p>
  			</div>
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
