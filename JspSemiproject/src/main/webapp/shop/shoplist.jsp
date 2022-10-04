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
div.inner{
padding-bottom: 10px;
}
div.intag *{
color:gray;
font-size: 9pt;
}

#menu1,#menu2,#menu3,#menu4{
width:60px;
background :none;
border: 0;
padding :0;
padding-bottom: 2px;
}

#content{
width: 80%;
}

div.productlist{
width:100%;
padding : 0 auto;

}
div.prd{
text-align:center;
width:15%;
height:17%;
float:left;
margin:0px 10px 20px 0px;

}
table.pdtab{
width:900px; 
text-align: center;
margin-left:100px;

}
img.photo{
width:90px;
height: 100px;
border:1px solid lightgray;
border-radius: 10px;
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
	 })
	  $("li.face").click(function(){
		$("div.menu3").show();
		 $("div.menu2").hide();
		 $("div.menu4").hide();
	 })
	  $("li.body").click(function(){
		$("div.menu4").show();
		 $("div.menu2").hide();
		 $("div.menu3").hide();
	 })
	
});
</script>
</head>
<%
shopDao dao = new shopDao();
String sangpumtype = request.getParameter("sangpumtype");
NumberFormat nf = NumberFormat.getCurrencyInstance();

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
totalCount =dao.getTotalCount();

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
	List<shopDto> list = dao.getList(start, perPage);

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
      		<li role="presentation" class="gomin"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp">피부고민</a></li>
    	</ul>
  		</div>	
  		<div class="tmenu">
  		<div class="dropdown intag menu2">
  		<button class="btn btn-default dropdown-toggle" type="button" id="menu2" data-toggle="dropdown">상품타입
    	<span class="caret"></span></button>
   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu2">
   		 	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">전체</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">토너/로션</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">크림/젤</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">에센스/세럼</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">마스크/팩</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">클렌징</a></li>
    	</ul>
  		</div>
  		
  		 <div class="dropdown intag menu3">
  		<button class="btn btn-default dropdown-toggle" type="button" id="menu3" data-toggle="dropdown">상품타입
    	<span class="caret"></span></button>
   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu3">
   		 	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">전체</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">베이스/파운데이션</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">블러셔/하이라이터</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">아이섀도우</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">아이라이너/브로우</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">마스카라</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">립메이크업</a></li>
    	</ul>
  		</div>
  		
  		<div class="dropdown intag menu4">
  		<button class="btn btn-default dropdown-toggle" type="button" id="menu4" data-toggle="dropdown">상품타입
    	<span class="caret"></span></button>
   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu4">
   		 	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">전체</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">바디케어</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">헤어스타일링</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">향수</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">미용소품</a></li>
    	</ul>
  		</div>
		</div>
	</div> 
	</div> 
	<br>
	
	<div id="content">
	<div class="listheader" style="background-image: url('shopsave/8.jpeg'); opacity:0.8;
	width:100%; height:200px; background-size: cover; text-align: center; padding-top: 65px;">
	
		<div class="headertext">
		<h2 style="color:black;">스킨케어&클렌징</h2>
		</div>
		</div>
		<br><br>

      	<table class="table table-bordered pdtab">
		 <tr>
	  <%
		 int i = 1;
		 for(shopDto dto : list)
			 
		 {
			if(dto.getSangpumtype().equals(sangpumtype)){
			%>
			<td style="width:15%">
			<a shopnum=<%=dto.getShopnum()%> style="cursor: pointer; color:black" class="detail">
			<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="photo img-thumbnail"><br>
			<%=dto.getSangpum()%><br>
			<h4 style="color:black;"><%=dto.getPrice()%></h4></a>
			</td>
			<%
			if((i+4)%4==0)
			{%>
			</tr><tr>	
			<%} i++;
			}
			}%>	
		 </tr>
		</table>
	    </div>         	
	   
  <div style="width: 100px; margin-left:40%;" class="container">
  <ul class="pagination">
    
    <%
    if(startPage>1)
    {%>
    	<li>
    	  <a href="index.jsp?main=shop/shoplist.jsp?currentPage=<%=startPage-1%>">이전</a>
    	</li>
    <%}
    for(int pp=startPage;pp<=endPage;pp++)
    {
    	if(pp==currentPage)
    	{%>
    		<li class="active">
    		  <a href="index.jsp?main=shop/shoplist.jsp?currentPage=<%=pp%>"><%=pp %></a>
    		</li>
    	<%}else{%>
    		<li >
    		  <a href="index.jsp?main=shop/shoplist.jsp?currentPage=<%=pp%>"><%=pp %></a>
    		</li>
    	<%}
    }
    if(endPage<totalPage)
    {%>
    	<li>
    	  <a href="index.jsp?main=shop/shoplist.jsp?currentPage=<%=endPage+1%>">다음</a>
    	</li>
  	<%}
    %>
  
  </ul>
</div>
</div>
</body>
</html>
