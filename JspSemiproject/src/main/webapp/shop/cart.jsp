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
<br>
<form style="width: 80%; margin: auto;">
	<table class="table table-striped">
		<tr>
			<th><input type="checkbox"></th>
			<th>상품명</th>
			<th>수량</th>
			<th>가격</th>
			<th>배송구분</th>
			<th>배송비</th>
			<th>합계</th>
			<th>선택</th>
		</tr>
		
		<tr>
			<td colspan="10" style="text-align: center; color: lightgray;">장바구니에 담긴 상품이 존재하지 않습니다</td>
		</tr>
		
		<tr>
			<td colspan="10" style="text-align: right; color: gray;">상품 구매금액 0 + 배송비 0 = <b style="color: black;">합계: 0원<b></td>
		</tr>
	</table>
	선택상품을&nbsp;&nbsp;<button class="btn btn-sm"><span class="glyphicon glyphicon-remove"> <b style="margin-top: -10px;">삭제하기</b></span></button>
	<button class="btn btn-danger btn-sm" style="float: right;"><span class="glyphicon glyphicon-shopping-cart"> <b style="color:white; margin-top: -10px;">주문하기</b></span></button>
</form>
</body>
</html>