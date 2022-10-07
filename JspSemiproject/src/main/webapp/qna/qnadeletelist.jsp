<%@page import="data.Dao.qnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String nums=request.getParameter("nums");


String [] num=nums.split(",");

qnaDao dao=new qnaDao();
for(String n:num)
{
	dao.deleteQna(n);
}

response.sendRedirect("../index.jsp?main=qna/qnalist.jsp");

%>