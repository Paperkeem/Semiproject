<%@page import="data.Dao.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
<%
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");
memberDao dao=new memberDao();
String name=dao.getName(myid);
%>
</head>
<body>
<div style="margin-top: 0px; height: 40px; background-color: #eeeeee;">
	<ul style="line-height:40px;">
		<%if(loginok==null){%>
		<a href="index.jsp?main=login/loginform.jsp">로그인</a>&nbsp;&nbsp;&nbsp;		
		<a href="index.jsp?main=member/memberform.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;	
		<%}else{%>
		<span class="glyphicon glyphicon-user"><b style="font-size: 10pt; font-color: gray;"><%=name%>님 반갑습니다.</b></span>&nbsp;	
		<a href="index.jsp?main=login/logoutform.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;			
		<%}%>
		<a href="index.jsp?main=member/mypage.jsp">마이페이지</a>&nbsp;&nbsp;&nbsp;
		<a href="index.jsp?main=shop/cart.jsp">장바구니</a>&nbsp;&nbsp;&nbsp;&nbsp;
	</ul>
</div>
</body>
</html>