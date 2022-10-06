<%@page import="data.Dao.shopDao"%>
<%@page import="data.Dto.cartDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String shopnum=request.getParameter("shopnum");
String num=request.getParameter("num");
int cnt=Integer.parseInt(request.getParameter("cnt"));

cartDto dto = new cartDto();
dto.setShopnum(shopnum);
dto.setNum(num);
dto.setCnt(cnt);

shopDao dao = new shopDao();

//장바구니에 이미 헤당 상품이 존재하는 지 확인
boolean b=dao.isCartorNot(shopnum, num);

if(b){
	// 이미 존재할 시 수량만 증가
	dao.plusCart(dto);
}else{
	// 존재하지 않을 시 insert
	dao.insertCart(dto);
}

%>