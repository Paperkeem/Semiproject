<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.shopDao"%>
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
div.cart{
width: 15px;
height: 15px;
border-radius: 50%;
background-color: #283C82;
color: white;
z-index: 10;
float: right;
font-weight: bold;
position: relative;
top: 10px;
left: -15px;
text-align: center;
line-height: 15px;
font-size: 0.5em;
}
</style>
<%
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");
memberDao dao=new memberDao();
String name=dao.getName(myid);


// 카트 수량
shopDao sdao=new shopDao();
List<HashMap<String,String>>list=sdao.getCartList(myid);
int cartsize=list.size();
%>
</head>
<body>
<div style="margin-top: 0px; height: 40px; background-color: #eeeeee;">
	<ul style="line-height:40px;">
		<%if(loginok==null){%>
		<a href="index.jsp?main=login/loginform.jsp">로그인</a>&nbsp;&nbsp;&nbsp;		
		<a href="index.jsp?main=member/memberform.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;	
		<%}else{%>
		<a style="font-size: 0.9em;" href="index.jsp?main=order/orderform.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;<%=name%>님 반갑습니다.</a>&nbsp;&nbsp;&nbsp;
		<a href="index.jsp?main=login/logoutform.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;			
		<%}%>
		<a href="index.jsp?main=member/mypage.jsp">마이페이지</a>&nbsp;&nbsp;&nbsp;
		<a href="index.jsp?main=shop/cart.jsp">장바구니<div class="cart"><%=cartsize%></div></a>&nbsp;&nbsp;&nbsp;&nbsp;
		
	</ul>
</div>
</body>
</html>