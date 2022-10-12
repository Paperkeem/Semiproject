
<%@page import="data.Dao.qnaDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

qnaDao dao=new qnaDao();
String num=request.getParameter("num");
String currentPage=request.getParameter("currentPage");


dao.deleteQna(num);

response.sendRedirect("../index.jsp?main=qna/qnalist.jsp");


%>