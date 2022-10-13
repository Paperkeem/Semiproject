<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.shopDao"%>
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
<script async type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">
body{font-weight: 300;}
.form-control{
border-radius: 1px !important;
border-color: #dcdcdc !important;
}
table, tr, td{
border:none !important;
}

/* 주문 상품 정보 */
img.photo{
width: 30px;
height: 40px;
border: 1px solid lightgray;
}
div.sangpum{cursor: pointer;}
div.order-info{position: absolute; width: 60%}
div.order-box{
position:fixed;
width: 20%;
top: 150px;
left: 70%;
}
div.order{
width:100%;
border:1px solid gray;
padding: 10px;
}
.order-btn{
border-radius: 0px;
background-color: #283C82;
font-size: 13pt;
font-weight:500;
color: white;
border: none;
width:100%;
margin-top: 10px;
padding: 15px;
}
</style>
</head>
<body>
<%
memberDao mdao=new memberDao();


// 주문 배송 정보 회원 값 가져오기
String myid=(String)session.getAttribute("myid");
String num=mdao.getNum(myid);

memberDto mdto=mdao.getOneData(num);

// 장바구니 주문 상품 정보 가져오기
shopDao dao=new shopDao();
List<HashMap<String,String>>list=dao.getCartList(myid);

DecimalFormat df = new DecimalFormat("###,###");
int result=0;
%>

<div class="order-info" style="margin-left: 70px;">
	<h3>결제하기</h3><br><br><br>
	<h4>주문/배송정보</h4>
	<hr style="width: 90%; border-color: black;">
	<table class="table" style="width: 100%">
		<tr>
			<td width="20%"><span style="color: darkred;">*</span>주문자</td>
			<td>
				<input name="name" id="name" style="width: 130px;" class="form-control" value="<%=mdto.getName() %>">
			</td>
		</tr>
		
		<tr>
			<td width="20%"><span style="color: darkred;">*</span>연락처</td>
			<td>
				<input name="hp" id="hp" style="width: 500px;" class="form-control" value="<%=mdto.getHp() %>">
			</td>
		</tr>
		
		<tr>
			<td width="20%"><span style="color: darkred;">*</span>이메일</td>
			<td>
				<input name="email" id="email" style="width: 500px;" class="form-control">
			</td>
		</tr>
		
		<tr>
			<td width="20%"><span style="color: darkred;">*</span>배송지 작성</td>
			<td>
				<p style="font-size: 10pt;"><span style="color: darkred;">*</span>주소</p>
				<div class="form-inline">
					<input type="text" id="sample6_postcode" placeholder="우편번호" name="postcode" style="width: 100px; margin-bottom: 5px;" class="form-control">
					<button type="button" onclick="sample6_execDaumPostcode()" class="btn" style="border-radius:1px; margin-bottom: 5px; border-color: lightgray;">
					<span style="font-size: 8pt;">우편번호 검색</span></button>			
				</div>
				<input type="text" id="sample6_address" name="adress1" style="width: 500px; margin-bottom: 5px;" class="form-control">
				<input type="text" id="sample6_extraAddress" name="adress2" style="width: 500px; margin-bottom: 5px;" class="form-control">
				<input type="hidden" id="sample6_detailAddress" style="width: 500px;" class="form-control">
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
	<hr style="width: 90%; border-color: gray;">
	
	<br><br><br>
 	
 	<!-- 주문 정보  -->	
	<h4>주문 상품 정보</h4>
	<hr style="width: 90%; border-color: black;">
	<table class="table" style="width: 90%">
	
		<%
		for(int i=0; i<list.size(); i++){
		HashMap<String, String>map=list.get(i); %>
		
				<tr>
					<td>
						<div shopnum="<%=map.get("shopnum") %>" class="sangpum">
							<img src="shopsave/<%=map.get("photo")%>" class="photo">&nbsp;&nbsp;
							<%=map.get("sangpum") %>&nbsp;&nbsp;
						</div>
					</td>
					<td><%=map.get("cnt") %>개</td>
					<%
					int price = Integer.parseInt(map.get("price"));
					int cnt = Integer.parseInt(map.get("cnt"));
					result += (price * cnt) ;
					%>
					<td><%=df.format(price * cnt) %>원</td>
				</tr>
		<%
		}	
		int baesong = (result >= 20000) ? 0 : 2500 ; 
		%>
		
	</table>
	<hr style="width: 90%; border-color: gray;">
</div>

<!-- 결제 창 -->
<div class="order-box">
<h4>결제 예정 금액</h4>
<div class="order">
<p>주문금액 <span style="float: right;"><%=df.format(result) %>원</span></p>
<p>배송비 <span style="float: right;"><%=baesong %>원</span></p>
<hr style="color: lightgray; width: 96%; margin: auto;">
<br>
<p>최종 결제 금액 <span style="float: right;"><b><%=df.format(result+baesong) %>원</b></span></p>
<input type="checkbox" style="border-radius: 0px;" checked="checked">
<label style="font-weight: 300; color: gray;">[필수] 구매 조건 및 결제 진행 동의</label>
<p style="font-size:7pt; color: lightgray;">주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며, 
구매 진행에 동의 하시겠습니까? (전자상거래법 제8조 제2항)</p>
<p style="font-size:7pt; color: gray;">해당 상품 구매 계약자가 미성년자일 경우
법정대리인이 동의하지 아니하면 미성년자 본인
또는 법정대리인은 이 계약을 취소할 수 있습니다.</p>
</div>
<button class="order-btn" onclick="requestPay()"><%=df.format(result+baesong) %>원 결제하기</button>
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



<script type="text/javascript">

var name = $("#name").val();
var email = $("#email").val();
var hp = $("#hp").val();
var postcode = $("#sample6_postcode").val();
var addr = $("#sample6_address").val();
var amount = <%=result+baesong %>

function requestPay() {
    // IMP.request_pay(param, callback) 결제창 호출
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp32155874"); // 예: imp00000000
    IMP.request_pay({ // param
        pg: 'kakaopay',
        pay_method: "card",
        merchant_uid: 'merchant_' + new Date().getTime(), // 상점에서 관리하는 주문 번호
        name: 'SKINLAB',
        amount: amount,
        buyer_email: email,
        buyer_name: name,
        buyer_tel: hp,
        buyer_addr: addr,
        buyer_postcode: postcode

    }, function (rsp) { // callback
        if (rsp.success) {
       		location.href='index.jsp?main=order/success.jsp?orderid='+ rsp.merchant_uid;
       		 
	    } else {
	        var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
    });
  }
</script>

</body>
</html>