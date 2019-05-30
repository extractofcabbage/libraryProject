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
  <div class="w3-container">
    <h1><b>회원 관리</b></h1>
    <select class="w3-right" style="height: 39px;margin: 10px;font-size: 20px;">
    	<option selected="selected">정렬기준</option>
  		<option value="subject">제목</option>
  		<option value="author">저자</option>
  		<option value="isbn">ISBN</option>
	</select>
    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
      <tr class="w3-black w3-large" style="font-weight: bold;">
      	<td><input class="w3-check" type="checkbox"></td>
      	<td>번호</td>
      	<td>아이디</td>
      	<td>이름</td>
      	<td>성별</td>
      	<td>생년월일</td>
      	<td>전화번호</td>
      	<td>프로필</td>
      	<td>주소1</td>
      	<td>주소2</td>
      	<td>우편번호</td>
      	<td>등급</td>
      	<td>가입날짜</td>
      </tr>
      <tr>
      	<td><input class="w3-check" type="checkbox"></td>
        <td>1</td>
        <td>abcd@efghij.klm</td>
        <td>콩길동</td>
        <td>남</td>
        <td>999999</td>
        <td>011-1100-0101</td>
        <td>http://fdsg@fgdsgsgafdsafewarwrdfdfgd</td>
        <td>주소는 어디를 말하는 거이오 집이 업소</td>
        <td>의식의 흐름에 맡겨 글을 쓰라라라쓰라</td>
        <td>0548451054</td>
        <td>다이아</td>
        <td>2019-05-23</td>
      </tr>
      <tr>
      	<td><input class="w3-check" type="checkbox"></td>
        <td>1</td>
        <td>abcd@efghij.klm</td>
        <td>콩길동</td>
        <td>남</td>
        <td>999999</td>
        <td>011-1100-0101</td>
        <td>http://fdsg@fgdsgsgafdsafewarwrdfdfgd</td>
        <td>주소는 어디를 말하는 거이오 집이 업소</td>
        <td>의식의 흐름에 맡겨 글을 쓰라라라쓰라</td>
        <td>0548451054</td>
        <td>다이아</td>
        <td>2019-05-23</td>
      </tr>
    </table><br>
    <button class="w3-button w3-dark-grey w3-right">무슨버튼? <i class="fa fa-arrow-right"></i></button>
	<select class="w3-right" style="height: 39px;margin-right: 5px;font-size: 20px;">
  		<option value="subject">제목</option>
  		<option value="author">저자</option>
  		<option value="isbn">ISBN</option>
	</select>
  </div>
    <!------------------------------ 메인 내용 ---------------------------------->
  
  
  
  	<!--------------- footer ---------------->
	<jsp:include page="../inc/footer.jsp" />
	<!--------------- footer ---------------->
	
 <!-- End page content -->
</div>
</body>
</html>
