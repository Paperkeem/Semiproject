<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.shopDao"%>
<%@page import="data.Dto.cartorderDto"%>
<%@page import="data.Dao.memberDao"%>
<%@page import="data.Dto.orderitemDto"%>
<%@page import="data.Dao.orderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String orderid = request.getParameter("orderid");
String num = request.getParameter("num"); // 멤버 DB의 num 값
String myid = request.getParameter("myid"); // 멤버 DB의 num 값


// cartorder insert 하기
cartorderDto cdto = new cartorderDto();

cdto.setOrderid(orderid);
cdto.setNum(num);

orderDao odao = new orderDao();
odao.insertCartOrder(cdto);


// 리스트 불러와서 orderitem에 넣기
shopDao sdao=new shopDao();
List<HashMap<String,String>>list=sdao.getCartList(myid);

for(int i=0; i<list.size(); i++){
	HashMap<String, String>map=list.get(i);
	
	orderitemDto dto = new orderitemDto();
	
	dto.setOrderid(orderid);
	dto.setShopnum(map.get("shopnum"));
	dto.setCnt(Integer.parseInt(map.get("cnt")));
	dto.setPrice(Integer.parseInt(map.get("price")));
	
	odao.insertOrderItem(dto);
}


// 장바구니에서 삭제하기
for(int i=0; i<list.size(); i++){
	HashMap<String, String>map=list.get(i);
	sdao.deleteSangpum(map.get("idx"));
}


response.sendRedirect("../index.jsp?main=order/orderform.jsp");
%>