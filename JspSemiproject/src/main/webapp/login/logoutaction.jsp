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
<script type="text/javascript">
alert("로그아웃 되었습니다.");
location.href='index.jsp?main=login/loginform.jsp';
</script>
<%
session.removeAttribute("loginok");
response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
%>
</body>
</html>