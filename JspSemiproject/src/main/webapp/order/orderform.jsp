<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.orderDao"%>
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


/* 주문 상품 정보 */
img.photo{
width: 30px;
height: 40px;
border: 1px solid lightgray;
}
div.sangpum{cursor: pointer;}
</style>
</head>
<body>
<%
DecimalFormat df = new DecimalFormat("###,###");

memberDao mdao=new memberDao();

// 주문 배송 정보 회원 값 가져오기
String myid=(String)session.getAttribute("myid");
String num=mdao.getNum(myid);
String name=mdao.getName(myid);

// 장바구니 주문 상품 정보 가져오기
orderDao dao = new orderDao();
List<HashMap<String,String>>list=dao.getOrderList(num);
%>

<div class="order-info" style="margin-left: 70px;">


<!-- 주문 정보  -->	
	<h3><%=name %>님의 주문 현황</h3>

	<br>
	<br>

	<table class="table table-striped" style="width: 80%">
		<tr>
			<th>주문 번호</th>
			<th>상품명</th>
			<th>수량</th>
			<th>가격</th>
			<th>주문 상태</th>
			<th>주문 날짜</th>
		</tr>
	
		<%
		for(int i=0; i<list.size(); i++){
		HashMap<String, String>map=list.get(i); %>
		
				<tr>
					<td style="color: gray"><%=map.get("orderid") %></td>

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
					%>
					<td><%=df.format(price) %>원</td>
					<td style="color: gray">배송 준비</td>
					<td style="color: gray"><%= map.get("orderdate") %></td>
				</tr>
		<%
		}	
		%>
		
	</table>
</div>

<script type="text/javascript">


//상품 제목 눌렀을 시 디테일 페이지로
$("div.sangpum").click(function(){
	var shopnum=$(this).attr("shopnum");
	location.href="index.jsp?main=shop/detailview.jsp?shopnum="+shopnum;
})

</script>

</body>
</html>