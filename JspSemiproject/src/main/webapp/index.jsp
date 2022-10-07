<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
body *{font-family: "Noto Sans KR"}
div.layout{
	border: 0px solid gray;
	position: absolute;
}
div.title{
	width: 100%;
	height: 40px;
}
div.menu{
	width: 100%;
	height: 80px;
	top: 40px;
}
div.main{
	width: 100%;
	top: 120px;
	height: 1700px;
}
div.footer{
	width: 100%;
	top: 1820px;
}

</style>
</head>
<%
String root=request.getContextPath();
String mainPage="layout/main.jsp";
//url을 통해서 main값을 읽어서 메인 페이지에 출력
if(request.getParameter("main")!=null){
	mainPage=request.getParameter("main");
}
%>
<body>

<div class="layout title">
	<jsp:include page="layout/title.jsp"></jsp:include>
</div>

<div class="layout menu">
	<jsp:include page="layout/menu.jsp"></jsp:include>
</div>

<div class="layout main">
	<jsp:include page="<%=mainPage %>"></jsp:include>
</div>

<div class="layout footer">
	<jsp:include page="layout/footer.jsp"></jsp:include>
</div>

</body>
</html>