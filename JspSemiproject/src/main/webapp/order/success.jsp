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
<%
String orderid = request.getParameter("orderid");
memberDao mdao=new memberDao();

//주문 배송 정보 회원 값 가져오기
String myid=(String)session.getAttribute("myid");
String num=mdao.getNum(myid);
%>
</head>
<body>
<section class = "header" style="height: 400px; margin-top: 100px">
      <h2>주문이 성공적으로 완료되었습니다!</h2>
      <br>
      <button type = "button" onclick="location.href='order/orderaction.jsp?orderid=<%=orderid%>&num=<%=num %>&myid=<%=myid%>'"><h5>배송 페이지로 이동하기</h5></button>
 </section>
</body>
</html>