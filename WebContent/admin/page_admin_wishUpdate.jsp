<%@page import="vo.admin.WishBookBean"%>
<%@page import="java.util.ArrayList"%>
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

     		<div class="container">
     			<h1>희망도서상세정보</h1>
      			<hr>
      			<form action="wishBookManageListUpdatePro.wm" method="post">
				<table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
				<tr>
											<th>도서명</th>
											<th>저자</th>
											<th>출판사</th>
											<th>출판일</th>
											<th>가격</th>
											<th>ISBN</th>
											<th>이미지</th>
											<th>상태</th>
											<th>키워드1</th>
											<th>키워드2</th>
											<th>키워드3</th>
											<th>카테고리</th>

										</tr>
						<%ArrayList wishBookUpdateList=(ArrayList)session.getAttribute("wishBookUpdateList");%>
  					<%for(int i=0; i<wishBookUpdateList.size(); i++){
//   						WishBookBean wishBookBean=new WishBookBean();
//   						WishBookBean=(WishBookBean)wishBookUpdateList.get(i);
							WishBookBean wishBookBean=new WishBookBean();
							wishBookBean=(WishBookBean)wishBookUpdateList.get(i);
							
  						%>
  						
  							<tr>
											<th><%=wishBookBean.getTitle()%></th>
											<th><%=wishBookBean.getAuthor()%></th>
											<th><%=wishBookBean.getPublisher()%></th>
											<th><%=wishBookBean.getPublish_date()%></th>
											<th><%=wishBookBean.getPrice()%></th>
											<th><%=wishBookBean.getIsbn()%></th>
											<th><div style="text-align: center;"><img src="<%=wishBookBean.getImage()%>"></div></th>
											<th><input type="text" name="<%=wishBookBean.getNo()%>status" value="대출가능" readonly="readonly"></th>                                
											<th><input type="text" name="<%=wishBookBean.getNo()%>keyword1"></th>
											<th><input type="text" name="<%=wishBookBean.getNo()%>keyword2"></th>
											<th><input type="text" name="<%=wishBookBean.getNo()%>keyword3"></th>
											<th><select name="<%=wishBookBean.getNo()%>category">
														<option value="A">프로그래밍</option>
														<option  value="B">네트워크</option>
														<option  value="C">서버</option>
														<option  value="D">웹&디자인</option>
														<option  value="E">오라클</option>
														<option  value="F">IT&자격증</option>
														<option  value="G">자기계발</option>
														<option  value="H">기타</option>
											       </select></th>
										</tr>
										<%
										}
										%>
  					
					
				</table>
				<div class="clearfix w3-center">
       				        <input type="submit" value="추가" class="join-button admin-book-btn">
        					<input type="reset" value="취소" class="join-button admin-book-btn w3-orange">
     		 	</div>
				
					</form>
      		</div>

</body>
</html>
