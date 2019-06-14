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

<script>
function passChangeInput() {
	alert("안녕1");
	$('tr:eq(1) td:eq(1)').html('ood');
}
</script>
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
  	<div class="w3-container">
			<h1><b>회원정보</b></h1>
	</div>
		
  	<!-- The Grid -->
  <div class="w3-row-padding">
<!-- Left Column -->
    <div class="w3-col m2">
      <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
          <img src="${pageContext.request.contextPath}/images/main/sampleimg.jpg" style="width: 100%" alt="Avatar">
        </div>
     </div><br>

    <!-- End Left Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-twothird">
      <div class="w3-container w3-card w3-white w3-margin-bottom">
      	<h2 class="w3-text-grey w3-padding-16"><i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>회원정보설정</h2>
        <div class="w3-container">
          <table class="w3-table w3-striped w3-bordered w3-border">
          	<tr>
          		<td>이메일</td><td>변정훈@변정훈.com</td>
          	</tr>
          	<tr>
          		<td>비밀번호</td>
          		<td>●●●●●●●● &nbsp; 
          			<input type="button" class="w3-button w3-dark-grey w3-round-medium" style="padding:5px 10px;" value="변경" onclick="passChangeInput()">
          		</td>
          	</tr>
          	<tr>
          		<td>이름</td><td>변정훈</td>
          	</tr>
          	<tr>
          		<td>성별</td><td>남자</td>
          	</tr>
          	<tr>
          		<td>생년월일</td><td>1992.11.06</td>
          	</tr>
          	<tr>
          		<td>가입일자</td><td>05.18</td>
          	</tr>
          	<tr>
          		<td>탈퇴신청</td>
          		<td><input type="button" class="w3-button w3-dark-grey w3-round-medium" style="padding:5px 10px;" value="탈퇴"></td>
          	</tr>
          </table>
          <br><br>
        </div>
      </div>


    <!-- End Right Column -->
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
