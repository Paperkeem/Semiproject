<%@page import="data.Dto.shopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.shopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SIMPLE MEGAMENU</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=root %>/menu/menustyle.css">
<!-- Font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
<style type="text/css">
</style>
</head>
<body>

<!-- 메뉴바  -->
<div class = "main-wrapper">
      <nav class = "navbar">
        <div class = "brand-and-icon">
          <a href = "<%=root %>/index.jsp" class = "navbar-brand">SkinLab</a>
          <!-- <button type = "button" class = "navbar-toggler">
            <i class = "fas fa-bars"></i>
          </button> -->
        </div>

        <div class = "navbar-collapse">
          <ul class = "navbar-nav">
            <li>
              <a href = "<%=root %>/index.jsp"><h5>HOME</h5></a>
            </li>

            <li>
              <a href = "index.jsp?main=shop/listgomin.jsp" class = "menu-link">
                <h5>나의 피부타입 아이템 &nbsp;</h5>
                <span class = "drop-icon">
                  <i class = "fas fa-chevron-down"></i>
                </span>
              </a>
              <div class = "sub-menu">
                <!-- item -->
                <div class = "sub-menu-item">
                  <h4></h4>
                  <ul>
                    <li gomin="1"><a href = "index.jsp?main=shop/listgomin.jsp?gomin=1"><h5>모공</h5></a></li>
                    <li gomin="2"><a href = "index.jsp?main=shop/listgomin.jsp?gomin=2"><h5>피부결</h5></a></li>
                    <li gomin="3"><a href = "index.jsp?main=shop/listgomin.jsp?gomin=3"><h5>주름</h5></a></li>
                    <li gomin="4"><a href = "index.jsp?main=shop/listgomin.jsp?gomin=4"><h5>탄력</h5></a></li>
                    
                  </ul>
                </div>
                <!-- end of item -->
                <!-- item -->
                <div class = "sub-menu-item">
                  <h4></h4>
                  <ul>
                    <li gomin="5"><a href = "index.jsp?main=shop/listgomin.jsp?gomin=5"><h5>트러블</h5></a></li>
                    <li gomin="6"><a href = "index.jsp?main=shop/listgomin.jsp?gomin=6"><h5>각질</h5></a></li>
                    <li gomin="7"><a href = "index.jsp?main=shop/listgomin.jsp?gomin=7"><h5>민감성</h5></a></li>
                    <li gomin="8"><a href = "index.jsp?main=shop/listgomin.jsp?gomin=8"><h5>피지과다</h5></a></li>
                    <h4></h4>
                  </ul>
                </div>
                <!-- end of item -->
              </div>
            </li>

            <li category="skincare_cleansing" >
              <a href = "index.jsp?main=shop/shoplist.jsp?category=skincare_cleansing" class = "menu-link">
                <h5>스킨케어 & 클렌징 &nbsp;</h5>
                <span class = "drop-icon">
                  <i class = "fas fa-chevron-down"></i>
                </span>
              </a>
              <div class = "sub-menu">
                <!-- item -->
                <div class = "sub-menu-item">
                  <h4></h4>
                  <ul>																								
                    <li sangpumtype="toner_loction"><a href = "index.jsp?main=shop/shoplist.jsp?sangpumtype=toner_loction&category=skincare_cleansing"><h5>토너/로션</h5></a></li>
                    <li sangpumtype="cream_jell"><a href = "index.jsp?main=shop/shoplist.jsp?sangpumtype=cream_jell&category=skincare_cleansing"><h5>크림/젤</h5></a></li>
                    <li sangpumtype="essence_serum"><a href = "index.jsp?main=shop/shoplist.jsp?sangpumtype=essence_serum&category=skincare_cleansing"><h5>에센스/세럼</h5></a></li>
                    <h4></h4>
                  </ul>
                </div>
                <!-- end of item -->
                <!-- item -->
                <div class = "sub-menu-item">
                  <h4></h4>
                  <ul>
                    <li sangpumtype="mask_pack" ><a href = "index.jsp?main=shop/shoplist.jsp?sangpumtype=mask_pack&category=skincare_cleansing"><h5>마스크/팩</h5></a></li>
                    <li sangpumtype="cleansing" ><a href = "index.jsp?main=shop/shoplist.jsp?sangpumtype=cleansing&category=skincare_cleansing"><h5>클렌징</h5></a></li>
                    <h4></h4>
                  </ul>
                </div>
                <!-- end of item -->
              </div>
            </li>

            <li category="facemakeup" >
              <a href = "index.jsp?main=shop/facelist.jsp?category=facemakeup" class = "menu-link">
                <h5>페이스 메이크업 &nbsp;</h5>
                <span class = "drop-icon">
                  <i class = "fas fa-chevron-down"></i>
                </span>
              </a>
              <div class = "sub-menu">
                <!-- item -->
                <div class = "sub-menu-item">
                  <h4></h4>
                  <ul>
                    <li sangpumtype="base_foundation"><a href = "index.jsp?main=shop/facelist.jsp?sangpumtype=base_foundation&category=facemakeup"><h5>베이스/파운데이션</h5></a></li>
                    <li sangpumtype="blush_highlighter"><a href = "index.jsp?main=shop/facelist.jsp?sangpumtype=blush_highlighter&category=facemakeup"><h5>블러셔/하이라이터</h5></a></li>
                    <li sangpumtype="eyeshadow" ><a href = "index.jsp?main=shop/facelist.jsp?sangpumtype=eyeshadow&category=facemakeup"><h5>아이섀도우</h5></a></li>
                    <h4></h4>
                  </ul>
                </div>
                <!-- end of item -->
                <!-- item -->
                <div class = "sub-menu-item">
                  <h4></h4>
                  <ul>
                    <li sangpumtype="eyeliner_brow"><a href = "index.jsp?main=shop/facelist.jsp?sangpumtype=eyeliner_brow&category=facemakeup"><h5>아이라이너/브로우</h5></a></li>
                    <li sangpumtype="mascara"><a href = "index.jsp?main=shop/facelist.jsp?sangpumtype=mascara&category=facemakeup"><h5>마스카라</h5></a></li>
                    <li sangpumtype="lip"><a href = "index.jsp?main=shop/facelist.jsp?sangpumtype=lip&category=facemakeup"><h5>립 메이크업</h5></a></li>
                    <h4></h4>
                  </ul>
                </div>
                <!-- end of item -->
              </div>
            </li>
			
			<li category="body_haircare" >
              <a href = "index.jsp?main=shop/bodyhairlist.jsp?category=body_haircare" class = "menu-link">
                <h5>바디 & 헤어케어 &nbsp;</h5>
                <span class = "drop-icon">
                  <i class = "fas fa-chevron-down"></i>
                </span>
              </a>
              <div class = "sub-menu">
                <!-- item -->
                <div class = "sub-menu-item">
                  <h4></h4>
                  <ul>
                    <li sangpumtype="body_care"><a href = "index.jsp?main=shop/bodyhairlist.jsp?sangpumtype=body_care&category=body_haircare"><h5>바디케어</h5></a></li>
                    <li sangpumtype="hairstyling"><a href ="index.jsp?main=shop/bodyhairlist.jsp?sangpumtype=hairstyling&category=body_haircare"><h5>헤어스타일링</h5></a></li>
                    <li sangpumtype="perfume"><a href = "index.jsp?main=shop/bodyhairlist.jsp?sangpumtype=perfume&category=body_haircare"><h5>향수</h5></a></li>
                    <h4></h4>
                  </ul>
                </div>
                <!-- end of item -->
                <!-- item -->
                <div class = "sub-menu-item">
                  <h4></h4>
                  <ul>
                    <li sangpumtype="beauty_accessories"><a href = "index.jsp?main=shop/bodyhairlist.jsp?sangpumtype=beauty_accessories&category=body_haircare"><h5>미용소품</h5></a></li>

                    <h4></h4>
                  </ul>
                </div>
                
                <!-- end of item -->
            </li>
			
            <li>
              <a href = "#"><h5>Q&A</h5></a>
            </li>
            
            <li>
              <a href = "index.jsp?main=admin/shoplist.jsp"><h5>admin</h5></a>
            </li>
          </ul>
        </div>
      </nav>
</div>



<!--jQuery-->
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="<%=root %>/menu/menuscript.js"></script>
</body>
</html>