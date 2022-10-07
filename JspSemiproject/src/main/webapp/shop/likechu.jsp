<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.Dao.shopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String shopnum = request.getParameter("shopnum");
shopDao dao = new shopDao();
dao.updateLikechu(shopnum);

//증가된 Likechu값을 json으로 변환
int likechu = dao.getData(shopnum).getLikechu();
JSONObject ob = new JSONObject();
ob.put("likechu",likechu);
%>
<%=ob.toString()%>