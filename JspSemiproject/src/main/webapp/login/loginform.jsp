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
<style>
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:Noto Sans KR;
}
.form-inline {
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.text {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}
.id, .pass {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}
.btn {
  cursor: pointer;
  display: inline-block;
  width: 400px;
  background: lightgray;
  padding: 15px;
  font-family: Noto Sans KR;
  font-size: 16px;
  border: 0;
  border-radius: 5px;
}
</style>
</head>
<%
//세션값 얻기
String saveok=(String)session.getAttribute("saveok");
String myid="";
if(saveok!=null){
	myid=(String)session.getAttribute("myid");
}
%>
<body>
	<div style="background-color:white; margin:-12px -0.5% 0px -20px; text-align:center; height:80px; border: 1px solid">
	<h2>로그인</h2></div>
	<form action="login/loginaction.jsp" method="post" class="form-inline">
	
	<div class="text">
	<input name="loginid" type="text" class="id" placeholder="아이디">
	</div>
	
	<div class="text">
	<input name="loginpw" type="password" class="pass" placeholder="비밀번호">
	</div>
	
	<tr>
	<td colspan="2" align="center">
	<input type="checkbox" name="cbsave"
	<%=saveok==null?"":"checked" %>>아이디저장 &nbsp;&nbsp;&nbsp;
	<a href="login/idpwfind.jsp">ID/PW 찾기 </a>&nbsp;&nbsp;
	</td>
	</tr>
	
	<br><br><button class="btn">로그인</button>
	<p class="text">회원이 아니신가요? &nbsp;&nbsp;&nbsp; <a href="index.jsp?main=member/memberform.jsp">회원가입</a></p>
	</form>

</body>
</html>