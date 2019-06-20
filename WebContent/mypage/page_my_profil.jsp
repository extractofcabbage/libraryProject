<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!------------------- CSS/JS ---------------------->
<jsp:include page="../inc/common-append.jsp" />
<!------------------- CSS/JS ---------------------->

<!------------------------ append css ------------------------------>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<!------------------------ append css ------------------------------>

<script type="text/javascript">

var sel_file;

$(document).ready(function(){
	$("#input_img").on("change", handleImgFileSelect);	
});

function handleImgFileSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f) {
		if(!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#profilImg").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
} 

</script>
</head>
<body style="background-color: #f1f1f1;"> 
	<div class="w3-container w3-center" style="margin-top: 40px">
      	<div class="w3-card w3-round w3-white">
        	<div class="w3-container">
         		<h4 class="w3-center">프로필 사진</h4>
         		<p class="w3-center"><img src="${param.profilImg }" class="w3-circle" style="width:150px;height:150px" alt="Avatar" id="profilImg"></p>
         		<hr>
         		<p class="w3-center"><input type="file" name="image" id="input_img" class="input-file"/></p>
         		<button class="changeBtn chabgeBtn-profil">확인</button>
         		<button class="changeBtn chabgeBtn-profil">취소</button>
        	</div>
      	</div>
      	<br>
	</div>
</body>
</html>