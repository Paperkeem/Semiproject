<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
div.footer-div{
float: left;
}
</style>
</head>
<body>
<div style="width:100%; height: 150px; background-color: #f8f8f8;">
	<div class="footer-div">
		<img alt="" src="<%=root%>/menu/images/skinlab.png" style="width: 150px; margin-left: 70px;">
	</div>
	<div class="footer-div" style="font-size: 10px; color: ligthgray; margin-top: 55px; margin-left: 50px;">
		(주) 쌍용교육센터<br>
		서울특별시 강남구 역삼동 테헤란로 132 / 사업자 등록번호 : 120-88-99076<br>
		통신판매업신고 : 2017-서울강남-0097 / <span style="text-decoration : underline;">사업자 정보 확인 ></span>
	</div>
	
	<div class="footer-div" style="font-size: 10px; color: ligthgray; margin-top: 55px; margin-left: 250px;">
		<b>개발자정보</b><br>
		권민주 | 김종이 | 노지현 | 안혜원 | 임재윤
	</div>
</div>
</body>
</html>