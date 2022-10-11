<%@page import="data.Dao.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String cbsave=request.getParameter("cbsave"); 
	
	memberDao dao=new memberDao();
	boolean b=dao.isIdPass(id, pass);
	

	if(b){
		session.setMaxInactiveInterval(60*60*8); 
		session.setAttribute("loginok", "yes");
		session.setAttribute("myid", id);
		session.setAttribute("saveok", cbsave==null?null:"yes");
		
		
		response.sendRedirect("../index.jsp");
	}else{%>
	
		<script type="text/javascript">
			alert("아이디 또는 비번이 맞지않습니다");
			history.back();
		</script>
<%}%>