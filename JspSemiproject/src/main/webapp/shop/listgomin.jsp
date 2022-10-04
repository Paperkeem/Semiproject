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
		opacity:0.8; 
		width:100%;
		height:200px; 
		background-position:center center; 
		background-size: cover; text-align: center;
		padding-top: 65px;

}

table.pdtab{
width:1000px; 
text-align: center;
margin-left:100px;

}
div.container{
width: 900px;
margin-left: 0;
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
	 

})
</script>
</head>
<%

shopDao dao = new shopDao();
String gomin = request.getParameter("gomin");
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
    	<span class="caret"></span></button>&nbsp;>
   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu1" >
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/shoplist.jsp">스킨케어&클렌징</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">페이스메이크업</a></li>
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">바디&헤어케어</a></li>
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
      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=9">기타</a></li>
    	</ul>
  		</div>
	</div> 
  </div>
  <br>

	<div id="content">

    	<div class="listheader">
		<div class="headertext">
			<h2 style="color:black;">피부고민</h2>
		</div>
		</div>
	</div>
	<br>
	<table class="table table-bordered pdtab">
	  <tr>	
	  <%
	 int i = 1;
	 for(shopDto dto : list)
	 {
		if(dto.getGomin().equals(gomin)){
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
		} else{
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

  <div style="width: 100px; margin-left:40%;" class="contain">
  <ul class="pagination">
      <%
    if(startPage>1)
    {%>
    	<li>
    	  <a href="index.jsp?main=shop/listgomin.jsp?currentPage=<%=startPage-1%>">이전</a>
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
    	  <a href="index.jsp?main=shop/listgomin.jsp?currentPage=<%=endPage+1%>">다음</a>
    	</li>
    <%}
    %>
  
  </ul>
</div>		
</div>
</body>

</html>
