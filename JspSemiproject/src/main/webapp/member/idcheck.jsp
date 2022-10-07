<%@page import="data.Dao.memberDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
memberDao dao=new memberDao();
int count=dao.isIdcheck(id);
JSONObject ob=new JSONObject();
ob.put("count",count);
%>
<%=ob.toString()%>