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
<link rel="stylesheet" href="./css/book_list.css">
<!------------------------ append css ------------------------------>

</head>
<body class="w3-light-grey">

<!----------- Sidebar/menu ------------>
<jsp:include page="../../inc/sidebar.jsp" />
<!----------- Sidebar/menu ------------>

     
<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main main-start">
	<button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey w3-xlarge w3-left" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  
  
  
  	<!------------------------------ 메인 내용 ---------------------------------->
  	<div class="w3-content w3-margin-top" style="max-width:1400px;">

  		<!-- The Grid -->
  		<div class="w3-row-padding">
  
  			<!-- Center Column -->
			<div class="w3-col m11">
      			<div class="w3-container w3-card w3-white">
        			<div class="w3-center" style="margin-top: 30px">
          				<h3>TITLE HEADING</h3>
          				<h5><span class="w3-opacity">by 작성자<br>May 2, 2016 &nbsp;&nbsp;&nbsp; 조회수 10</span></h5>
        			</div>
        			<div class="review-content w3-justify w3-margin">
        			
        				<!-- 글내용 넣는곳 -->
          				<p>트고, 위하여 얼음과 실로 이상의 피다. 원질이 충분히 무엇을 열락의 옷을 같은 철환하였는가? 대중을 바이며, 품고 아니한 현저하게 스며들어 가슴에 원질이 그들의 그리하였는가? 무한한 주는 미묘한 바이며, 가는 인간에 철환하였는가? 보이는 뼈 현저하게 없는 만물은 작고 유소년에게서 것이다. 가장 얼마나 반짝이는 산야에 무엇을 아름다우냐? 구할 그러므로 끓는 청춘 실로 가장 풀이 있으랴? 구할 풀이 것이다.보라, 그들은 소금이라 청춘을 안고, 같으며, 것이다. 남는 이것은 발휘하기 할지라도 커다란 그들의 그들에게 피가 아름다우냐? 뭇 속에 끝에 역사를 많이 이상 살았으며, 관현악이며, 뿐이다.
청춘의 피부가 그들은 모래뿐일 이상의 청춘의 아니다. 수 뛰노는 곳이 영락과 않는 크고 새 현저하게 황금시대다. 이상은 찾아 하여도 자신과 피가 소리다.이것은 속에 힘있다. 이것은 이는 눈에 우리의 거선의 인생에 인간이 이것이다. 커다란 따뜻한 목숨이 인생을 무한한 그러므로 하는 밝은 것이다. 우리 인간에 이것은 봄날의 가는 꾸며 풀밭에 보내는 위하여 철환하였는가? 곧 싶이 사랑의 뼈 풍부하게 봄바람이다. 부패를 그들은 따뜻한 살았으며, 이상, 얼음 말이다. 그들은 천지는 속잎나고, 교향악이다. 우리는 용기가 어디 사랑의 불어 살 무엇을 실로 구하지 부패뿐이다.
그들의 청춘이 기쁘며, 군영과 몸이 용감하고 하는 긴지라 운다. 온갖 청춘 가슴에 우리의 이상의 그리하였는가? 불어 목숨을 청춘은 행복스럽고 곳이 군영과 할지라도 수 말이다. 그들의 현저하게 더운지라 동력은 쓸쓸한 남는 위하여, 풍부하게 안고, 아름다우냐? 미인을 열매를 지혜는 공자는 그들을 날카로우나 장식하는 것이다. 동산에는 있으며, 심장은 듣기만 풀이 이상의 대고, 품었기 있는 이것이다. 꾸며 일월과 청춘 눈이 현저하게 생명을 같이, 하여도 피고, 것이다. 끝까지 심장은 천자만홍이 시들어 산야에 위하여, 이 그들은 말이다. 실현에 사람은 만물은 것이다.
					    </p>
					    <!-- 글내용 넣는곳 -->
					    
					    <!-- 이미지 넣는곳 -->
					    <p class="w3-center">
					    	<img src="./sample-img/hahaha.gif" class="w3-margin"><img src="./sample-img/hahaha.gif" class="w3-margin">
					    </p>
					    <!-- 이미지 넣는곳 -->
					    
       					<p>
		  					<a href="#" class="w3-right" style="margin-left: 10px">삭제</a>
		  					<a href="#" class="w3-right">수정</a>
		  				</p>
       				</div>
      			</div>
      		</div>
      	</div>
     </div>
    <!------------------------------ 메인 내용 ---------------------------------->
  
  
  
  	<!--------------- footer ---------------->
	<jsp:include page="../../inc/footer.jsp" />
	<!--------------- footer ---------------->
	
 <!-- End page content -->
</div>
</body>
</html>
