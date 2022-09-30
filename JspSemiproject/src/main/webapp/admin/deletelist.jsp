<%@page import="data.Dao.shopDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%

String nums=request.getParameter("nums");


String [] num=nums.split(",");


shopDao dao=new shopDao();
for(String n:num)
{
	dao.deleteShop(n);
}

response.sendRedirect("../index.jsp?main=admin/shoplist.jsp");

%>