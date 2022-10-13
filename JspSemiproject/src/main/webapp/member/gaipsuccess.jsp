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
<%
String id=request.getParameter("id");
memberDao dao=new memberDao();
String name=dao.getName(id);
%>
<div style="margin-left: 850px; margin-top: 150px;">
 <b><h3><%=name %>님의 회원가입을 축하합니다</h3></b>
 <br><br>
 <button type="button" class="btn"
 onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인</button>
  <button type="button" class="btn"
 onclick="location.href='index.jsp?'">메인화면</button>
</div>
</body>
</html>