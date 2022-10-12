<%@page import="data.Dao.memberDao"%>
<%@page import="data.Dto.memberDto"%>
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
request.setCharacterEncoding("utf-8");

String name=request.getParameter("name");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String hp=request.getParameter("hp");
String type=request.getParameter("type");
String gomin=request.getParameter("gomin");

memberDto dto=new memberDto();
dto.setName(name);
dto.setId(id);
dto.setPass(pass);
dto.setHp(hp);
dto.setType(type);
dto.setGomin(gomin);

memberDao dao=new memberDao();
dao.insertMember(dto);

response.sendRedirect("../index.jsp?main=member/gaipsuccess.jsp?id="+id);
%>
</body>
</html>