<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
ul>a{
font-weight: 500;
text-decoration: none;
color: gray;
}
a:hover {text-decoration:none !important}
ul{
float: right;
}
</style>
</head>
<body>
<div style="margin-top: 0px; height: 40px; background-color: #eeeeee;">
	<ul style="line-height:40px;">
		<a href="index.jsp?main=login/loginform.jsp">로그인</a>&nbsp;&nbsp;&nbsp;
		<a href="index.jsp?main=member/memberform.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;
		<a href="#">마이페이지</a>&nbsp;&nbsp;&nbsp;
		<a href="index.jsp?main=shop/cart.jsp">장바구니</a>&nbsp;&nbsp;&nbsp;&nbsp;
	</ul>
</div>


</body>
</html>