<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- 프레픽스 c를 쓰겠다고 선언함 -->
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Debut</title>
<link rel="shortcut icon" type="image⁄x-icon" href="images/webicon.png">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script> 
<link href="layout.css" rel="stylesheet" type="text/css" />
<script src="index_js.js" type="text/javascript"/>
<script src="menu.js" type="text/javascript"/>
<style>
.brands{
	text-align:left;
}
</style>
<script>
</script>
</head>

<body>

<!--wrap영역-->
<div id="wrap">

	<!--page_header영역-->

<c:if test="${userId eq 'admin'}">
	<jsp:include page="admin_header.jsp"/>
</c:if>

<c:if test="${userId ne 'admin' && userId ne null}">
	<jsp:include page="header_login.jsp"/>
</c:if>

<c:if test="${userId eq null}">
	<jsp:include page="page_header.jsp"/>
</c:if>

  
  
    <!--page_center영역-->
  <div id="page_center">
  <div class="recommend">
 		<video autoplay loop muted playsinline src = "video/videoplayback.mp4" type="mp4" width = "900px" height="509px"/>
  </div>
   
    <div class="brands">
      <a href = "brandAll.jsp?Brand=rosemont"><div class="brand1" onmouseover="this.backgroundImage='url(images/brand1_1.png)'">Rosemont</div></a>
   	  <a href = "brandAll.jsp?Brand=jestina"><div class="brand2" onmouseover="this.backgroundImage='url(images/brand2_1.png)'">JEstina</div></a>
	  <a href = "brandAll.jsp?Brand=kangol"><div class="brand3" onmouseover="this.backgroundImage='url(images/brand3_1.png)'">Kangol</div></a>
	  <a href = "brandAll.jsp?Brand=stonhenge"><div class="brand4" onmouseover="this.backgroundImage='url(images/brand4_1.png)'">Stonhenge</div></a>
	  <a href = "brandAll.jsp?Brand=clue"><div class="brand5" onmouseover="this.backgroundImage='url(images/brand5_1.png)'">Clue</div></a>
	  <a href = "brandAll.jsp?Brand=ost"><div class="brand6" onmouseover="this.backgroundImage='url(images/brand6_1.png)'">O.S.T</div></a>
    </div>
    
    
    
    <!--이미지 슬라이더-->
 	<div class="slide">
 	<img onclick="menu()" id="slider" src="images/banner1.png" width="100%" height="100%"/>
    <a id = "prev" onclick="prev()"></a>
    <a id = "next" onclick="next()"></a>
    </div><!--end 이미지슬라이더-->
    
    
    
    <!-- 사이드 퀵 메뉴 -->
 	<div id="quick_menu"><img src="images/fixed.png" width="107" height="94" /></div>
    
  </div><!-- end page_center -->
  
 
 
    <!--page_footer영역-->
  <jsp:include page="page_footer.jsp" />

</div><!-- end wrap -->
</body>
</html>
