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
  width:1400px;
  height:400px;
  padding: 30px, 20px;
  top:45%;
  left:70%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
  font-size: 12pt;
  }
  .btn {
  cursor: pointer;
  display: inline-block;
  width: 150px;
  height: 40px;
  background: lightgray;
  padding: 15px;
  font-family: Noto Sans KR;
  font-size: 12pt;
  border: none;
  border-radius: 5px;
}

</style>

<script type="text/javascript">
$(function(){
	
	//id중복체크
	$("#btncheck").click(function(){
	
		//id읽기
		var id=$("#id").val();
		//alert(id);
		
		$.ajax({
			type:"get",
			url:"member/idcheck.jsp",
			dataType:"json",
			data:{"id":id},
			success:function(res){
				console.log(res.count);
				if(res.count==1){
					//alert("이미 가입된 아이디입니다 \n다시 입력해주세요");
					$("span.idsuccess").text('가입불가');
					$("#id").val(' ');
				}else{
					//alert("가입이 가능한 아이디입니다");
					$("span.idsuccess").text('가입가능');
				}
			}
		});
	});
	

});

	//비밀번호체크
	function check(f)
	{
		if(f.pass.value!=f.pass2.value){
			alert("비밀번호가 서로 다릅니다");
			f.pass.value="";
			f.pass2.value="";
			return false; //action이 호출되지 않는다
		}
	}
	
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
	<br><br><br><h2>회원가입</h2></div>
	<form method="post" class="form-inline">
	<table class="table table-bordered" style="width: 630px;">
   
   <tr>
   <th width="200" height="50">이름</th>
   <td>
   <input type="text" name="name" class="form-control" required="required"
   style="width: 100px;">
   </td>
   </tr>
   
   <tr>
   <th width="200" height="50">아이디</th>
   <td>
   <input type="text" name="id" class="form-control" required="required"
   style="width: 150px;">
   <button type="button"  class="btn2" id="btncheck">중복체크</button>
   <span class="idsuccess" style="color: gray; margin-left: 10px;"></span>
   </td>
   </tr>
   
   <tr>
   <th width="200">비밀번호</th>
   <td>
   <input type="password" name="pass" class="form-control" required="required"
   style="width: 250px;" placeholder="비밀번호"><br><br>
   <input type="password" name="pass2" class="form-control" required="required"
   style="width: 250px;" placeholder="비밀번호 확인">
   <br>8~16 자 영문 대소문자,숫자,특수문자 조합하여 설정
   </td>
   </tr>
   
   <tr>
   <th width="200">핸드폰 번호</th>
   <td>
   <input type="text" onKeyup="addHypen(this);" name="hp" class="form-control"
	required="required" placeholder="' - ' 없이 숫자만 입력"
   style="width: 250px;">
   </td>
   </tr>
   
    <tr>
    <th width="200" height="43">피부 타입</th>
    <td text align="center">
    <input type="radio" name="type" value="지성">지성&nbsp;
    <input type="radio" name="type" value="건성">건성&nbsp;
    <input type="radio" name="type" value="복합성">복합성&nbsp;
    <input type="radio" name="type" value="중성">중성&nbsp;
    </td>
    </tr>
 
 	<tr>
 	<th width="200">피부 고민</th>
 	<td text align="center">
	<input type="radio" name="gomin" value="모공">모공&nbsp;
	<input type="radio" name="gomin" value="피부결">피부결&nbsp;
	<input type="radio" name="gomin" value="주름">주름&nbsp;
	<input type="radio" name="gomin" value="탄력">탄력&nbsp;
	<input type="radio" name="gomin" value="트러블">트러블&nbsp;<br>
	<input type="radio" name="gomin" value="각질">각질&nbsp;
	<input type="radio" name="gomin" value="민감성">민감성&nbsp;
	<input type="radio" name="gomin" value="피지과다">피지과다&nbsp;
	<input type="radio" name="gomin" value="기타">기타&nbsp;
	</td>
 	</tr>
	
	<tr>
 	<td align="center" colspan="2">
	<button type="button" class="btn"
	onclick="location.href='member/memberadd.jsp'">회원가입 완료</button>
	<button type="button" class="btn"
	onclick="location.href='index.jsp?main=login/loginform.jsp'">취소</button>
 	</td>
 	</tr>
  	</table>
	</form>
</body>
</html>