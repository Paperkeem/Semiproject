<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.Dto.qnaDto"%>
<%@page import="data.Dao.qnaDao"%>
<%@page import="javax.xml.namespace.QName"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String num=request.getParameter("num");
qnaDao dao=new qnaDao();
qnaDto dto=dao.getData(num);

JSONObject ob=new JSONObject();
ob.put("num", dto.getNum());
ob.put("answer", dto.getAnswer());

%>
<%=ob.toString()%>