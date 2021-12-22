<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Debut</title>
<link rel="shortcut icon" type="image⁄x-icon" href="images/webicon.png">
<link href="layout.css" rel="stylesheet" type="text/css" />
<script src="index_js.js" type="text/javascript"></script>
<link href="insertForm.css" rel="stylesheet" type="text/css" />
</head>

<body>

<!--wrap영역-->
<div id="wrap" style="height:900px">

	<!--page_header영역-->
  <jsp:include page="admin_header.jsp" />
  
   <!--page_center영역-->
  <div id="page_center" style="height:700px">
    <div class="brands">
    <form action="process.jsp" method="post" enctype="multipart/form-data">
      <table width="700px" cellspacing="0" cellpadding="1" style="color:#000">
        <tr>
          <td class = "content" width = "150px">시계이름</td>
          <td class = "contentForm"><input name="watchName" type="text" /></td>
        </tr>
        <tr>
          <td class = "content" width = "150px">브랜드</td>
          <td class = "contentForm">
            <label>
              <input type="radio" name="brand" value="rosemont" id="brand_0" />
              rosemont</label>
            <label>
              <input type="radio" name="brand" value="jestina" id="brand_1" />
              jestina</label>
            <label>
              <input type="radio" name="brand" value="kangol" id="brand_2" />
              kangol</label>
            <label>
              <input type="radio" name="brand" value="stonhenge" id="brand_3" />
              stonhenge</label>
            <label>
              <input type="radio" name="brand" value="clue" id="brand_4" />
              clue</label>
            <label>
              <input type="radio" name="brand" value="ost" id="brand_5" />
              ost</label>
          </td>
        </tr>
        <tr>
          <td class = "content" width = "150px">가격</td>
          <td class = "contentForm"><input type="text" name="price" id="price" /></td>
        </tr>
        <tr>
          <td class = "content" width = "150px">소재</td>
          <td class = "contentForm">
            <label>
              <input type="radio" name="watchType" value="Leather" />
              	Leather</label>
            <label>
              <input type="radio" name="watchType" value="Metal" />
              Metal</label>
          </td>
        </tr>
        <tr>
          <td class = "content" width = "150px">시계이미지</td>
          <td class = "contentForm"><input type="file" name="watchImage" id="watchImage" /></td>
        </tr>
        <tr>
          <td class = "content" width = "150px">시계상세이미지</td>
          <td class = "contentForm"><input type="file" name="watchImage1" id="watchImage" /></td>
        </tr>
        <tr>
          <td class = "content" width = "150px">시계상세이미지</td>
          <td class = "contentForm"><input type="file" name="watchImage2" id="watchImage" /></td>
        </tr>
        <tr>
          <td class = "content" width = "150px">시계상세이미지</td>
          <td class = "contentForm"><input type="file" name="watchImage3" id="watchImage" /></td>
        </tr>
        <tr>
          <td class = "content" width = "150px">시계설명</td>
          <td class = "contentForm"><textarea name="memo" cols="45" rows="10"></textarea></td>
        </tr>
        <tr>
          <td class = "content" width = "150px">시계스타일</td>
          <td class = "contentForm"><p>
          <label>
           <input type="radio" name="watchStyle" value="러블리한"/>
              	러블리한</label>
            <label>
              <input type="radio" name="watchStyle" value="화려한"/>
             	 화려한</label>
            <label>
              <input type="radio" name="watchStyle" value="심플한"/>
              	심플한</label>
            <label>
              <input type="radio" name="watchStyle" value="유니크한"/>
              	유니크한</label>
              
          </p></td>
        </tr>
        <tr>
          <td class = "content" width = "150px">추천연령대</td>
          <td class = "contentForm"><select name="watchAge">
            <option value="10대">10대</option>
            <option value="20대" selected="selected">20대</option>
            <option value="30대">30대</option>
            <option value="40대">40대</option>
            <option value="50대 이상">50대 이상</option>
          </select></td>
        </tr>
        <tr>
        <td colspan="2" class = "content">
        <input name="insert" type="submit" value="상품 등록" /></td>
        </tr>
      </table>
     </form>
    </div>

 	<div id="quick_menu"><img src="images/fixed.png" width="137" height="80" usemap="#Map" border="0" />
   	 <map name="Map" id="Map">
        <area shape="rect" coords="7,13,132,36" href="likeList.jsp" />
        <area shape="rect" coords="5,53,134,75" href="#logo" />
      </map>
     </div>
  </div><!-- end page_center영역 -->
  
  
    <!--page_footer영역-->
  <jsp:include page="page_footer.jsp" />

</div><!--end wrap영역 -->
</body>
</html>
