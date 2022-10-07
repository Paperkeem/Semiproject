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
<style type="text/css">
body *{

font-family: 'Noto Sans KR';
}
</style>

</head>
<body>

<div>
<b style="margin: 30px 200px; width: 1300px; align:center;"></b>
<img alt="" src="" id="blah" style="position: absolute; left: 1300px;top:250px;max-width: 200px; max-height: 300px;">

  <form action="qna/qnaaddaction.jsp" method="post" enctype="multipart/form-data">
  <br>
  <b style="margin: 30px 500px; font-size:20px; ">QnA 게시글 등록</b>
  <h5 class="alert alert-success" style="width: 700px; margin: 50px 500px; font-size: 15px;">게시글을 등록해주세요</h5>
    <table class="table table-hover" style="margin: 10px 500px; width: 700px;">
    
    
   
    
     <tr>
     <td style="width: 150px;" ><b>문의내용</b></td>
     <td>
       <textarea placeholder="문의내용을 입력해주세요(2000자 이내)" class="form-control" name="content" style="width: 500px; height: 200px;"
       required="required"></textarea>
       <br>
      
    
    </td>
    </tr>
    

    


    
    <tr>
     <td colspan="3" align="center">
     <button type="submit" class="btn btn-success" style="width:100px; height:50px; color: white; font-size: 17px;">등록</button>
    <button type="button" class="btn btn-default" style="width:100px; height:50px; background-color:darkgray; color: white; font-size: 17px;"
    onclick="location.href='index.jsp?main=qna/qnalist.jsp'">목록</button>
    
    </td>
    </tr>
    
    </table>
 
  </form>




</div>

</body>
</html>