<%@page import="data.Dao.replyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String idx=request.getParameter("idx");
replyDao dao = new replyDao();
dao.deleteReply(idx);
%>