<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String shopnum=request.getParameter("shopnum");
String cnt=request.getParameter("cnt");
String price=request.getParameter("price");

response.sendRedirect("index.jsp?main=order/order.jsp");
%>