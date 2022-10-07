<%@page import="java.text.DecimalFormat"%>
<%@page import="data.Dto.shopDto"%>
<%@page import="data.Dao.shopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="shop/star.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
body * {
font-family: "Noto Sans KR";
color: black;
}
/* 헤더 페이지 네이션 스타일 */
.location .intag{
float:left;
color:gray;
}
div.intag *{
color:gray;
font-size: 9pt;
}
div.inner{
padding-bottom: 10px;
}

#menu1,#menu2{
width:60px;
background :none;
border: 0;
padding :0;
padding-bottom: 2px;
}

/* 상품 설명 박스 스타일 */
.star{color: lightgray;}

.photo-wrap{
border: 0px solid gray;
}
.sanpumImage{
width: 300px;
display : block;
margin : auto;
}
.border-box{
border-bottom: 1px solid lightgray; 
padding-top: 20px; 
padding-bottom: 20px;
font-weight: 500;
}
.full-border-box{
border: 1px solid lightgray; 
padding: 10px 20px 10px 20px; 
font-weight: 500;
}
#plus, #minus{
cursor: pointer;
}
.btn-like, .btn-order, .btn-cart{
height: 60px;
}
</style>
</head>
<%
String shopnum = request.getParameter("shopnum");
String num = "1";
shopDao dao = new shopDao();
shopDto dto = dao.getData(shopnum);

int price = Integer.parseInt(dto.getPrice());
DecimalFormat df = new DecimalFormat("###,###");

// 리뷰 5개씩 불러올 변수
// 페이징에 필요한 변수
int totalCount;
int totalPage; // 총 페이지수
int startPage; // 각 블럭의 시작페이지
int endPage; // 각 블럭의 끝페이지
int start; // 각 페이지의 시작번호
int perPage=5; // 한 페이지당 보여질 글의 개수
int perBlock=5; // 한 블럭당 보여지는 페이지 개수
int currentPage; // 현재 페이지
int no;

// 총 개수 : 
	totalCount=dao.getTotalCount();

// 현재 페이지 번호 읽기(null일 경우는 1 페이지로 설정)
if(request.getParameter("currentPage")==null){
	currentPage=1;
}else{
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
}

// 총 페이지 갯수 구하기
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

// 각 블럭의 시작 페이지(현재페이지 3이면 시작 : 1 끝 : 5)
// 각 블럭의 시작 페이지(현재페이지 6이면 시작 : 6 끝 : 10)
startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;

// 총 페이지수가 8 .. 2번째 블럭은 startpage: 6 endpage: 10.. endpage 8로 수정
if(endPage>totalPage){
	endPage=totalPage;
}

// 각 페이지에서 불러올 시작 번호
// 현재 페이지가 1일 경우 start 1, 현재 페이지 2일 경우 start 6
start=(currentPage-1)*perPage;

// 각 페이지에서 필요한 게시글 불러오기
// List<SmartDto> list=dao.getList(start, perPage);

// 각 글 앞에 붙일 시작 번호
// 총 글이 만약에 20개면 1페이지는 20부터 2페이지는 15부터
// 출력해서 1씩 감소하면서 출력
no=totalCount-(currentPage-1)*perPage;


%>
<body>

<!-- 페이지 탭 -->
	<div class="location" style="margin-left: 70px;">
		<div class="inner">
			<div class="intag">
				<a href="index.jsp">홈</a> &nbsp;>&nbsp;
				</div>
				<div class="dropdown intag">
	    	<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">카테고리
	    	<span class="caret"></span></button>&nbsp;>
	   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu1" >
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/shoplist.jsp">스킨케어&클렌징</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/shoplist.jsp">페이스메이크업</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/shoplist.jsp">바디&헤어케어</a></li>
	      		<li role="presentation" class="divider"></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp">피부고민</a></li>
	    	</ul>
	  		</div>
	  		<div class="dropdown intag">
	  		<button class="btn btn-default dropdown-toggle" type="button" id="menu2" data-toggle="dropdown">고민별
	    	<span class="caret"></span></button>
	   		 <ul class="dropdown-menu" role="menu" aria-labelledby="menu2">
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=1">모공</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=2">피부결</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=3">주름</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=4">탄력</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=5">트러블</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=6">각질</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=7">민감성</a></li>
	      		<li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp?main=shop/listgomin.jsp?gomin=8">피지과다</a></li>
	    	</ul>
	  		</div>
		</div> 
  	</div>

