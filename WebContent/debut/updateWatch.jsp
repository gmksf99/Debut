<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- 프레픽스 c를 쓰겠다고 선언함 -->
<%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Debut</title>
<link rel="shortcut icon" type="image⁄x-icon" href="images/webicon.png">
<link href="layout.css" rel="stylesheet" type="text/css" />
<script src="index_js.js" type="text/javascript"></script>
<link href="insertForm.css" rel="stylesheet" type="text/css" />
<style>
.contentForm{
	margin-left:20px;
	text-align:left;
}
</style>
</head>

<body>

<!--wrap영역-->
<div id="wrap" style="height:900px">

	<!--page_header영역-->
  <jsp:include page="admin_header.jsp" />
  
   <!--page_center영역-->
  <div id="page_center" style="height:700px">
    <div class="brands">
    <%
	//DB오퍼레이션
	int watchId = Integer.parseInt(request.getParameter("watchId"));
	Connection conn = ConnectionProvider.getConnection();
	Watch watch = null;
	try{
		WatchDao dao = new WatchDao();
		watch = dao.selectById(conn, watchId);
	}catch(SQLException e){}
	
%>
<c:set var = "watch" value = "<%= watch %>"/><!-- el로 꺼집어 냄 -->
    <form action="updateProcess.jsp" method="post" enctype="multipart/form-data">
      <table width="700px" cellspacing="0" cellpadding="1" style="color:#000">
     	 <tr>
          <td class = "content" width = "150px">시계아이디</td>
          <td class = "contentForm"><input name="watchId" type="text" value = "${watch.watchId }" /></td>
        </tr>
        <tr>
          <td class = "content" width = "150px">시계이름</td>
          <td class = "contentForm"><input name="watchName" type="text" value = "${watch.watchName }" /></td>
        </tr>
        <tr>
          <td class = "content" width = "150px">브랜드</td>
          <td class = "contentForm">
          <c:if test="${watch.brand eq 'rosemont' }">
          		<label>
              <input type="radio" name="brand" value="rosemont" id="brand_0" checked="checked"/>
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
          </c:if>
            <c:if test="${watch.brand eq 'jestina' }">
          		<label>
              <input type="radio" name="brand" value="rosemont" id="brand_0" />
              rosemont</label>
            <label>
              <input type="radio" name="brand" value="jestina" id="brand_1" checked="checked" />
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
          </c:if>
          <c:if test="${watch.brand eq 'kangol' }">
          		<label>
              <input type="radio" name="brand" value="rosemont" id="brand_0" />
              rosemont</label>
            <label>
              <input type="radio" name="brand" value="jestina" id="brand_1" />
              jestina</label>
            <label>
              <input type="radio" name="brand" value="kangol" id="brand_2"  checked="checked"/>
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
          </c:if>
          <c:if test="${watch.brand eq 'stonhenge' }">
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
              <input type="radio" name="brand" value="stonhenge" id="brand_3"  checked="checked"/>
              stonhenge</label>
            <label>
              <input type="radio" name="brand" value="clue" id="brand_4" />
              clue</label>
            <label>
              <input type="radio" name="brand" value="ost" id="brand_5" />
              ost</label>
          </c:if>
          <c:if test="${watch.brand eq 'clue' }">
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
              <input type="radio" name="brand" value="clue" id="brand_4"  checked="checked"/>
              clue</label>
            <label>
              <input type="radio" name="brand" value="ost" id="brand_5" />
              ost</label>
          </c:if>
          <c:if test="${watch.brand eq 'ost' }">
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
              <input type="radio" name="brand" value="ost" id="brand_5"  checked="checked"/>
              ost</label>
          </c:if>
          </td>
        </tr>
        <tr>
          <td class = "content" width = "150px">가격</td>
          <td class = "contentForm"><input type="text" name="price" id="price" value="${watch.price }"/></td>
        </tr>
        <tr>
          <td class = "content" width = "150px">소재</td>
          <c:if test="${watch.watchType eq 'Leather' }">
          <td class = "contentForm">
            <label>
            
              <input type="radio" name="watchType" value="Leather" checked="checked" />
              	Lether</label>
            <label>
              <input type="radio" name="watchType" value="Metal" />
              Metal</label>
          </td>
          </c:if>
          <c:if test="${watch.watchType eq 'Metal' }">
          <td class = "contentForm">
            <label>
            
              <input type="radio" name="watchType" value="Leather"/>
              	Lether</label>
            <label>
              <input type="radio" name="watchType" value="Metal"  checked="checked" />
              Metal</label>
          </td>
          </c:if>
        </tr>
        <tr>
          <td class = "content" width = "150px">시계이미지</td>
          <td class = "contentForm"><input type="file" name="watchImage" id="watchImage" value="${watch.watchImage }"/></td>
        </tr>
        <tr>
          <td class = "content" width = "150px">시계상세이미지</td>
          <td class = "contentForm"><input type="file" name="watchImage1" id="watchImage" value="${watch.watchImage1 }" /></td>
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
          <td class = "contentForm"><textarea name="memo" cols="45" rows="10">${watch.memo }</textarea></td>
        </tr>
        <tr>
          <td class = "content" width = "150px">시계스타일</td>
          <c:if test="${watch.watchStyle eq '러블리한' }">
          <td class = "contentForm"><p>
          <label>
           <input type="radio" name="watchStyle" value="러블리한" checked="checked"/>
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
          </c:if>
          <c:if test="${watch.watchStyle eq '화려한' }">
          <td class = "contentForm"><p>
          <label>
           <input type="radio" name="watchStyle" value="러블리한"/>
              	러블리한</label>
            <label>
              <input type="radio" name="watchStyle" value="화려한" checked="checked"/>
             	 화려한</label>
            <label>
              <input type="radio" name="watchStyle" value="심플한"/>
              	심플한</label>
            <label>
              <input type="radio" name="watchStyle" value="유니크한"/>
              	유니크한</label>
              
          </p></td>
          </c:if>
          <c:if test="${watch.watchStyle eq '심플한' }">
          <td class = "contentForm"><p>
          <label>
           <input type="radio" name="watchStyle" value="러블리한"/>
              	러블리한</label>
            <label>
              <input type="radio" name="watchStyle" value="화려한"/>
             	 화려한</label>
            <label>
              <input type="radio" name="watchStyle" value="심플한" checked="checked"/>
              	심플한</label>
            <label>
              <input type="radio" name="watchStyle" value="유니크한"/>
              	유니크한</label>
              
          </p></td>
          </c:if>
          <c:if test="${watch.watchStyle eq '유니크한' }">
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
              <input type="radio" name="watchStyle" value="유니크한" checked="checked"/>
              	유니크한</label>
              
          </p></td>
          </c:if>
        </tr>
        <tr>
          <td class = "content" width = "150px">추천연령대</td>
          <c:if test="${watch.watchAge eq '10대' }">
          <td class = "contentForm"><select name="watchAge">
            <option value="10대" selected="selected">10대</option>
            <option value="20대">20대</option>
            <option value="30대">30대</option>
            <option value="40대">40대</option>
            <option value="50대 이상">50대 이상</option>
          </select></td>
          </c:if>
          <c:if test="${watch.watchAge eq '20대' }">
          <td class = "contentForm"><select name="watchAge">
            <option value="10대">10대</option>
            <option value="20대" selected="selected">20대</option>
            <option value="30대">30대</option>
            <option value="40대">40대</option>
            <option value="50대 이상">50대 이상</option>
          </select></td>
          </c:if>
          <c:if test="${watch.watchAge eq '30대' }">
          <td class = "contentForm"><select name="watchAge">
            <option value="10대">10대</option>
            <option value="20대">20대</option>
            <option value="30대" selected="selected">30대</option>
            <option value="40대">40대</option>
            <option value="50대 이상">50대 이상</option>
          </select></td>
          </c:if>
          <c:if test="${watch.watchAge eq '40대' }">
          <td class = "contentForm"><select name="watchAge">
            <option value="10대">10대</option>
            <option value="20대">20대</option>
            <option value="30대">30대</option>
            <option value="40대" selected="selected">40대</option>
            <option value="50대 이상">50대 이상</option>
          </select></td>
          </c:if>
          <c:if test="${watch.watchAge eq '50대 이상' }">
          <td class = "contentForm"><select name="watchAge">
            <option value="10대">10대</option>
            <option value="20대">20대</option>
            <option value="30대">30대</option>
            <option value="40대">40대</option>
            <option value="50대 이상" selected="selected">50대 이상</option>
          </select></td>
          </c:if>
        </tr>
        <tr>
        <td colspan="2" class = "content">
        <input name="insert" type="submit" value="수정" /></td>
        </tr>
      </table>
     </form>
    </div>

 	<div class="sidemenu"><img src="images/fixed.png" width="107" height="94" /></div>
  </div><!-- end page_center영역 -->
  
  
    <!--page_footer영역-->
  <jsp:include page="page_footer.jsp" />

</div><!--end wrap영역 -->
</body>
</html>
