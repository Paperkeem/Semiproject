<%@page import="data.Dao.replyDao"%>
<%@page import="data.Dao.memberDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
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
background-image: url('shopsave/5.jpeg');
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
width:850px;
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
	 
	 $(".addmenu").fadeOut();
	 $(".productlist").hover(function(){
		 $(this).children(".addmenu").fadeIn(500)},
		 function(){
			 $(this).children(".addmenu").fadeOut(500); 
	 })

	 
	 //????????? ?????? 
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
		//???????????? ?????? ??????
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
				var a=confirm('?????? ????????? ??????????????? ??????????????????\n??????????????? ??????????????? ????????? ??????????????????');
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
String gomin = request.getParameter("gomin");
String loginok = (String)session.getAttribute("loginok");
String myid = (String)session.getAttribute("myid");

//???????????? ???????????? ?????? ?????? 
memberDao mdao = new memberDao();
String num = mdao.getNum(myid);

//????????? ????????????
replyDao rdao = new replyDao();

DecimalFormat df = new DecimalFormat("###,###");
//????????? 
//???????????? ????????? ??????
int totalCount;
int totalGominCount;
int totalPage; //???????????? ??? 
int totalGominPage; //???????????? ??? 
int startPage; //??? ????????? ??????????????? 
int endPage; //??? ????????? ??? ?????????
int endGoPage;
int start; //??? ???????????? ???????????? 
int perPage= 12; //??? ???????????? ????????? ?????? ?????? 
int perBlock=5; //??? ????????? ???????????? ????????? ?????? 
int currentPage; //??????????????? 

//?????????
totalCount =dao.getTotalCount();
totalGominCount = dao.getTotalGominCount(gomin);

//?????? ????????? ?????? ??????(null??? ?????? 1???????????? ??????)
if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

//?????????????????? ?????????
totalPage = totalCount/perPage+(totalCount%perPage==0?0:1);
totalGominPage = totalGominCount/perPage+(totalGominCount%perPage==0?0:1);

//??? ????????? ??????????????? (??????????????? 3/ ??????1/??? 5)
startPage =(currentPage-1)/perBlock*perBlock+1;
endPage = startPage+perBlock-1;
endGoPage = startPage+perBlock-1;
//??? ????????? ????????? 8..  2?????? ????????? startpage6,endpage10.. endpage 8??? ??????
if(endPage>totalPage)
	endPage=totalPage;
if(endGoPage>totalGominPage)
	endGoPage=totalGominPage;

//??? ??????????????? ????????? ????????????. ?????????????????? 1????????? start, 2????????? 6
	start = (currentPage-1)*perPage;

//??? ??????????????? ????????? ????????? ????????????
	List<shopDto> list = dao.getList(start, perPage);
	List<shopDto> Golist = dao.getGoList(gomin, start, perPage);
			
%>

<body>

