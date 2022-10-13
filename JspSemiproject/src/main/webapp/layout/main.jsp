<%@page import="java.text.DecimalFormat"%>
<%@page import="data.Dto.shopDto"%>
<%@page import="java.util.List"%>
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
<style type="text/css">
.productlist{
float: left;
margin-right: 20px;
margin-bottom: 10px;
width:230px;
padding: 10px 10px 20px 10px;
border-radius: 5px;
}
.addmenu
{
position:absolute;
font-size: 16px;
}
.p-box{
display: inline-block;
width: 190px;
height: 220px;
overflow: hidden;
}
img.photo{
display: inline-block;
width: 100%;
height:200px;
overflow: hidden;
object-fit : contain;
}
.prd{
margin-left:15%;
margin-top: 50px;
}
img.event{
border-radius: 7px;
margin-left: 5px;
}
</style>
</head>
<%

shopDao dao = new shopDao();
DecimalFormat df = new DecimalFormat("###,###");


//각 페이지에서 필요한 게시글 불러오기
List<shopDto> list = dao.getLikeChu();
%>

<body>
 <section class = "header" style="height: 500px;">
      <h2>SkinLab</h2>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita, necessitatibus. Veniam corrupti deserunt, sint eligendi culpa sed aliquid error magnam id? Delectus laborum placeat ipsam est. Iusto dolores excepturi autem?</p>
      <button type = "button"><h5>내 피부에 딱 맞는 제품 찾아보기</h5></button>
 </section>
 
 	
	 <div class="prd">
	 	<h3>지금 놓치면 아쉬운 SkinLab 회원들의 추천템! </h3>
	 	<br>
 <% 
 for(int i=0; i<4; i++){
	 shopDto dto = list.get(i);
			
			%>
			<div class="productlist">
			<a shopnum=<%=dto.getShopnum()%> style="cursor: pointer; color:black;" class="detail">
			<div class="p-box">
				<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="img-thumbnail photo">
			</div>
			<div class="info">
				<div class="title" style="width:200px; font-size: 1.1em;">
				<%=dto.getSangpum()%>
				</div>
				<% int price = Integer.parseInt(dto.getPrice()); %>
				<h4><%=df.format(price)%>원</h4></a>			
				</div>
			<div class="addmenu">
				<span class="glyphicon glyphicon-comment" style="cursor: pointer; color:gray; margin-right: 15px;"></span>
				<span class="glyphicon glyphicon-heart likes" style="cursor: pointer;color:gray;" 
				shopnum="<%=dto.getShopnum()%>"></span>
				<span class="likechu" style=" margin-right: 15px;"><%=dto.getLikechu() %></span>
				<span class="glyphicon glyphicon-shopping-cart" style="cursor: pointer;color:gray;"></span>
			</div>
		</div>
		<%
		 }%>
		 
		 
			<div style="clear: both"></div>
			<br>
	 		<br>
			<h3>다른 진행중인 이벤트</h3>
			<br>
			<div>	
				<img class="event" src="menu/images/event1.png" style="width: 40%;">
				<img class="event" src="menu/images/event2.png" style="width: 40%;">
			</div>			
		
<script type="text/javascript">
$("a.detail").click(function(){
	var shopnum=$(this).attr("shopnum");
	//alert(shopnum);

	location.href="index.jsp?main=shop/detailview.jsp?shopnum="+shopnum;
 });
 
 $(".addmenu").fadeOut();
 $(".productlist").hover(function(){
	 $(this).children(".addmenu").fadeIn(500)},
	 function(){
		 $(this).children(".addmenu").fadeOut(500); 
 })
 
 
 //좋아요 처리 
	$("span.likes").click(function(){
		var shopnum = $(this).attr("shopnum");
		var tag = $(this);
		//console.log(shopnum); 
		$.ajax({
			type:"get",
			dataType:"json",
			url:"shop/likechu.jsp",
			data:{"shopnum":shopnum},
			success:function(res){
				tag.animate({'font-size':'21px'},100,function(){
					$(this).css("font-size","16px");
					tag.next().text(res.likechu);
				});
				
				
			}
		});
	})	
</script>
</body>
</html>