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
<style>
.btn {
  cursor: pointer;
  display: inline-block;
  width: 100px;
  background: lightgray;
  padding: 15px;
  font-family: Noto Sans KR;
  font-size: 16px;
  border: 0;
  border-radius: 5px;
}
</style>
</head>
<body>
<div style="margin-left: 900px; margin-top: 150px;">
	<%
		String myid=(String)session.getAttribute("myid");
			
		memberDao dao=new memberDao();
		String name=dao.getName(myid);
	%>
	<br><br>
	<h4><%=name %>님 로그인 중</h4>
	<h4>정말 로그아웃 하시겠습니까?</h4><br><br>
	<button type="button" class="btn"
	onclick="location.href='index.jsp?main=login/logoutaction.jsp'">확인</button>
	<button type="button" class="btn"
	onclick="location.href='index.jsp'">취소</button>
</div>
</body>
</html>