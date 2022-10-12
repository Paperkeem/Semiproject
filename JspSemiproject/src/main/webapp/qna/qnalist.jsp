<%@page import="data.Dao.memberDao"%>
<%@page import="data.Dto.memberDto"%>
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

span.lock {

color: gray;
}


</style>


</head>
<%
request.setCharacterEncoding("utf-8");
qnaDao dao=new qnaDao();
memberDao mdao=new memberDao();
String num=request.getParameter("num");


String loginok=(String)session.getAttribute("loginok");


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
<h5 class="alert alert-info">총 <%=totalCount%>개의 문의글이 있습니다</h5>
  <table class="table table-striped" style="width:1300px; ">
    <caption><b>문의글 리스트</b></caption>
     <tr>
       <td colspan="5">
        <%
if(loginok!=null){ //로그인중에만 게시글등록 삭제 보이게
	%>
	 
        <span style="float:right;">
 <button type="button" class="btn btn-default" style="background-color: lightblue; color: gray;"
         onclick="location.href='index.jsp?main=qna/qnaaddform.jsp'">
         <span class="glyphicon glyphicon-edit"></span>&nbsp;글작성</button>
<%}

%>
 </span>
     </td>
     </tr> 
  <tr>
    <th width="50">N0.</th>

 <th width="100">아이디</th>

    <th width="270">제목</th>
  
    <th width="70">작성일</th>

  </tr>
  
  <%

  if(loginok==null)
  {
	 
  %>
 
  <tr>
    <td colspan="5" align="center" style="color: gray;">
    <h5><b>로그인 후 확인 하세요</b></h5>
    </td>
    </tr>
    
    
    
    <%}else{
 
    	
    	for(qnaDto dto:list)
    	{
    		 
    		
    		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    	%>
    	
    	<tr>


    	<td
    	value="<%=dto.getNum()%>">&nbsp;&nbsp;<%=no-- %></td>
    
         
	     <td><%=mdao.getName(dto.getMyid())%></td>
	 
	 
	 
	 	
	 	

	    <td ><a href="index.jsp?main=qna/qnadetail.jsp?num=
    	<%=dto.getNum() %>" style="color: #0A6ECD;">
    		<%
	String name=(String)session.getAttribute("myid");
    		if(loginok!=null)
if(name.equals(dto.getMyid())||name.equals("admin")){%>
    	<%=dto.getContent()%></a></td>

   
<%}else{%>
	
<a >
<span class=" lock glyphicon glyphicon-lock">&nbsp;비밀글입니다.</span>
</a>
<%}
%>


   
  
    	<td><%=sdf.format(dto.getWriteday())%></td>
    
    	
    	
    	
    	</tr>
    	
    <%}
    }
  %>
  </table>
</div>




<div style="width: 180px; text-align:center;" class="container">
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