<%@page import="data.Dao.shopDao"%>
<%@page import="data.Dto.shopDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">

body *{

font-family: 'Noto Sans KR';
}
</style>

</head>
<body>

<%

String realPath=getServletContext().getRealPath("/shopsave");
System.out.println(realPath);

int uploadSize=1024*1024*3; 

MultipartRequest multi=null;

try{
	
	
multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
		new DefaultFileRenamePolicy());


  
   String category=multi.getParameter("category");
   String sangpumtype=multi.getParameter("sangpumtype");
  
   

   

   

   String gomin=multi.getParameter("gomin");
   String sangpum=multi.getParameter("sangpum");
   String price=multi.getParameter("price");
   //int likechu=Integer.parseInt(multi.getParameter("likechu"));
   String ipgoday=multi.getParameter("ipgoday");
	

	String photo=multi.getFilesystemName("photo");
	
	

	shopDto dto=new shopDto();
	
	
	dto.setCategory(category);
    dto.setSangpumtype(sangpumtype);



	
	
	dto.setSangpum(sangpum);
	dto.setGomin(gomin);
	dto.setPrice(price);
	//dto.setLikechu(likechu);
	dto.setIpgoday(ipgoday);
	
    dto.setPhoto(photo);

  
	
	shopDao dao=new shopDao();
	
	
	dao.InsertShop(dto);
	

	response.sendRedirect("../index.jsp?main=admin/shoplist.jsp");
	
	
	
	
}catch(Exception e){
	
}
%>

</body>
</html>