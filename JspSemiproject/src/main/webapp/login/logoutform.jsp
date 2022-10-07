<%@page import="data.Dao.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<div style="margin-left: 100px; margin-top: 50px;">
	<%
			String myid=(String)session.getAttribute("myid");
			
			memberDao dao=new memberDao();
			String name=dao.getName(myid);
	%>
	<br><br>
	<b><%=name %>님 로그인 중</b><br><br><br>
	<button type="button" class="btn btn-danger"
	onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
</div>
</body>
</html>