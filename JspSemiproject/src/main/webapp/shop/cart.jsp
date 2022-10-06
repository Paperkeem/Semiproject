<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.shopDao"%>
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
img.photo{
width: 30px;
height: 40px;
border: 1px solid lightgray;
}
div.sangpum{cursor: pointer;}
td{vertical-align : bottom;}
</style>
</head>
<%
//String id=(String)session.getAttribute("myid");
String id="paper";

shopDao dao=new shopDao();
List<HashMap<String,String>>list=dao.getCartList(id);

DecimalFormat df = new DecimalFormat("###,###");
int result=0;
%>
<body>
<br>
<form style="width: 80%; margin: auto;">
	<table class="table table-striped">
		<tr>
			<th><input type="checkbox" id="allcheck"></th>
			<th>상품명</th>
			<th>수량</th>
			<th>가격</th>
			<th>배송구분</th>
			<th>배송비</th>
			<th>합계</th>
			<th>선택</th>
		</tr>
		<%
		if(list.size() == 0)
		{%>
			<tr>			
				<td colspan="10" style="text-align: center; color: lightgray;">장바구니에 담긴 상품이 존재하지 않습니다</td>
			</tr>	
		<%}else
		{
		for(int i=0; i<list.size(); i++){
		HashMap<String, String>map=list.get(i);	
		%>
				<tr>
					<td>
						<input type="checkbox" name="idx" class="idx" idx="<%=map.get("idx")%>">
					</td>
					<td>
						<div shopnum="<%=map.get("shopnum") %>" class="sangpum">
							<img src="shopsave/<%=map.get("photo")%>" class="photo">&nbsp;&nbsp;
							<%=map.get("sangpum") %>&nbsp;&nbsp;
						</div>
					</td>
					<td><%=map.get("cnt") %></td>
					<%
					int price = Integer.parseInt(map.get("price"));
					int cnt = Integer.parseInt(map.get("cnt"));
					result += (price * cnt) ;
					%>
					<td><%=df.format(price) %></td>
					<td>당일배송</td>
					<td>2,500원</td>
					<td><%=df.format(price * cnt) %></td>
					<td><button type="button" class="btn btn-xs del" idx="<%=map.get("idx")%>"><b>삭제</b></button></td>
				</tr>	
		<%
		}	
		}
		int baesong = (result >= 20000) ? 0 : 2500 ; 
		%>
		<tr>
			<td colspan="10" style="text-align: right; color: gray;">상품 구매금액 <%=df.format(result) %> + 배송비 <%=baesong %> = <b style="color: black; font-size: 1.3em;">합계: <%=df.format(result+baesong) %>원<b></td>
		</tr>
	</table>
	<hr>
	선택상품을&nbsp;&nbsp;<button type="button" class="btn btn-sm" id="btndel"><span class="glyphicon glyphicon-remove"> <b style="margin-top: -10px;">삭제하기</b></span></button>
	<button type="button" class="btn btn-danger btn-sm" style="float: right;"><span class="glyphicon glyphicon-shopping-cart"> <b style="color:white; margin-top: -10px;">주문하기</b></span></button>
</form>


<script type="text/javascript">

//상품 제목 눌렀을 시 디테일 페이지로
$("div.sangpum").click(function(){
	var shopnum=$(this).attr("shopnum");
	location.href="index.jsp?main=shop/detailview.jsp?shopnum="+shopnum;
})

// 체크값 넘기기
$("#allcheck").click(function(){
	var chk = $(this).is(":checked");
	// alert(chk); // true
	$(".idx").prop("checked",chk);
});

// 전체 삭제하기
$("#btndel").click(function(){
	var len=$(".idx:checked").length;
	// alert(len);
	if(len==0){
		alert("삭제를 위해 최소 1개 이상의 상품을 선택해주세요");
	}else{
		var a = confirm(len+"개의 상품을 장바구니에서 삭제합니다")
		var n="";
		if(a){
			$(".idx:checked").each(function(idx){
				n+=$(this).attr("idx")+",";
			});
			n=n.slice(0,-1);
			location.href="shop/cartdelete.jsp?idx="+n;
		}
	}
});

// 개별 삭제
$("button.del").click(function(){
	var idx=$(this).attr("idx");
	alert("해당 상품을 장바구니에서 삭제합니다");
	location.href="shop/cartdelete.jsp?idx="+idx;
})
</script>
</body>
</html>