<%@page import="data.Dao.replyDao"%>
<%@page import="data.Dao.memberDao"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">

#container{
width:100%;
margin-left: 70px;
}
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

#content{
width: 80%;

}
div.listheader{
background-image: url('shopsave/bh3.jpeg');
		opacity:0.9; 
		width:100%;
		height:150px; 
		background-position:center center; 
		background-size: cover; text-align: center;
		padding-top: 45px;
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
margin-left:7%;
margin-top: 90px;
}

.productlist{
float: left;
margin-right: 20px;
margin-bottom: 10px;
width:230px;
padding: 10px 10px 20px 10px;
border-radius: 5px;
}

.sidebar{
width:765px;
margin-top: 30px;


}

ul{
list-style: none;
}

ul.sidelist li{
border:1px solid lightgray;
padding:10px 10px 10px 10px;
float: left;
margin-left: 10px;
}
ul.sidelist li a{
color:gray;
}
</style>
<script type="text/javascript">
$(function(){
	
	 $("a.detail").click(function(){
		var shopnum=$(this).attr("shopnum");
		//alert(shopnum);
	
		location.href="index.jsp?main=shop/detailview.jsp?shopnum="+shopnum;
	 });
	
	 $("div.menu2").hide();
	 $("div.menu3").hide();
	 $("div.menu4").hide();
	 
	 $("li.skin").click(function(){
		$("div.menu2").show();
		 $("div.menu3").hide();
		 $("div.menu4").hide();
	 });
	  $("li.face").click(function(){
		$("div.menu3").show();
		 $("div.menu2").hide();
		 $("div.menu4").hide();
	 });
	  $("li.body").click(function(){
		$("div.menu4").show();
		 $("div.menu2").hide();
		 $("div.menu3").hide();
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
		//장바구니 추가 처리
		$("span.cartin").click(function(){
			var shopnum = $(this).attr("shopnum");
			var num = $("#num").val();
			var cnt = $("#cnt").val();
			//console.log(shopnum,num,cnt);
		  $.ajax({
			type:"post",
			url:"shop/detailproc.jsp",
			dataType:"html",
			data:{"shopnum":shopnum,"num":num,"cnt":cnt},
			success:function(){
				var a=confirm('해당 상품을 장바구니에 저장했습니다\n장바구니로 이동하려면 확인을 클릭해주세요');
				if(a){
					location.href="index.jsp?main=shop/cart.jsp";
				}
			}
		});  
		
		})
		
			$("ul.sidelist li a").hover(function(){
			 $(this).css("color","#4576b0")
			  $(this).css("font-weight","bold")},
			 function(){
	 		$(this).css("color","gray")
	 		$(this).css("font-weight","normal")
		 })
		
})
</script>
</head>
<%
shopDao dao = new shopDao();
String sangpumtype = request.getParameter("sangpumtype");
String category = request.getParameter("category");
String loginok = (String)session.getAttribute("loginok");
String myid = (String)session.getAttribute("myid");

//아이디에 해당하는 멤버 번호 
memberDao mdao = new memberDao();
String num = mdao.getNum(myid);

//리뷰수 불러오기
replyDao rdao = new replyDao();

DecimalFormat df = new DecimalFormat("###,###");
//페이징 
//페이징에 필요한 변수
int totalCount;
int totalPage; //총페이지 수 
int startPage; //각 블럭의 시작페이지 
int endPage; //각 블럭의 끝 페이지
int start; //각 페이지의 시작번호 
int perPage=12; //한 페이지에 보여질 글의 갯수 
int perBlock=5; //한 블럭당 보여지는 페이지 갯수 
int currentPage; //현재페이지 

//총갯수
totalCount =dao.getTotalCateCount(category);

//현재 페이지 번호 읽기(null인 경우 1페이지로 설정)
if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

//총페이지갯수 구하기
totalPage = totalCount/perPage+(totalCount%perPage==0?0:1);

//각 블럭의 시작페이지 (현재페이지 3/ 시작1/끝 5)
startPage =(currentPage-1)/perBlock*perBlock+1;
endPage = startPage+perBlock-1;

//총 페이지 갯수가 8..  2번째 블럭은 startpage6,endpage10.. endpage 8로 수정
if(endPage>totalPage)
	endPage=totalPage;

//각 페이지에서 불러올 시작번호. 현재페이지가 1일경우 start, 2일경우 6
	start = (currentPage-1)*perPage;

//각 페이지에서 필요한 게시글 불러오기
	List<shopDto> list = dao.getCateList(category, start, perPage);

%>
<body>
<div id="container">
  <div class="location">
	<div class="inner">
		<div class="intag">
			<a href="index.jsp">홈</a> &nbsp;>&nbsp;
			</div>
			<div class="dropdown intag">
    	<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">카테고리
    	<span class="caret"></span></button>&nbsp;>&nbsp;
   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
      		<li role="presentation" class="skin"><a role="menuitem" tabindex="-1" href="#">스킨케어&클렌징</a></li>
      		<li role="presentation" class="face"><a role="menuitem" tabindex="-1" href="#">페이스메이크업</a></li>
      		<li role="presentation" class="body"><a role="menuitem" tabindex="-1" href="#">바디&헤어케어</a></li>
      		<li role="presentation" class="divider"></li>
      		<li role="presentation" class="gomin"><a role="menuitem" tabindex="-1" href="#">피부고민</a></li>
    	</ul>
  		</div>	
  		<div class="tmenu">
  		<div class="dropdown intag menu2">
  		<button class="btn btn-default dropdown-toggle" type="button" id="menu2" data-toggle="dropdown">상품타입
    	<span class="caret"></span></button>
   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu2">
   		 	<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/shoplist.jsp?category=skincare_cleansing">전체</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/shoplist.jsp?sangpumtype=toner_loction&category=skincare_cleansing">토너/로션</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/shoplist.jsp?sangpumtype=cream_jell&category=skincare_cleansing">크림/젤</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/shoplist.jsp?sangpumtype=essence_serum&category=skincare_cleansing">에센스/세럼</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/shoplist.jsp?sangpumtype=mask_pack&category=skincare_cleansing">마스크/팩</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/shoplist.jsp?sangpumtype=cleansing&category=skincare_cleansing">클렌징</a></li>
    	</ul>
  		</div>
  		
  		 <div class="dropdown intag menu3">
  		<button class="btn btn-default dropdown-toggle" type="button" id="menu3" data-toggle="dropdown">상품타입
    	<span class="caret"></span></button>
   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu3">
   		 	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">전체</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?mainshop/facelist.jsp?sangpumtype=base_foundation&category=facemakeup">베이스/파운데이션</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/facelist.jsp?sangpumtype=blush_highlighter&category=facemakeup">블러셔/하이라이터</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/facelist.jsp?sangpumtype=eyeshadow&category=facemakeup">아이섀도우</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/facelist.jsp?sangpumtype=eyeliner_brow&category=facemakeup">아이라이너/브로우</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/facelist.jsp?sangpumtype=mascara&category=facemakeup">마스카라</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/facelist.jsp?sangpumtype=lipw&category=facemakeup">립메이크업</a></li>
    	</ul>
  		</div>
  		
  		<div class="dropdown intag menu4">
  		<button class="btn btn-default dropdown-toggle" type="button" id="menu4" data-toggle="dropdown">상품타입
    	<span class="caret"></span></button>
   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu4">
   		 	<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/bodyhairlist.jsp?category=body_haircare">전체</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/bodyhairlist.jsp?sangpumtype=body_care&category=body_haircare">바디케어</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/bodyhairlist.jsp?sangpumtype=hairstyling&category=body_haircare">헤어스타일링</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/bodyhairlist.jsp?sangpumtype=perfume&category=body_haircare">향수</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/bodyhairlist.jsp?sangpumtype=beauty_accessories&category=body_haircare">미용소품</a></li>
    	</ul>
  		</div>
		</div>
	</div> 
	</div> 
	<br>
	<div id="content">
    	<div class="listheader">
		<div class="headertext" style="margin-right: 50px;">
			<h2 style="color:black;">바디&헤어케어</h2>
		</div>
	 	</div>
	 	
	 	 	<div class="sidebar">
		<ul class="sidelist">
		<li><a href="index.jsp?main=shop/bodyhairlist.jsp?category=body_haircare">전체보기</a></li>	
		<li><a href="index.jsp?main=shop/bodyhairlist.jsp?sangpumtype=body_care&category=body_haircare">바디케어</a></li>
		<li><a href="index.jsp?main=shop/bodyhairlist.jsp?sangpumtype=hairstyling&category=body_haircare">헤어스타일링</a></li>
		<li><a href="index.jsp?main=shop/bodyhairlist.jsp?sangpumtype=perfume&category=body_haircare">향수</a></li>
		<li><a href="index.jsp?main=shop/bodyhairlist.jsp?sangpumtype=beauty_accessories&category=body_haircare">미용소품</a></li>
		</ul>
		</div>
	 	
	 	
	 <div class="prd">
     <%
	 int i = 1;
	 if( sangpumtype != null){
		 
		 for(shopDto dto : list)
		 {
			if(dto.getSangpumtype().equals(sangpumtype)){
			%>
			<form id="add">
     		<input type="hidden" id="num" name="num" value="<%=num%>">
     		<input type="hidden" id="cnt" name="cnt" value="1">
			<div class="productlist">
			<div class="p-box">
			<a shopnum=<%=dto.getShopnum()%> style="cursor: pointer; color:black;" class="detail">
			<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="img-thumbnail photo">
			</div>
			<div class="info">
				<div class="title" style="width:200px; font-size: 1.1em;">
				<%=dto.getSangpum()%>
				</div>
				<% int price = Integer.parseInt(dto.getPrice()); %>
				<h4 style="margin-top:30px;"><%=df.format(price)%>원</h4></a>
			</div>
			<div class="addmenu">
			<!-- 리뷰 -->
			<% int recount = rdao.getTotalCount(dto.getShopnum());%>
			<a href="index.jsp?main=shop/detailview.jsp?shopnum=<%=dto.getShopnum()%>#reply" class="recount" style="color:gray;">
			<span class="glyphicon glyphicon-comment" style="color:gray;"></span>&nbsp;<%=recount%></a>
			
			<!--좋아요 -->
			<span class="glyphicon glyphicon-heart likes" style="cursor: pointer;color:gray;margin-left: 10px;"
			 shopnum="<%=dto.getShopnum()%>"></span>
			<span class="likechu" style=" margin-right: 10px;"><%=dto.getLikechu() %></span>
			
			<!-- 장바구니  -->
			<% if(loginok!=null){%>
			<span class="glyphicon glyphicon-shopping-cart cartin" style="cursor: pointer;color:gray;"
			 shopnum="<%=dto.getShopnum()%>"></span>
			<%}%>
			</div>
			</div>
			<%
				if((i+4)%4==0)
				{%>
				<br> </form>
				<%} i++;
			}
		 }
		 }else{
	 	
		 for(shopDto dto : list)
			 {
			if(dto.getCategory().equals(category)){%>
			<form id="add">
     		<input type="hidden" id="num" name="num" value="<%=num%>">
     		<input type="hidden" id="cnt" name="cnt" value="1">
			<div class="productlist">
			<div class="p-box">
			<a shopnum=<%=dto.getShopnum()%> style="cursor: pointer; color:black;" class="detail">
			<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="img-thumbnail photo">
			</div>
			<div class="info">
				<div class="title" style="width:200px; font-size: 1.1em;">
				<%=dto.getSangpum()%>
				</div>
				<% int price = Integer.parseInt(dto.getPrice()); %>
				<h4 style="margin-top:30px;"><%=df.format(price)%>원</h4></a>
			</div>
			<div class="addmenu">
			<!-- 리뷰 -->
			<% int recount = rdao.getTotalCount(dto.getShopnum());%>
			<a href="index.jsp?main=shop/detailview.jsp?shopnum=<%=dto.getShopnum()%>#reply" class="recount" style="color:gray;">
			<span class="glyphicon glyphicon-comment" style="color:gray;"></span>&nbsp;<%=recount%></a>
			
			<!--좋아요 -->
			<span class="glyphicon glyphicon-heart likes" style="cursor: pointer;color:gray;margin-left: 10px;"
			 shopnum="<%=dto.getShopnum()%>"></span>
			<span class="likechu" style=" margin-right: 10px;"><%=dto.getLikechu() %></span>
			
			<!-- 장바구니  -->
			<% if(loginok!=null){%>
			<span class="glyphicon glyphicon-shopping-cart cartin" style="cursor: pointer;color:gray;"
			 shopnum="<%=dto.getShopnum()%>"></span>
			<%}%>
			</div>
			</div>
						<%
				if((i+4)%4==0)
				{%>
				<br></form> 
				<%} i++;
			}
		 }%>
		 <div style="width: 200px; margin-left: 28%; padding-top:60%;" class="pcontainer">
  		<ul class="pagination">
      	<%   
       if(startPage>1)
    	{%>
    	<li>
    	  <a href="index.jsp?main=shop/bodyhairlist.jsp?category=<%=category%>&currentPage=<%=startPage-1%>">이전</a>
    	</li>
    	<%}
    	for(int pp=startPage;pp<=endPage;pp++)
    	{
    	if(pp==currentPage)
    	{%>
    		<li class="active">
    		  <a href="index.jsp?main=shop/bodyhairlist.jsp?category=<%=category%>&currentPage=<%=pp%>"><%=pp %></a>
    		</li>
    	<%}else{%>
    		<li >
    		  <a href="index.jsp?main=shop/bodyhairlist.jsp?category=<%=category%>&currentPage=<%=pp%>"><%=pp %></a>
    		</li>
    	<%}
   		 }
    	if(endPage<totalPage)
    	{%>
    	<li>
    	  <a href="index.jsp?main=shop/bodyhairlist.jsp?category=<%=category%>&currentPage=<%=endPage+1%>">다음</a>
    	</li>
    	<%}
    	%>
  
  	</ul>
	</div>	
		 <%
	 }%>
	   </div>
	   </div>
  
</div>
</body>
</html>
