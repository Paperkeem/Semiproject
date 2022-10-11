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
.name, .id, .hp {
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
  width: 330px;
  background: lightgray;
  padding: 15px;
  font-family: Noto Sans KR;
  font-size: 16px;
  border: 0;
  border-radius: 5px;
}
</style>
<script>
//핸드폰번호(-)
function addHypen(obj) {
   var number = obj.value.replace(/[^0-9]/g, "");
   var phone = "";

   if(number.length < 4) {
       return number;
   } else if(number.length < 7) {
       phone += number.substr(0, 3);
       phone += "-";
       phone += number.substr(3);
   } else if(number.length < 11) {
       phone += number.substr(0, 3);
       phone += "-";
       phone += number.substr(3, 3);
       phone += "-";
       phone += number.substr(6);
   } else {
       phone += number.substr(0, 3);
       phone += "-";
       phone += number.substr(3, 4);
       phone += "-";
       phone += number.substr(7);
   }
   obj.value = phone;
}
</script>
</head>
<body>
	<div style="background-color:white; margin:-12px -0.5% 0px -20px; text-align:center; height:200px; border: 1px solid">
	<br><br><br><h2>비밀번호 찾기</h2>
	<br>비밀번호는 이름, 아이디, 핸드폰 번호를 통해 찾으실 수 있습니다.</div>
	<form action="index.jsp?main=login/passfind2.jsp" method="post" class="form-inline">
	
	<div class="text">
	<input name="name" type="text" class="name" placeholder="이름">
	</div>
	<div class="text">
	<input name="id" type="text" class="id" placeholder="아이디">
	</div>
	
	<div class="text">
	<input name="hp" onKeyup="addHypen(this);" type="text" class="hp" placeholder="핸드폰 번호 (' - ' 없이 숫자만 입력)">
	</div>
	
	<br><button type="submit" class="btn">확인</button>

</body>
</html>