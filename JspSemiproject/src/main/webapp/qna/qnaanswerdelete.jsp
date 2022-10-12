<%@page import="data.Dao.qnaDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String num=request.getParameter("num");
String answer=request.getParameter("answer");

qnaDao dao=new qnaDao();
dao.deleteAnswer(num, answer);

%>