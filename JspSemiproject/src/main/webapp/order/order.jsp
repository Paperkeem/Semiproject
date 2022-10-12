<%@page import="data.Dto.memberDto"%>
<%@page import="data.Dao.memberDao"%>
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
body{font-weight: 300;}
.form-control{
border-radius: 1px !important;
border-color: #dcdcdc !important;
}
table, tr, td{
 border:none !important;
}
</style>
</head>
<body>
<%
memberDao mdao=new memberDao();
String myid=(String)session.getAttribute("myid");
String num=mdao.getNum(myid);
memberDto mdto=mdao.getOneData(num);
%>

<div style="margin-left: 70px;">
	<h3>결제하기</h3><br><br><br>
	<h4>주문/배송정보</h4>
	<hr style="width: 65%; border-color: black;">
	<table class="table" style="width: 60%">
		<tr>
			<td width="20%"><span style="color: darkred;">*</span>주문자</td>
			<td>
				<input name="id" style="width: 130px;" class="form-control" value="<%=mdto.getName() %>">
			</td>
		</tr>
		
		<tr>
			<td width="20%"><span style="color: darkred;">*</span>연락처</td>
			<td>
				<input name="id" style="width: 500px;" class="form-control" value="<%=mdto.getHp() %>">
			</td>
		</tr>
		
		<tr>
			<td width="20%"><span style="color: darkred;">*</span>이메일</td>
			<td>
				<input name="id" style="width: 500px;" class="form-control">
			</td>
		</tr>
		
		<tr>
			<td width="20%"><span style="color: darkred;">*</span>배송지 작성</td>
			<td>
				<p style="font-size: 10pt;"><span style="color: darkred;">*</span>주소</p>
				<div class="form-inline">
					<input type="text" id="sample6_postcode" placeholder="우편번호" name="adress" style="width: 100px; margin-bottom: 5px;" class="form-control">
					<button type="button" onclick="sample6_execDaumPostcode()" class="btn" style="border-radius:1px; margin-bottom: 5px; border-color: lightgray;">
					<span style="font-size: 8pt;">우편번호 검색</span></button>			
				</div>
				<input type="text" id="sample6_address" name="adress" style="width: 500px; margin-bottom: 5px;" class="form-control">
				<input type="text" id="sample6_extraAddress" name="adress" style="width: 500px; margin-bottom: 5px;" class="form-control">
				<input type="hidden" id="sample6_detailAddress" name="adress" style="width: 500px;" class="form-control">
			</td>
		</tr>
		
		<tr>
			<td>배송 요청사항</td>
			<td>
				<select name="reqest" class="form-control" style="width: 500px;">
					<option value="request1">부재시 경비(관리)실에 맡겨주세요.</option>
					<option value="request2">부재시 문앞에 놓아주세요.</option>
					<option value="request3">파손의 위험이 있는 상품이 있으니 배송에 주의해주세요.</option>
					<option value="request4">배송 전에 연락주세요.</option>
				</select>
			</td>
		</tr>
	</table>
	<hr style="width: 65%; border-color: gray;">
</div>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>