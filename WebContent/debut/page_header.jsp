<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- 프레픽스 c를 쓰겠다고 선언함 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script> 
<script src="index_js.js" type="text/javascript"></script>
<script src="menu.js" type="text/javascript"></script>
<script type="text/javascript">
function loginalert(){	
	alert("로그인하셔야 합니다. 로그인 창으로 이동합니다.");
	location.href="loginForm.jsp";
}
</script>
</head>
<body>
  <div id="page_header">
  	<!--logo-->
  	<div id="logo"><a href="index.jsp"><img src="images/logo.png" width="161" height="52" /></a></div>
  	
  	
    <!--아이콘-->
    <div class="icons">
      <div class="icon"><a href = "loginForm.jsp"><img src="images/member.png" width="25" height="25" id="Image8" onmouseover="MM_swapImage('Image8','','images/member1.png',1)" onmouseout="MM_swapImgRestore()" /></a></div>
      <div class="icon"><a href = "search.jsp"><img src="images/search.png" width="25" height="25" id="Image9" onmouseover="MM_swapImage('Image9','','images/search1.png',1)" onmouseout="MM_swapImgRestore()" /></a></div>
      <div class="icon"><img src="images/shoppingbag.png" width="25" height="25" id="Image10" onmouseover="MM_swapImage('Image10','','images/shoppingbag1.png',1)" onmouseout="MM_swapImgRestore()" onclick="loginalert()"/></div>
    </div>
    
    
    
    
    <!-- hide영역 -->
      <h2 class="hide">메뉴</h2>
  <ul id="gnb">
     <li><a href="selectAll.jsp"><img src="images/nav1_out.png" width="76" height="29"></a></li>
     <li><a href = "brandAll.jsp?Brand=rosemont"><img src="images/nav2_out.png" width="89" height="29"></a>
        <ul class="sub2">
           <li><a href = "brandAll.jsp?Brand=rosemont">View All</a></li>
           <li><a href = "brandType.jsp?Brand=rosemont&Type=Leather">Leather</a></li>
           <li><a href = "brandType.jsp?Brand=rosemont&Type=Metal">Metal</a></li>
        </ul>
     </li>
     <li><a href = "brandAll.jsp?Brand=jestina"><img src="images/nav3_out.png" width="81" height="29"></a>
        <ul class="sub3">
           <li><a href = "brandAll.jsp?Brand=jestina">View All</a></li>
           <li><a href = "brandType.jsp?Brand=jestina&Type=Leather">Leather</a></li>
           <li><a href = "brandType.jsp?Brand=jestina&Type=Metal">Metal</a></li>
        </ul>
     </li>
     <li><a href = "brandAll.jsp?Brand=kangol"><img src="images/nav4_out.png" width="65" height="29"></a>
        <ul class="sub4">
           <li><a href = "brandAll.jsp?Brand=kangol">View All</a></li>
           <li><a href = "brandType.jsp?Brand=kangol&Type=Leather">Leather</a></li>
           <li><a href = "brandType.jsp?Brand=kangol&Type=Metal">Metal</a></li>
        </ul>
     </li>
     <li><a href = "brandAll.jsp?Brand=stonhenge"><img src="images/nav5_out.png" width="94" height="29" ></a>
        <ul class="sub5">
           <li><a href = "brandAll.jsp?Brand=stonhenge">View All</a></li>
           <li><a href = "brandType.jsp?Brand=stonhenge&Type=Leather">Leather</a></li>
           <li><a href = "brandType.jsp?Brand=stonhenge&Type=Metal">Metal</a></li>
        </ul>
     </li>
     <li><a href = "brandAll.jsp?Brand=clue"><img src="images/nav6_out.png" width="46" height="29" ></a>
        <ul class="sub6">
           <li><a href = "brandAll.jsp?Brand=clue">View All</a></li>
           <li><a href = "brandType.jsp?Brand=clue&Type=Leather">Leather</a></li>
           <li><a href = "brandType.jsp?Brand=clue&Type=Metal">Metal</a></li>
        </ul>
     </li>
     <li><a href = "brandAll.jsp?Brand=ost"><img src="images/nav7_out.png" width="53" height="29"></a>
        <ul class="sub7">
           <li><a href = "brandAll.jsp?Brand=ost">View All</a></li>
           <li><a href = "brandType.jsp?Brand=ost&Type=Leather">Leather</a></li>
           <li><a href = "brandType.jsp?Brand=ost&Type=Metal">Metal</a></li>
        </ul>
     </li>
  </ul>
  <div id="nav_bar">
    
    
    
    
      <div id="total_menu">
     <dl>
        <dt><img src="images/nav1_over.png" /></dt>
        <dd>
           <ul>
              <li><a href="selectAll.jsp">전체보기</a></li>
           </ul>
        </dd>
     </dl>
     <dl>
        <dt><img src="images/nav2_over.png" /></dt>
        <dd>
           <ul>
           		 <li><a href="#">View All</a></li>
          		 <li><a href="#">Leather</a></li>
          		 <li><a href="#">Metal</a></li>
           </ul>
        </dd>
     </dl>
     <dl>
        <dt><img src="images/nav3_over.png" /></dt>
        <dd>
           <ul>
           		 <li><a href="#">View All</a></li>
          		 <li><a href="#">Leather</a></li>
          		 <li><a href="#">Metal</a></li>
           </ul>
        </dd>
     </dl>
     <dl>
        <dt><img src="images/nav4_over.png" /></dt>
        <dd>
           <ul>
           		 <li><a href="#">View All</a></li>
          		 <li><a href="#">Leather</a></li>
          		 <li><a href="#">Metal</a></li>
           </ul>
        </dd>
     </dl>
      <dl>
        <dt><img src="images/nav4_over.png" /></dt>
        <dd>
           <ul>
           		 <li><a href="#">View All</a></li>
          		 <li><a href="#">Leather</a></li>
          		 <li><a href="#">Metal</a></li>
           </ul>
        </dd>
     </dl>
      <dl>
        <dt><img src="images/nav5_over.png" /></dt>
        <dd>
           <ul>
           		 <li><a href="#">View All</a></li>
          		 <li><a href="#">Leather</a></li>
          		 <li><a href="#">Metal</a></li>
           </ul>
        </dd>
     </dl>
      <dl>
        <dt><img src="images/nav6_over.png" /></dt>
        <dd>
           <ul>
           		 <li><a href="#">View All</a></li>
          		 <li><a href="#">Leather</a></li>
          		 <li><a href="#">Metal</a></li>
           </ul>
        </dd>
     </dl>
      <dl>
        <dt><img src="images/nav7_over.png" /></dt>
        <dd>
           <ul>
           		 <li><a href="#">View All</a></li>
          		 <li><a href="#">Leather</a></li>
          		 <li><a href="#">Metal</a></li>
           </ul>
        </dd>
     </dl>
  </div>
	</div><!--nav_bar-->
</div> 
</body>
</html>