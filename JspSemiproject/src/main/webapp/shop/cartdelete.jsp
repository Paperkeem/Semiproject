<%@page import="data.Dao.shopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String idx=request.getParameter("idx");
String [] idxs = idx.split(",");

shopDao dao=new shopDao();

for(int i=0; i<idxs.length; i++){
	dao.deleteSangpum(idxs[i]);
}

response.sendRedirect("../index.jsp?main=shop/cart.jsp");
%>