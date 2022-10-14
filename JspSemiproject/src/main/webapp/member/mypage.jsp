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
centered { display: table; margin-left: auto; margin-right: auto; }
*{
margin:10;
padding: 10;
box-sizing: border-box;
font-family: Noto Sans KR;
}
.container{
max-width: 900px;
width: 300%;
padding: 60px 60px 60px 60px;
background: lightgray;
margin:75px;
border-radius: 200px;
box-shadow: 5px 5px
}
.content{
display: flex;
align-items: center;
justify-content: space-between;
}
.content .list {
display: flex;
flex-direction: column;
width: 20%;
margin-right: 100px;
position: relative;
}
.content .list label {
height: 60px;
font-size: 14px;
font-weight: 500;
line-height: 50px;
cursor: pointer;
padding-left: 25px;
transition: all 0.5s ease;
z-index: 12;
color: black;
}
.delete{
color : black;
}
.content .slider {
position: absolute;
left: 0;
top: 0;
height: 100px;
width: 100px;
border-radius: 100px;
}
.content .slider{
position: absolute;
left:0;
top: 0;
height: 60px;
width: 100%
border-radius: 12px;
transition: all 0.5s ease;
}
</style>
</head>
<body>
   <div style="background-color:white; margin:-12px -0.5% 0px -20px; text-align:center; height:200px; border: 1px solid">
   <br><br><br><h2>마이페이지</h2></div>
   <div class="container">
   <div class="content">
   <input type="radio" name="slider" checked id="info">
   <input type="radio" name="slider" id="modify">
   <input type="radio" name="slider" id="pass">
   <input type="radio" name="slider" id="delete">
   
   <div class="list">
   <label for="info" class="info">
   <i class="fa fa-info-circle" aria-hidden="true"></i>
   <span class="title">내 정보 보기</span></label>
   <label for="modify" class="modify">
   <span class="icon"><i class="fa fa-pen" aria-hidden="true"></i></span>
   <span class="title">내 정보 수정</span></label>
   <label for="pass" class="pass">
   <span class="icon"><i class="fa fa-unclock-alt" aria-hidden="true"></i></span>
   <span class="title">비밀번호 변경</span></label>
   <label for="delete" class="delete">
   <span class="icon"><i class="fa fa-minus-circle" aria-hidden="true"></i></span>
   <span class="title">회원 탈퇴</span></label>
   <div class="slider"></div>
   </div>
   
   <div class="text-content2">
   
   <div class="text-content3">
   <div class="pass text">
   <div class="title">비밀번호 변경</div>
   <form action="member/updatepass" method="post" id="updatepass">
   <p class="visibility underline">
   현재 비밀번호 : <input type="password" name="pass"><br><br>
   새 비밀번호 : <input type="password" name="newpass" id="newpass"><br>
   <i class="fa fa-unlock-alt" aria-hidden="true"></i>
   <input type="sumbit" value="변경하기" class="btn" id="updatepass">
   </p>
   </form>
   </div>
   </div>
   
   <div class="delete text">
   <div class="title">회원 탈퇴</div>
   <form action="/member/deletemember.jsp" method="post" class="visibility"
   id="deleteform">
   <p><span style="color:green">SkinLab</span>
   웹사이트에서 회원님의 계정이 삭제됩니다.<br>
   탈퇴 시 개인정보 및 이용 정보가 삭제되며 복구할 수 없습니다.<br>
   본인의 비밀번호를 입력한 후 하단의 탈퇴하기를 눌러주세요.</p>
   <br>
   <div><p>비밀번호: <input type="password" id="pass" name="pass" class="pass"></p>
   </div>
   <input type="button" value="탈퇴하기" class="btn" id="delete">
   </form>
   </div>
   
   </div>
   </div>
</body>
</html>