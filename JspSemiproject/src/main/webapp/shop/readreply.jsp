<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.Dto.replyDto"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.replyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String shopnum=request.getParameter("shopnum");
int start=Integer.parseInt(request.getParameter("start")); 
int perpage=Integer.parseInt(request.getParameter("perpage"));

replyDao dao = new replyDao();
List<replyDto>list=dao.getReplyList(shopnum, start, perpage);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

JSONArray arr = new JSONArray();

// Member Dao
// MemberDao mdao=new MemberDao();

for(replyDto dto : list){
	JSONObject ob= new JSONObject();
	
	ob.put("idx", dto.getIdx());
	ob.put("shopnum", dto.getShopnum());
	ob.put("num", dto.getNum());
	
	//고쳐야 함
	// ob.put("myid", mdao.getName(dto.getMyid()));
	// ob.put("realid", dto.getMyid());
	
	ob.put("content", dto.getContent());
	ob.put("rating", dto.getRating());
	ob.put("review", dto.getReview());
	ob.put("writeday", sdf.format(dto.getWriteday()));
	
	arr.add(ob);
}

%>
<%=arr.toString()%>