<br>


<div class="container">

	<!-- 상품 설명 섹션 -->
	<div class="row">
		
		<!-- 이미지 박스 -->
		<div class="col-md-6 photo-wrap">
			<img class="sanpumImage" src="shopsave/<%=dto.getPhoto()%>">
		</div>
		
		<!-- 상품 설명 박스 -->
		<div class="col-md-6">
		
		<!-- 히든값 넘기기 -->
		<form id="frm">
			<input type="hidden" name="shopnum" value=<%=shopnum %>>
			<input type="hidden" name="num" value=<%=num %>>
				
				<div class="border-box" style="padding-top: 20px; padding-bottom: 20px;">
					<p style="font-weight: 400; font-size: 25pt;"><%=dto.getSangpum() %></p>
					<span class="star glyphicon glyphicon-star"></span>
					<span class="star glyphicon glyphicon-star"></span>
					<span class="star glyphicon glyphicon-star"></span>
					<span class="star glyphicon glyphicon-star"></span>
					<span class="star glyphicon glyphicon-star"></span>
					<span>0.0점</span>
					<span style="color: gray;">(0건)</span>
				</div>
				
				
				<div class="border-box">
					<span style="font-size: 13pt; margin-right: 150px;">판매가</span>
					<span style="font-size: 15pt;"><%=df.format(price) %>원</span>
				</div>
				
				<div class="border-box">
					<span style="font-size: 13pt; margin-right: 150px;">배송비</span>
					<span style="font-size: 13pt;">2,500원(20,000원 이상 구매 시 무료)</span>
				</div>
				
				<br>
				
				<div class="full-border-box">
					<p>단일 옵션</p>
					<br>
					<div class="input-group" style="width: 120px;">
				   	  <span class="input-group-addon" id="minus" style="background-color: white;"><i class="glyphicon glyphicon-minus"></i></span>
				   	  <input type="text" class="form-control" id="cnt" name="cnt" value="1" style="text-align: center;">
				   	  <span class="input-group-addon" id="plus" style="background-color: white;"><i class="glyphicon glyphicon-plus"></i></span>
					</div>
	    		 	<span class="part-price" style="float: right;"><%=df.format(price) %>원</span>
	    		 	<div style="clear: both;"></div>
				</div>
				<h3 style="float: right;">합계 &nbsp;&nbsp;<span class="part-price" style="font-size: 20pt; color: gray;"><%=df.format(price) %>원</span></h3>
				
				<hr style="width: 100%; color: gray;">
				
				<div>
					<button type="button" class="btn btn-default btn-like" style="width: 10%;"><span class="glyphicon glyphicon-heart"></span></button>
					<button type="button" class="btn btn-default btn-cart" style="width: 44%; background-color: #283C82; color:white;">장바구니</button>
					<button type="button" class="btn btn-default btn-order" style="width: 44%;">바로구매</button>
				</div>
		</form>	
		</div>
	</div>
	
</div>
<!-- 상세 페이지 / 리뷰 섹션 --> 
<br>
<br>
<br>

<div class="container">

  <ul class="nav nav-tabs nav-justified">
    <li><a data-toggle="pill" href="#sangpum-page" style="color: gray;">상세 정보</a></li>
    <li class="active"><a data-toggle="pill" href="#reply" style="color: gray;">리뷰</a></li>
  </ul>
  
  <!-- 상세 페이지 -->
  <div class="tab-content">
    <div id="sangpum-page" class="tab-pane fade">
      <br>
      <br>
      <br>
      <img src="menu/images/sangppum-page.png" style="margin-left: 25%; width: 50%;">
    </div>
      
    <!-- 리뷰 -->
    <div id="reply" class="tab-pane fade in active">
      <br>
      <br>
      <br>
      <button type="button" id="write-reply" class="btn btn-default btn-lg btn-block"><span class="glyphicon glyphicon-pencil"></span> 리뷰 등록</button>
    </div>
  </div>
  
