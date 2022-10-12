 <%@page import="data.Dto.memberDto"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="data.Dto.qnaDto"%>
<%@page import="data.Dao.qnaDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String myid=(String)session.getAttribute("myid");


String realPath=getServletContext().getRealPath("/shopsave");
System.out.println(realPath);

int uploadSize=1024*1024*3;

MultipartRequest multi=null;

multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
		new DefaultFileRenamePolicy()); 




String content=multi.getParameter("content");
String pass=multi.getParameter("pass");


qnaDto dto=new qnaDto();

dto.setMyid(myid);
dto.setContent(content);
dto.setPass(pass);


qnaDao dao=new qnaDao();
dao.insertQna(dto);

response.sendRedirect("../index.jsp?main=qna/qnalist.jsp");


%>
</body>
</html>