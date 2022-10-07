
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.Dto.qnaDto"%>
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
  #a{
 
  border-top:2px solid #dcdcdc;
  margin-left: 400px;
  width: 870px;
  float: center;
   
 }
 
 span.ansdel{
margin-left: 50px;
cursor: pointer;
color: lightpink;

 }
 
 #addanswer{
 
 margin-top: -315px;
 margin-left: 650px;
 height: 55px;
 width:70px;
 background-color: lightgray;
 color: white;
 }

    
span.aday{
    
    float: right;
    color:green;
    
   
    }
    

span.adel{
    cursor: pointer;
    margin-left: 50px;
    }
    
   
  

body *{

font-family: 'Noto Sans KR';
}

</style>
    
   <script type="text/javascript">
    $(function(){
    	
   
    
    answerlist();
    
  
 	var num=$("#num").val();
	//alert(num);
	
    $("#addanswer").click(function(){
    	
    	//var myid=$("#myid").val();
    	var num=$("#num").val();
    	var answer=$("#answer").val();
    
    	$.ajax({
    		type:"post",
    		url:"qna/qnaanswerupdate.jsp",
    		dataType:"html",
    		data:{"num":num,"answer":answer},
    		success:function(){
    			
    		
    			
    			//alert("success");
    			
    			$("#answer").val("");
    			answerlist();
    			
    		}
    		});
    		});

    
    
/*      //삭제
    $(document).on("click","span.ansdel",function(){
   	
   	 
   	 var num=$(this).attr("num");
   	 //alert(num);
   	 
   	 var a=confirm("답변을 삭제하시겠습니까?");
   	 if(!a)
   		 return;
   	 
   	 $.ajax({
   		
   		 type:"get",
   		 dataType:"html",
   		 url:"qna/qnaanswerdelete.jsp",
   		 data:{"num":num},
   		 success:function(){
   			 answerlist();
   		 }
   		 
   		 
   	 });
   	 
   	 
    });  */
    
    });
 
   function answerlist(){
	   
	   var num=$("#num").val();
	   
	   $.ajax({
		  
		   type:"get",
		   dataType:"json",
		   url:"qna/qnaanswerlist.jsp",
		   data:{"num":num},
		   success:function(res){
			   
			   
			   var s="";
			   $.each(res,function(i,ele){
				  
				   s+="<b>Admin&nbsp;&nbsp;:&nbsp;&nbsp;"+ele.answer+"</b>";
				   s+="<span class='aday'>[답변완료]</span>";
				   s+="<span class='ansdel glyphicon glyphicon-trash'></span>";
   				
				   $("#answerlist").html(s);
				   
				   
			   });
			 
			   
		   }
		   
		   
	   });
	   
	   
   }
  
      			
    
    		
     
    
    </script> 
<title>Insert title here</title>
</head>

<%
String num=request.getParameter("num");

//String loginok=(String)session.getAttribute("loginok");

//String myid=(String)session.getAttribute("myid");


//MemberDao dao = new MemberDao();
//String num=dao.getNum(myid);


qnaDao dao=new qnaDao();
qnaDto dto=dao.getData(num);





%>
<body>

<form id="frm">

<div style="width: 870px;">
	
	<input type="hidden" id="num" value="<%=num%>">
	
	<h5 class="alert alert-success" style="margin:70px 400px; width: 870px;">1:1 문의게시글</h5>
		<table class="table table-bordered" style="margin:20px 400px;">
		
		
		   <hr id="a">
			<tr height="90" style="background-color: #f0f0f0;">
				<td>
					<%
					if (dto.getContent() == null) {
					%>
					
					<h1 style="color: gray;">저장된 내용 없음!</h1> <%
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
 					} else {%>
 							 
 							<b><%=dto.getContent()%></b>
					<%}
					%>
				</td>
					
    
			</tr>
		
</table>
</div>

</form>

<!-- 댓글폼 -->
<hr id="a">


<div id="answerlist" style="margin:5px 550px;">
댓글목록
</div>


	<div>
	  <form id="answerfrm" style="margin: 20px 500px;">
	 
	   
	   <textarea placeholder="Admin 답변을 작성해주세요" class="form-control" style="margin:100px -55px;  border: 1px solid gray" id="answer"></textarea>
	
	     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	    <button type="button" class="btn btn-default" id="addanswer">등록</button>
	    

	</form>
	 
	</div>
<div style="margin: -80px 800px;">

  	  <button type="button" class="btn btn-success" style="width:100px; height: 50px; font-size: 17px;"
	  	  onclick="location.href='index.jsp?main=qna/qnalist.jsp'">목록</button>
	

</div>

</body>
</html>