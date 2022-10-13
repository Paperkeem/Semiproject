<%@page import="data.Dto.orderitemDto"%>
<%@page import="data.Dao.orderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

orderDao dao = new orderDao();


// 아이디 고유 번호에 따른 orderid 생성후 아이디 값에 따라서 가져오기
String num = request.getParameter("num");
dao.makeOrderid(num);
String orderid = dao.getOrderid(num);

String shopnum=request.getParameter("shopnum");
int cnt=Integer.parseInt(request.getParameter("cnt")); 
int price=Integer.parseInt(request.getParameter("price")); 

orderitemDto dto = new orderitemDto();

dto.setOrderid(orderid);
dto.setShopnum(shopnum);
dto.setCnt(cnt);
dto.setPrice(price);

dao.insertOrderItem(dto);

// response.sendRedirect("../index.jsp?main=order/order.jsp");
%>