</div>

<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><span class="glyphicon glyphicon-pencil"></span> 제품 리뷰 등록하기</h4>
        </div>
        
        <div class="modal-body">
	        <form id="reply-frm">
	        	<input type="hidden" name="shopnum" value=<%=shopnum %>>
				<input type="hidden" name="num" value=<%=num %>>
				
	       		<label >평점 :</label>
	       		<div class="star-rating space-x-4 mx-auto">
					<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings" checked="checked"/>
					<label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
					<label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
					<label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
					<label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
					<label for="1-star" class="star">★</label>
				</div>
	        	<br>
	       		
	       		<label >좋았던 점 :</label>
	        	<select name="review" id="review" class="form-control" style="width: 100%;">
	        		<option value="r1">전체적으로 만족스러운 제품이에요</option>
	        		<option value="r2">촉촉한 보습력에 반했어요</option>
	        		<option value="r3">흡수가 잘되고 사용감이 뛰어나요</option>
	        		<option value="r4">발림성이 좋아요</option>
	        		<option value="r5">효능 효과를 느낄 수 있어요</option>
	        	</select>
	        	<br>
	        	
	        	 <div class="form-group">
				    <label for="comment">Comment:</label>
			 	    <textarea class="form-control" rows="5" name="content" id="content" required"></textarea>
			   	 </div>
	        </form>  
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="reply-insert" data-dismiss="modal" style="background-color: #283C82; color: white;">리뷰 등록</button>
        </div>
      </div>
      
    </div>
  </div>
<!-- Modal end -->



<script type="text/javascript">

var cnt = parseInt($("#cnt").val());
var price = <%=price%>
var sum = 0;

// 수량 증가하기
$("#plus").click(function(){
	
	if(cnt >= 5){
		alert("이 제품의 1회 최대 구매 가능한 수량은 5개 입니다.")
		return;
	}else{
		cnt += 1;
		$("#cnt").val(cnt);
	}
	
	sum = price * cnt;
	$(".part-price").html(sum.toLocaleString()+'원');
});

// 수량 감소하기
$("#minus").click(function(){
	if(cnt <= 1){
		return;
	}else{
		cnt -= 1;
		$("#cnt").val(cnt);	
	}
	sum = price * cnt;
	$(".part-price").html(sum.toLocaleString()+'원');
});

// 장바구니 이동
$(".btn-cart").click(function(){
	var formdata=$("#frm").serialize();
	// alert(formdata)
	
	$.ajax({
		type:"post",
		url:"shop/detailproc.jsp",
		dataType:"html",
		data:formdata,
		success:function(){
			var a=confirm('해당 상품을 장바구니에 저장했습니다\n장바구니로 이동하려면 확인을 클릭해주세요');
			if(a){
				location.href="index.jsp?main=shop/cart.jsp";
			}
		}
	}); 
});

// 리뷰 모달창 열기
$("#write-reply").click(function(){
    $("#myModal").modal();
    
  });
  
// 리뷰 등록 버튼 ajax
$("#reply-insert").click(function(){
	 var data = $("#reply-frm").serialize();
	 
	 $.ajax({
			type:"post",
			url:"shop/replyinsert.jsp",
			dataType:"html",
			data:data,
			success:function(){
				alert("리뷰를 성공적으로 등록하였습니다.");
			}
		});	
});

replylist();

// 리뷰 리스트 5개씩 불러오기
function replylist(){
	var loginid=$("#myid").val();
	var shopnum=$("#shopnum").val();
	var start=<%=start%>
	var perpage=<%=perPage%>
	// console.log(start,perpage)
	
}

</script>
</body>
</html>