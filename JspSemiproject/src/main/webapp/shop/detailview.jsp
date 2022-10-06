<%@page import="java.text.DecimalFormat"%>
<%@page import="data.Dto.shopDto"%>
<%@page import="data.Dao.shopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
body * {
font-family: "Noto Sans KR";
color: black;
}
/* 헤더 페이지 네이션 스타일 */
.location .intag{

float:left;
color:gray;

}
div.intag *{
color:gray;
font-size: 9pt;
}
div.inner{
padding-bottom: 10px;
}

#menu1,#menu2{

width:60px;
background :none;
border: 0;
padding :0;
padding-bottom: 2px;
}

/* 상품 설명 박스 스타일 */
.star{color: lightgray;}

.photo-wrap{
border: 0px solid gray;
}
.sanpumImage{
width: 300px;
display : block;
margin : auto;
}
.border-box{
border-bottom: 1px solid lightgray; 
padding-top: 20px; 
padding-bottom: 20px;
font-weight: 500;
}
.full-border-box{
border: 1px solid lightgray; 
padding: 10px 20px 10px 20px; 
font-weight: 500;
}
#plus, #minus{
cursor: pointer;
}
.btn-like, .btn-order, .btn-cart{
height: 60px;
}

</style>
</head>
<%
String shopnum = request.getParameter("shopnum");
String num = "1";
shopDao dao = new shopDao();
shopDto dto = dao.getData(shopnum);

int price = Integer.parseInt(dto.getPrice());
DecimalFormat df = new DecimalFormat("###,###");

%>
<body>
<hr style="width: 90%; margin: auto;">
<br>
<div class="container">
	<!-- 페이지 탭 -->
	<div class="location">
		<div class="inner">
			<div class="intag">
				<a href="index.jsp">홈</a> &nbsp;>&nbsp;
				</div>
				<div class="dropdown intag">
	    	<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">카테고리
	    	<span class="caret"></span></button>&nbsp;>
	   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu1" >
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/shoplist.jsp">스킨케어&클렌징</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/shoplist.jsp">페이스메이크업</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/shoplist.jsp">바디&헤어케어</a></li>
	      		<li role="presentation" class="divider"></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp">피부고민</a></li>
	    	</ul>
	  		</div>
	  		<div class="dropdown intag">
	  		<button class="btn btn-default dropdown-toggle" type="button" id="menu2" data-toggle="dropdown">고민별
	    	<span class="caret"></span></button>
	   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu2">
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=1">모공</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=2">피부결</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=3">주름</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=4">탄력</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=5">트러블</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=6">각질</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=7">민감성</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=8">피지과다</a></li>
	    	</ul>
	  		</div>
		</div> 
  	</div>
  	
  	<br>

	<!-- 상품 설명 섹션 -->
	<div class="row">
		
		<!-- 이미지 박스 -->
		<div class="col-md-6 photo-wrap">
			<img class="sanpumImage" src="shopsave/<%=dto.getPhoto()%>">
		</div>
		
		<!-- 상품 설명 박스 -->
		<div class="col-md-6">
		
		<!-- 히든값 넘기기 -->
		<form id="frm">
			<input type="hidden" name="shopnum" value=<%=shopnum %>>
			<input type="hidden" name="num" value=<%=num %>>
				
				<div class="border-box" style="padding-top: 20px; padding-bottom: 20px;">
					<p style="font-weight: 400; font-size: 25pt;"><%=dto.getSangpum() %></p>
					<span class="star glyphicon glyphicon-star"></span>
					<span class="star glyphicon glyphicon-star"></span>
					<span class="star glyphicon glyphicon-star"></span>
					<span class="star glyphicon glyphicon-star"></span>
					<span class="star glyphicon glyphicon-star"></span>
					<span>0.0점</span>
					<span style="color: gray;">(0건)</span>
				</div>
				
				
				<div class="border-box">
					<span style="font-size: 13pt; margin-right: 150px;">판매가</span>
					<span style="font-size: 15pt;"><%=df.format(price) %>원</span>
				</div>
				
				<div class="border-box">
					<span style="font-size: 13pt; margin-right: 150px;">배송비</span>
					<span style="font-size: 13pt;">2,500원(20,000원 이상 구매 시 무료)</span>
				</div>
				
				<br>
				
				<div class="full-border-box">
					<p>단일 옵션</p>
					<br>
					<div class="input-group" style="width: 120px;">
				   	  <span class="input-group-addon" id="minus" style="background-color: white;"><i class="glyphicon glyphicon-minus"></i></span>
				   	  <input type="text" class="form-control" id="cnt" name="cnt" value="1" style="text-align: center;">
				   	  <span class="input-group-addon" id="plus" style="background-color: white;"><i class="glyphicon glyphicon-plus"></i></span>
					</div>
	    		 	<span class="part-price" style="float: right;"><%=df.format(price) %>원</span>
	    		 	<div style="clear: both;"></div>
				</div>
				<h3 style="float: right;">합계 &nbsp;&nbsp;<span class="part-price" style="font-size: 20pt; color: gray;"><%=df.format(price) %>원</span></h3>
				
				<hr style="width: 100%; color: gray;">
				
				<div>
					<button type="button" class="btn btn-default btn-like" style="width: 10%;"><span class="glyphicon glyphicon-heart"></span></button>
					<button type="button" class="btn btn-default btn-cart" style="width: 44%;">장바구니</button>
					<button type="button" class="btn btn-default btn-order" style="width: 44%;">바로구매</button>
				</div>
		</form>	
		</div>
	</div>
</div>
<script type="text/javascript">

var cnt = parseInt($("#cnt").val());
var price = <%=price%>
var sum = 0;

// 수량 증가하기
$("#plus").click(function(){
	
	if(cnt >= 5){
		alert("이 제품의 1회 최대 구매 가능한 수량은 5개 입니다.")
		return;
	}else{
		cnt += 1;
		$("#cnt").val(cnt);
	}
	
	sum = price * cnt;
	$(".part-price").html(sum.toLocaleString()+'원');
});

// 수량 감소하기
$("#minus").click(function(){
	if(cnt <= 1){
		return;
	}else{
		cnt -= 1;
		$("#cnt").val(cnt);	
	}
	sum = price * cnt;
	$(".part-price").html(sum.toLocaleString()+'원');
});

// 장바구니 이동
$(".btn-cart").click(function(){
	var formdata=$("#frm").serialize();
	// alert(formdata)
	
	$.ajax({
		type:"post",
		url:"shop/detailproc.jsp",
		dataType:"html",
		data:formdata,
		success:function(){
			var a=confirm('해당 상품을 장바구니에 저장했습니다\n장바구니로 이동하려면 확인을 클릭해주세요');
			if(a){
				location.href="index.jsp?main=shop/cart.jsp";
			}
		}
	}); 
});

</script>
</body>
</html>