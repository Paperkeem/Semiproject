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
.form-inline {
  position:absolute;
  width:400px;
  height:0px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:20%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}
.btn {
  cursor: pointer;
  display: inline-block;
  width: 200px;
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
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String hp=request.getParameter("hp");

	memberDao dao=new memberDao();
	String id=dao.getid(name, hp);
	%>
	<div style="background-color:white; margin:-12px -0.5% 0px -20px; text-align:center; height:200px; border: 1px solid">
	<br><br><br><h2>아이디 찾기 검색 결과</h2></div>
	
	<% if(id!=null){%>
	<form action="index.jsp?main=login/loginform.jsp" method="post" class="form-inline">
	<h2><div><%=name %></div>님의 아이디는<br>
	<div><%=id %></div>입니다</h2>
	<br><button type="submit" class="btn">로그인 화면으로 돌아가기</button>
	</form>
	<%} 
	else {%>
	<script type="text/javascript">
		alert("등록된 정보가 없습니다.");
		history.back();
	</script>
	<%}%>
</body>
</html>