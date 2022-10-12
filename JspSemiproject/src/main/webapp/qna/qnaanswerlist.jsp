<%@page import="org.json.simple.JSONObject"%>
<%@page import="netscape.javascript.JSObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.Dto.qnaDto"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.qnaDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String num=request.getParameter("num");
qnaDao dao=new qnaDao();
List<qnaDto>list=dao.getAnswerList(num);
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

JSONArray arr=new JSONArray();

for(qnaDto dto:list)
{
	JSONObject ob=new JSONObject();
	ob.put("num", dto.getNum());
	ob.put("myid", dto.getMyid());
	ob.put("pass", dto.getPass());
	ob.put("content", dto.getContent());
	ob.put("answer", dto.getAnswer());
	ob.put("writeday", sdf.format(dto.getWriteday()));
	
	
	arr.add(ob);
	
}

%>
<%=arr.toString()%>