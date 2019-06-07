<%@page import="vo.admin.WishBookJoinBean"%>
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
				<table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
				<tr><td>번호</td>
					<td>도서명</td>
					<td>저자</td>
					<td>출판사</td>
					<td>출판일</td>
					<td>가격</td>
					<td>ISBN</td>
					<td>이미지</td>
					<td>상태</td>
					<td>등록일</td>
					<td>신청자</td>
					</tr>
					<%ArrayList wishBookList=(ArrayList)session.getAttribute("wishBookDetailList");%>
  					<%for(int i=0; i<wishBookList.size(); i++){
  						WishBookJoinBean wishBookJoinBean=new WishBookJoinBean();
  						wishBookJoinBean=(WishBookJoinBean)wishBookList.get(i);
  						%>
  						<tr>
											<th><%=wishBookJoinBean.getNo()%></th>
											<th><%=wishBookJoinBean.getTitle()%></th>
											<th><%=wishBookJoinBean.getAuthor()%></th>
											<th><%=wishBookJoinBean.getPublisher()%></th>
											<th><%=wishBookJoinBean.getPublish_date()%></th>
											<th><%=wishBookJoinBean.getPrice()%></th>
											<th><%=wishBookJoinBean.getIsbn()%></th>
											<td><div style="text-align: center;"><img src="<%=wishBookJoinBean.getImage() %>"></div></td>
											<th><%=wishBookJoinBean.getStatus()%></th>
											<th><%=wishBookJoinBean.getReg_date()%></th>
											<th><%=wishBookJoinBean.getEmail()%></th>
										</tr>
										<%
										}
										%>
  					
					
				</table>
      		</div>

</body>
</html>
