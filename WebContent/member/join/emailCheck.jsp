<%@page import="java.sql.Connection"%>
<%@page import="static db.JdbcUtil.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Insert title here</title>
<script type="text/javascript">
	function ok() {

		
		window.close();
		
	}
</script>
</head>
<body>
	<h1>emailCheck.jsp</h1>
	<%
		//String =userEmail파라미터 가져오기
		String email = request.getParameter("email");
	%>
	입력한 email값 :<%=email%><br>
	
	아이디 사용가능 합니다.
	<input type="button" value="아이디사용" onclick="ok()">
	


</body>
</html>