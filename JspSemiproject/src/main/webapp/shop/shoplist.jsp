<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.shopDao"%>
<%@page import="data.Dto.shopDto"%>
<%@page import="java.text.NumberFormat"%>
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
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">

body *{

font-family: 'Noto Sans KR';
}

</style>
<script type="text/javascript">
$(function(){
	$(".alldelcheck").click(function(){
		var chk=$(this).is(":checked");
		//alert(chk);
		
		$(".alldel").prop("checked",chk);
		
	});
	
	$("#btndel").click(function(){
		
		var ch=$(".alldel:checked").length;
		if(ch==0){
			alert("1개 이상의 상품을 선택해주세요");
		}else{
			
			var a=confirm(ch+"개의 상품을 삭제하려면 확인을 누르세요");
			
			var n="";
			$(".alldel:checked").each(function(idx){
				
				n+=$(this).val()+",";
			});
			n=n.substring(0,n.length-1);
			console.log(n);
			
			
			location.href="shop/deletelist.jsp?nums="+n;
		}
		
		
	});
	
});



</script>

</head>
<%
request.setCharacterEncoding("utf-8");
shopDao dao=new shopDao();


int totalCount;
int totalPage; //총페이지수
int startPage; //각블럭의 시작페이지
int endPage; //각블럭의 끝페이지
int start; //각페이지의 시작번호
int perPage=3; //한페이지에 보여질 글의 갯수
int perBlock=5; //한블럭당 보여지는 페이지개수
int currentPage;//현재페이지
int no;

//총갯수:
	totalCount=dao.getTotalCount();


if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);


startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;


if(endPage>totalPage)
	endPage=totalPage;


start=(currentPage-1)*perPage;


List<shopDto>list=dao.getList(start, perPage);


	no=totalCount-(currentPage-1)*perPage;

%>

<body>

<div style="margin: 100px 200px; width: 1200px; align:center;">
<div>
<b style="margin-left: 10px; font-size: 20px;">관리자페이지</b>
</div>
<br>
<h5 class="alert alert-info">총 <%=totalCount %>개의 상품이 있습니다</h5>
   <table class="table table-striped" style="width: 1200px;">
     <caption><b>상품입고리스트</b></caption>
       <tr>
       <td colspan="5">
         <input type="checkbox" class="alldelcheck">&nbsp;&nbsp;전체선택
         <span style="float: right;">
         <button type="button" class="btn btn-default" style="background-color: lightpink;"
         id="btndel"><span class="	glyphicon glyphicon-trash"></span></button>
         <button type="button" class="btn btn-default"  style="background-color: lightblue;" onclick="location.href='index.jsp?main=shop/addform.jsp'"><span class="glyphicon glyphicon-pencil"></span></button>
         
    </span>
       </td>
     
     </tr>
   
     <tr>
       <th width="50">번호</th>
       <th width="100">카테고리</th>
       <th width="100">상품타입</th>
       <th width="70">상품명</th>
       <th width="70">입고일</th>
     
     
     </tr>
     <%
     if(totalCount==0)
     {%>
    	<tr>
    	  <td colspan="5" align="center">
    	    <h5><b>등록된 상품이 없습니다</b></h5>
    	  </td>
    	</tr> 
    	
     <%}else{
    	
    	 for(shopDto dto:list)
    	 {
    		 %>
    		<tr >
    		
    		  <td ><input type="checkbox" class="alldel"
    		  value="<%=dto.getShopnum()%>">&nbsp;&nbsp;<%=no-- %> </td>
    		  <td ><%=dto.getCategory()%></td>
    		  <td ><%=dto.getSangpumtype()%></td>
    		  <td><a href="index.jsp?main=shop/detailview.jsp?shopnum=<%=dto.getShopnum()%>"><%=dto.getSangpum() %></a></td>
    		  <td><%=dto.getIpgoday()%></td>
    		  
    		</tr> 
    	 <%}
    	 
    	 
     }
     
     
     %>
   
   </table>
<div style="width: 1000px; text-align:center;" class="container">
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

</body>
</html>