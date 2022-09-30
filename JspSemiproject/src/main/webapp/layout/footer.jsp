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
.img-box{
width: 150px;
height: 60px;
overflow: hidden;
}
#banner-img{
width:100%;
height:100%;
object-fit:cover;
}
.footer-div{padding: 10px;}
</style>
</head>
<body>
<div style="width:100%; background-color: #f8f8f8; padding-top: 50px; padding-bottom: 50px;">
	<div class="container">
		<div class="row">
	      <div class="img-box col-md-3 footer-div">
	        <img id="banner-img" src="<%=root%>/menu/images/skinlab.png">
	      </div>
	      
	      <div class="footer-div col-md-6" style="font-size: 10px; color: ligthgray;">
	        (주) 쌍용교육센터<br>
	        서울특별시 강남구 역삼동 테헤란로 132 / 사업자 등록번호 : 120-88-99076<br>
	        통신판매업신고 : 2017-서울강남-0097 / <span style="text-decoration : underline;">사업자 정보 확인 ></span>
	      </div>
	      
	      <div class="footer-div col-md-3" style="font-size: 10px; color: ligthgray;">
	        <b>개발자정보</b><br>
	        권민주 | 김종이 | 노지현 | 안혜원 | 임재윤
	      </div>
		</div>
	</div>
	
</div>
</body>
</html>