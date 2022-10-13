
<%@page import="java.util.List"%>
<%@page import="data.Dao.memberDao"%>
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
 
span.ansup,span.ansdel{
  color:#0A82FF;
  float:right;
  margin-left: 10px;
  cursor: pointer;
}
 
 #addanswer{
 
 margin-top: -315px;
 margin-left: 650px;
 height: 55px;
 width:70px;
 background-color: #4B73E1;
 color: white;
 }

    
span.aday{
    
    float: right;
    color:#828282;
    
   
    }
    

    

body *{

font-family: 'Noto Sans KR';
}

</style>
    
   <script type="text/javascript">
   
   
    $(function(){
    	
   
    
    answerlist();
    
  //댓글등록
 	var num=$("#num").val();
	//alert(num);
	
    $("#addanswer").click(function(){
    	
    	
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

    
    
   //삭제
    $(document).on("click","span.ansdel",function(){
   	
   	 
    
    
	 var num=$("#num").val();
	 var answer=$("#answer").val();
	 //alert(num);
  
   	 
   	 var a=confirm("답변을 삭제하시겠습니까?");
 
   	 
   	 $.ajax({
   		
   		 type:"get",
   		 dataType:"html",
   		 url:"qna/qnaanswerdelete.jsp",
   		 data:{"num":num,"answer":answer},
   		 success:function(){
   			 
   		   $("#answerlist").hide();
   			 
   			 if("#answer"!=null)
   			
   				 {
   				
   				   $("#answerlist").hide();
   				
   				answerlist();
   				 }
   				   $("answerlist").show();
   				$("#answerlist").show("");
   				location.reload();
   		 }
   	
   		 
   	 });
   	 
   	 
    });  
   

  //댓글목록 수정,수정모달창뜨게
	$(document).on("click","span.ansup",function(){
		
		 var num=$("#num").val();
		//alert(num);
		
		$.ajax({
			
			type:"get",
			url:"qna/updatejson.jsp",
			dataType:"json",
			data:{"num":num},
			success:function(res){
				
				
				$("#aanswer").val(res.answer);
			}
		});
		
		$("#myModal").modal();
	});
	

	//댓글수정
	$(document).on("click","#btnaupdate",function(){
		
	
		var answer=$("#aanswer").val();
		
		//alert(answer);
		$.ajax({
			type:"get",
			url:"qna/qnaanswerupdate.jsp",
			dataType:"html",
			data:{"num":num,"answer":answer},
			success:function(res)
			{
				
				answerlist();
			}
		});
	});
	
	//문의글 삭제
	 $("#qdel").click(function(){
	    	
	    	
	    	var num=$("#num").val();
	    
	    
	    	$.ajax({
	    		type:"post",
	    		url:"qna/qnadelete.jsp",
	    		dataType:"html",
	    		data:{"num":num},
	    		success:function(){
	    			
	    		
	    			
	    			//alert("success");
	    			
	    			 location.href="index.jsp?main=qna/qnalist.jsp";
	    			
	    			
	    		}
	    		});
	    		});
    
	
	
	
    });

    //댓글리스트
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
				  
				   s+="<b>관리자&nbsp;답변&nbsp;:&nbsp;&nbsp;"+ele.answer+"</b>";
				  
				   <%
				   String n=(String)session.getAttribute("myid");
				   if((n.equals("admin"))){
				   %>
					
				
				   s+="<span class='ansup glyphicon glyphicon-pencil' ></span>";
				   s+="<span class='ansdel 	glyphicon glyphicon-remove'></span>";
				  
				   <%}
				   %>
				   s+="<span class='aday'>"+ele.writeday+"</span>";
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
String currentPage = request.getParameter("currentPage");

String loginok=(String)session.getAttribute("loginok");

String myid=(String)session.getAttribute("myid");



memberDao mdao = new memberDao();
String id=mdao.getName(myid);




qnaDao dao=new qnaDao();
qnaDto dto=dao.getData(num);



%>
<body>

<form id="frm">

<div style="width: 870px;">
	
	<input type="hidden" id="num" value="<%=num%>">
	
	<h5 class="alert alert-info" style="margin:70px 400px; width: 870px;">1:1 문의게시글</h5>
		<table class="table table-bordered" style="margin:20px 400px;">

	 	

		   <hr id="a">
			<tr height="90" style="background-color: #f0f0f0;">
				<td>
					<%
					if (dto.getContent() == null) {
					%>
					
					<h1 style="color: gray;">삭제되었습니다</h1> <%
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

</div>


	<div>
	<%
	String name=(String)session.getAttribute("myid");
if(name.equals("admin")){%>
 <input type="hidden" id="myid"  value="<%=myid %>">
	  <input type="hidden" id="num" value="<%=dto.getNum()%>">

	  <form id="answerfrm" style="margin: 20px 500px;">

	   
	   <textarea placeholder="Admin 답변을 작성해주세요" class="form-control" style="margin:100px -55px;  border: 1px solid gray" id="answer"></textarea>
	
	     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	    <button type="button" class="btn btn-default" id="addanswer">등록</button>
	    

	</form>
	 
	</div>
<%}
%>

<div style="margin:40px 730px;">


  	  <button type="button" class="btn btn-info" style="width:100px; height: 50px;  font-size: 17px;"
	  	  onclick="location.href='index.jsp?main=qna/qnalist.jsp'">목록</button>
	  	

	<button type="button" class="btn btn-default" style="width:100px; height: 50px; background-color:gray; 
	color:white; font-size: 17px;"
	  	 id="qdel">삭제</button>

</div>


	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" >
    <div class="modal-dialog" style="width: 400px;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">답변을 수정해주세요</h4>
        </div>
        <div class="modal-body">
   
          <b>답변 내용을 적어주세요:</b>
          <br>
          <br>
          <input type="text" id="aanswer" style="width: 360px; height: 100px;">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"
          id="btnaupdate">수정</button>
        </div>
      </div>
      
    </div>
  </div>


</body>
</html>