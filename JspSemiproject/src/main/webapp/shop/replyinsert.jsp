<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="data.Dao.replyDao"></jsp:useBean>
<jsp:useBean id="dto" class="data.Dto.replyDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
dao.insertReply(dto);
%>