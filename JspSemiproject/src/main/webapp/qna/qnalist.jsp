<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.Dto.qnaDto"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.qnaDao"%>
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
		
		var q=$(".alldel:checked").length;
		if(q==0){
			alert("1개 이상의 게시글을 선택해주세요");
		}else{
			
			var a=confirm(q+"개의 게시글을 삭제하려면 확인을 누르세요");
			
			var n="";
			$(".alldel:checked").each(function(idx){
				
				n+=$(this).val()+",";
			});
			n=n.substring(0,n.length-1);
			console.log(n);
			
			
			location.href="qna/qnadeletelist.jsp?nums="+n;
		}
		
		
	});
	
});



</script>



</head>
<%
request.setCharacterEncoding("utf-8");
qnaDao dao=new qnaDao();

int totalCount;
int totalPage;
int startPage;
int endPage;
int start;
int perPage=3;
int perBlock=5;
int currentPage;
int no;

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

List<qnaDto>list=dao.getList(start, perPage);
	
no=totalCount-(currentPage-1)*perPage;

%>
<body>

<div style="margin: 30px 200px; width: 1300px; align:center;">
<br>
<b style="font-size: 20px;">1:1 문의게시판</b>
<br>
<h5 class="alert alert-success">총 <%=totalCount%>개의 문의글이 있습니다</h5>
  <table class="table table-striped" style="width:1300px; ">
    <caption><b>문의글 리스트</b></caption>
     <tr>
       <td colspan="5">
       <input type="checkbox" class="alldelcheck" style="background-color: #F0F0F0;">&nbsp;&nbsp;전체선택
        <span style="float:right;">
        <button type="button" class="btn btn-default" style="background-color: lightpink; color: white;"
        id="btndel"><span class="glyphicon glyphicon-trash"></span></button>
        <button type="button" class="btn btn-default" style="background-color: lightgreen; color: white;"
         onclick="location.href='index.jsp?main=qna/qnaaddform.jsp'">
         <span class="glyphicon glyphicon-edit"></span></button>
        
        
        </span>
     </td>
     </tr> 
  <tr>
    <th width="50">N0.</th>

    <th width="270">제목</th>
    
    <th width="70">작성일</th>

  </tr>
  
  <%
  if(totalCount==0)
  {%>
  <tr>
    <td colspan="5" align="center" style="color: gray;">
    <h5><b>등록된 문의글이 없습니다</b></h5>
    </td>
    </tr>
    
    <%}else{
    	
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    	for(qnaDto dto:list)
    	{
    	%>
    	<tr>
    	<td><input type="checkbox" class="alldel"
    	value="<%=dto.getNum()%>">&nbsp;&nbsp;<%=no-- %></td>
    
    	<td><a href="index.jsp?main=qna/qnadetail.jsp?num=
    	<%=dto.getNum() %>"><%=dto.getContent()%></a></td>
   
  
    	<td><%=sdf.format(dto.getWriteday())%></td>
    
    	
    	
    	
    	</tr>
    <%}
    }
  %>
  </table>
</div>

<div style="width: 100px; text-align:center;" class="container">
  <ul class="pagination">
    
    <%
    
    
    if(startPage>1)
    {%>
    	<li>
    	  <a href="index.jsp?main=qna/qnalist.jsp?currentPage=<%=startPage-1%>">이전</a>
    	</li>
    <%}
    
    
    for(int pp=startPage;pp<=endPage;pp++)
    {
    	if(pp==currentPage)
    	{%>
    		<li class="active">
    		  <a href="index.jsp?main=qna/qnalist.jsp?currentPage=<%=pp%>"><%=pp %></a>
    		</li>
    	<%}else{%>
    		<li >
    		  <a href="index.jsp?main=qna/qnalist.jsp?currentPage=<%=pp%>"><%=pp %></a>
    		</li>
    	<%}
    }
    
    
    if(endPage<totalPage)
    {%>
    	<li>
    	  <a href="index.jsp?main=qna/qnalist.jsp?currentPage=<%=endPage+1%>">다음</a>
    	</li>
    <%}
    
    %>
  
  </ul>
</div>


</body>
</html> 