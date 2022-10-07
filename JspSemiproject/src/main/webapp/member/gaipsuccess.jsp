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
<%
String id=request.getParameter("id");
memberDao dao=new memberDao();
String name=dao.getName(id);
%>
<div style="margin-left: 200px; margin-top: 30px;">
 <b><h3><%=name %>님의 회원가입을 축하합니다</h3></b>
 <br><br>
 <button type="button" class="btn btn-info"
 onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인</button>
  <button type="button" class="btn btn-info"
 onclick="location.href='index.jsp?'">메인화면</button>
</div>
</body>
</html>