<div id="container">
  <div class="location">
	<div class="inner">
		<div class="intag">
			<a href="index.jsp">???</a> &nbsp;>&nbsp;
			</div>
			<div class="dropdown intag">
    	<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">????????????
    	<span class="caret"></span></button>&nbsp;>
   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu1" >
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">????????????&?????????</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">?????????????????????</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">??????&????????????</a></li>
      		<li role="presentation" class="divider"></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">????????????</a></li>
    	</ul>
  		</div>
  		<div class="dropdown intag">
  		<button class="btn btn-default dropdown-toggle" type="button" id="menu2" data-toggle="dropdown">?????????
    	<span class="caret"></span></button>
   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu2">
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=1">??????</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=2">?????????</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=3">??????</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=4">??????</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=5">?????????</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=6">??????</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=7">?????????</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=8">????????????</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=9">??????</a></li>
    	</ul>
  		</div>
	</div> 
  </div>
  <br>
	
	<div id="content">
    	<div class="listheader">
		<div class="headertext">
			<h2 style="color:black;">????????????</h2>
		</div>
		</div>
		
	<div class="sidebar">
		<ul class="sidelist">
		<li><a href="index.jsp?main=shop/listgomin.jsp">????????????</a></li>	
		<li><a href="index.jsp?main=shop/listgomin.jsp?gomin=1">??????</a></li>
		<li><a href="index.jsp?main=shop/listgomin.jsp?gomin=2">?????????</a></li>
		<li><a href="index.jsp?main=shop/listgomin.jsp?gomin=3">??????</a></li>
		<li><a href="index.jsp?main=shop/listgomin.jsp?gomin=4">??????</a></li>
		<li><a href="index.jsp?main=shop/listgomin.jsp?gomin=5">?????????</a></li>
		<li><a href="index.jsp?main=shop/listgomin.jsp?gomin=6">??????</a></li>
		<li><a href="index.jsp?main=shop/listgomin.jsp?gomin=7">?????????</a></li>
		<li><a href="index.jsp?main=shop/listgomin.jsp?gomin=8">????????????</a></li>
		</ul>
	</div>
		
	<div class="prd">
	  <%
	
	 int i = 1;
	
	  if( gomin != null ){
		 
		 for(shopDto dto : Golist)
		 {
			if(dto.getGomin().equals(gomin)){
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
				<h4 style="margin-top:30px;"><%=df.format(price)%>???</h4></a>
			</div>
			
			<div class="addmenu">
			<!-- ?????? -->
			<% int recount = rdao.getTotalCount(dto.getShopnum());%>
			<a href="index.jsp?main=shop/detailview.jsp?shopnum=<%=dto.getShopnum()%>#reply" class="recount" style="color:gray;">
			<span class="glyphicon glyphicon-comment" style="color:gray;"></span>&nbsp;<%=recount%></a>
			
			<!--????????? -->
			<span class="glyphicon glyphicon-heart likes" style="cursor: pointer;color:gray;margin-left: 10px;"
			 shopnum="<%=dto.getShopnum()%>"></span>
			<span class="likechu" style=" margin-right: 10px;"><%=dto.getLikechu() %></span>
			
			<!-- ????????????  -->
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
		 }%>
		<div style="width: 200px; margin-left: 27.5%; padding-top:30%;" class="pcontainer">
	  		<ul class="pagination">
	      	<%   
	       if(startPage>1)
	    	{%>
	    	<li>
	    	  <a href="index.jsp?main=shop/listgomin.jsp?gomin=<%=gomin %>&currentPage=<%=startPage-1%>">??????</a>
	    	</li>
	    	<%}
	    	for(int pp=startPage;pp<=endGoPage;pp++)
	    	{
	    	if(pp==currentPage)
	    	{%>
	    		<li class="active">
	    		  <a href="index.jsp?main=shop/listgomin.jsp?gomin=<%=gomin %>&currentPage=<%=pp%>"><%=pp %></a>
	    		</li>
	    	<%}else{%>
	    		<li >
	    		  <a href="index.jsp?main=shop/listgomin.jsp?gomin=<%=gomin %>&currentPage=<%=pp%>"><%=pp %></a>
	    		</li>
	    	<%}
	   		 }
	    	if(endGoPage<totalGominPage)
	    	{%>
	    	<li>
	    	  <a href="index.jsp?main=shop/listgomin.jsp?gomin=<%=gomin %>&currentPage=<%=endGoPage+1%>">??????</a>
	    	</li>
	    	<%}
	    	%>
	  
	  	</ul>
		</div>	
		 
		 
			 <%
	  } else{
	 
		 for(shopDto dto : list)
			 {
			if(dto.getGomin() != "9"){%>
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
				<h4 style="margin-top:30px;"><%=df.format(price)%>???</h4></a>
			</div>
			<div class="addmenu">
			<!-- ?????? -->
			<% int recount = rdao.getTotalCount(dto.getShopnum());%>
			<a href="index.jsp?main=shop/detailview.jsp?shopnum=<%=dto.getShopnum()%>#reply" class="recount" style="color:gray;">
			<span class="glyphicon glyphicon-comment" style="color:gray;"></span>&nbsp;<%=recount%></a>
			
			<!--????????? -->
			<span class="glyphicon glyphicon-heart likes" style="cursor: pointer;color:gray;margin-left: 10px;"
			 shopnum="<%=dto.getShopnum()%>"></span>
			<span class="likechu" style=" margin-right: 10px;"><%=dto.getLikechu() %></span>
			
			<!-- ????????????  -->
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
		 <div style="width: 200px; margin-left: 33%; margin-top:30%;" class="pcontainer">
  		<ul class="pagination">
      	<%   
       if(startPage>1)
    	{%>
    	<li>
    	  <a href="index.jsp?main=shop/listgomin.jsp?currentPage=<%=startPage-1%>">??????</a>
    	</li>
    	<%}
    	for(int pp=startPage;pp<=endPage;pp++)
    	{
    	if(pp==currentPage)
    	{%>
    		<li class="active">
    		  <a href="index.jsp?main=shop/listgomin.jsp?currentPage=<%=pp%>"><%=pp %></a>
    		</li>
    	<%}else{%>
    		<li >
    		  <a href="index.jsp?main=shop/listgomin.jsp?currentPage=<%=pp%>"><%=pp %></a>
    		</li>
    	<%}
   		 }
    	if(endPage<totalPage)
    	{%>
    	<li>
    	  <a href="index.jsp?main=shop/listgomin.jsp?currentPage=<%=endPage+1%>">??????</a>
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
