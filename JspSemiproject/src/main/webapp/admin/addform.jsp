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
<script type="text/javascript">

 
  function readURL(input) {
   
   
   if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        $('#blah').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }

}


 $(function(){

    $("#category").change(function(){
         let selval = $(this).val();
         let s="";
         
         if(selval == 'skincare_cleansing'){
           s="";
           s+="<option value='toner_loction'>toner/loction</option>";
           s+="<option value='cream_jell'>cream/jell</option>";
           s+="<option value='essence_serum'>essence/serum</option>";
           s+="<option value='mask_pack'>mask/pack</option>";
           s+="<option value='cleansing'>cleansing</option>";
         }else if(selval == 'facemakeup'){
           s="";
           s+="<option value='base_foundation'>base/foundation</option>";
           s+="<option value='blush_highlighter'>blush/highlighter</option>";
           s+="<option value='eyeshadow'>eyeshadow</option>";
           s+="<option value='eyeliner_brow'>eyeliner/brow</option>";
           s+="<option value='mascara'>mascara</option>";
           s+="<option value='lip'>lip</option>";
         }else if(selval == 'body_haircare'){
          s="";
          s+="<option value='body_care'>body care</option>";
          s+="<option value='hairstyling'>hairstyling</option>";
          s+="<option value='perfume'>perfume</option>";
          s+="<option value='beauty_accessories'>beauty accessories</option>";
         }

      $("#sangpumtype").html(s);
       });
    

 });


</script>

</head>
<body>
  <div>
 


    <img alt="" src="" id="blah" style="position: absolute; left: 1200px;top:250px;max-width: 300px; max-height: 400px;">
      <form action="admin/addaction.jsp" method="post" enctype="multipart/form-data">
      
     <b style="margin:1500px 200px; font-size: 20px;">??????????????????</b>


<h5 class="alert alert-info" style="width: 900px; margin:50px 200px; font-size: 17px;">????????? ??????????????????</h5>
  <table class="table table-hover"  style="margin:10px 200px; width: 900px;">
        <tr>
           <td colspan="2" align="right" >
             <button type="submit" class="pratice btn btn-default" style="width: 100px; background-color: lightpink;">????????????</button>
            <button type="button" class="btn btn-default" style="width: 100px; background-color: lightblue;"
            onclick="location.href='index.jsp?main=admin/shoplist.jsp'">????????????</button>
           </td>
         
         </tr>
          <tr>
            <td style="width: 150px;"><b>????????????</b></td>
            <td>
              <select style="width: 500px;" name="category" id="category" class="form-control"
               required="required">
                <option value="skincare_cleansing">skincare_cleansing</option>
                <option value="facemakeup">facemakeup</option>
                <option value="body_haircare">body_haircare</option>
          
    
              </select>
            </td>
          
          </tr>
         <tr>
       
            <td style="width: 150px;" ><b>????????????</b></td>
            <td>
             <select style="width: 500px;" name="sangpumtype" id="sangpumtype" class="form-control" required="required">    
              <option value="toner_loction">toner/loction</option>
              <option value="cream_jell">cream/jell</option>
              <option value="essence_serum">essence/serum</option>
              <option value="mask_pack">mask/pack</option>
  
             </select>
            </td>
            </tr>

         
         
      
            <tr>
            <td style="width: 150px;"><b>????????????</b></td>
            <td>
             <select style="width: 500px;" name="gomin" 
             class="form-control" required="required">
                <option value="1">??????</option>
                <option value="2">?????????</option>
                <option value="3">??????</option>
                <option value="4">??????</option>
                <option value="5">?????????</option>
                <option value="6">??????</option>
                <option value="7">?????????</option>
                <option value="8">????????????</option>
                <option value="9">??????</option>
              </select>
            </td>         
             </tr>
         
         
           <tr>
            <td style="width: 150px;"><b>?????????</b></td>
            <td>
              <input type="text" name="sangpum" class="form-control" style="width: 500px;"
              required="required">
            </td>
         
         </tr>
         
          <tr>
            <td style="width: 150px;"><b>????????????</b></td>
            <td>
              <input type="file" name="photo" class="form-control" style="width: 500px;"
              required="required" onchange="readURL(this)">
            </td>
         
         </tr>
      
           <tr>
            <td style="width: 150px;"><b>????????????</b></td>
            <td>
              <input type="text" name="price" class="form-control" style="width: 500px;"
              required="required">
            </td>
         
         </tr>
         
           <tr>
            <td style="width: 150px;"><b>?????????</b></td>
            <td>
              <input type="date" name="ipgoday" style="width: 500px;"
              required="required">
            </td>
         
         </tr>
         
          
         
      
      
      </table>
      
      
      </form>
    
    
    
    
    </div>
    
</body>
</html>