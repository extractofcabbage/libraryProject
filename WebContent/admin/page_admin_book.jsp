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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<!------------------------ append css ------------------------------>


</head>
<body class="w3-light-grey">

<!----------- Sidebar/menu ------------>
<jsp:include page="../inc/sidebar.jsp" />
<!----------- Sidebar/menu ------------>

     
<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main main-start-admin">
	<button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey w3-xlarge w3-left" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  
  
  
  	<!------------------------------ 메인 내용 ---------------------------------->
  	<!-- Header -->
  	<header id="portfolio">
    	<div class="w3-container">
    		<h1><b>도서 관리</b></h1>
	
			<!----- 도서 검색 input ----->
			<form>
				<select class="category-select">
  					<option value="subject">제목</option>
  					<option value="author">저자</option>
  					<option value="isbn">ISBN</option>
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
      			<select class="w3-right" style="height: 39px;margin: 10px;font-size: 20px;">
    				<option selected="selected">정렬기준</option>
			  		<option value="subject">제목</option>
  					<option value="author">저자</option>
  					<option value="isbn">ISBN</option>
				</select>
    		</div>
    	</div>
  	</header>
  	
  <div class="w3-container">
    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
      <tr class="w3-black w3-large" style="font-weight: bold;">
      	<td><input class="w3-check" type="checkbox"></td>
      	<td>번호</td>
      	<td>도서명</td>
      	<td>저자</td>
      	<td>출판사</td>
      	<td>출판일</td>
      	<td>isbn</td>
      	<td>상태</td>
      	<td>대출코드</td>
      	<td>바코드</td>
      	<td>등록일</td>
      </tr>
      <tr>
      	<td><input class="w3-check" type="checkbox"></td>
        <td>1</td>
        <td><a onclick="bookpopup()">도서명도서명도서명도서명도서명도서명도서명도서명도서명도서명</a></td>
        <td>김은기, 이진훈, 김은영</td>
        <td>인피니티북스</td>
        <td>2019-09-12</td>
        <td>9788983799067</td>
        <td>대출</td>
        <td>A-006</td>
        <td>9788983799067</td>
        <td>2020-02-31</td>
      </tr>
      <tr>
      	<td><input class="w3-check" type="checkbox"></td>
        <td>1</td>
        <td><a onclick="bookpopup()">Do it! 안드로이드 앱 프로그래밍 (마시멜로.안드로이드 스튜디오 반영판!)</a></td>
        <td>김은기, 이진훈, 김은영</td>
        <td>인피니티북스</td>
        <td>2019-09-12</td>
        <td>9788983799067</td>
        <td>대출</td>
        <td>A-006</td>
        <td>9788983799067</td>
        <td>2020-02-31</td>
      </tr>
    </table><br>
    <button class="w3-button w3-dark-grey w3-right">무슨버튼? <i class="fa fa-arrow-right"></i></button>
	<select class="w3-right" style="height: 39px;margin-right: 5px;font-size: 20px;">
  		<option value="subject">제목</option>
  		<option value="author">저자</option>
  		<option value="isbn">ISBN</option>
	</select>
  </div>
  
   	<!-- Pagination -->
  	<div class="w3-center w3-padding-32 w3-xlarge">
    	<div class="w3-bar">
      		<a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      		<a href="#" class="w3-bar-item w3-black w3-button">1</a>
      		<a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      		<a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      		<a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      		<a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    	</div>
  	</div>  	
  <!------------------------------ 메인 내용 ---------------------------------->
  
<!------------------------------------------  팝업  ------------------------------------------>
     <div id="bookpop" class="modal">
  		<span onclick="document.getElementById('bookpop').style.display='none'" class="close" title="창닫기">&times;</span>
 		<form class="modal-content animate" action="#">
    		<div class="container">
     			<h1>책수정</h1>
      			<hr>
				<table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
					<tr><td>번호</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>도서명</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>저자</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>출판사</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>출판일</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>가격</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>ISBN</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>이미지</td><td><img src="./sample-img/hahaha.gif"></td></tr>
					<tr><td>상태</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>키워드1</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>키워드2</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>키워드3</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>카테고리</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>대출코드</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>바코드</td><td><input type="text" style="width: 90%"></td></tr>
					<tr><td>등록일</td><td><input type="text" style="width: 90%"></td></tr>
				</table>
      			
				
     			<div class="clearfix w3-center">
       		 		<button type="submit" class="join-button admin-book-btn w3-orange">취소</button>
       		 		<button type="submit" class="join-button admin-book-btn w3-red">삭제</button>
       				<button type="button" onclick="document.getElementById('bookpop').style.display='none'" class="join-button admin-book-btn">수정</button>
     		 	</div>
   		 	</div>
  		</form>
	 </div>
<!------------------------------------------   팝업  ------------------------------------------>   
  
  	<!--------------- footer ---------------->
	<jsp:include page="../inc/footer.jsp" />
	<!--------------- footer ---------------->
	
 <!-- End page content -->
</div>
</body>
</html>
