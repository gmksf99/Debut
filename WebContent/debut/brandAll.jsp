<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- 프레픽스 c를 쓰겠다고 선언함 -->
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Debut</title>
<link rel="shortcut icon" type="image⁄x-icon" href="images/webicon.png">
<link href="layout.css" rel="stylesheet" type="text/css" />
<link href="select.css" rel="stylesheet" type="text/css" />
<link href="brandAll.css" rel="stylesheet" type="text/css" />
<style>
.btn_submit{
 background-image: url('images/sorting.png');
    background-position:  0px 0px;
    background-repeat: no-repeat;
    width: 20px;
    height: 20px;
    border: 0px;
 	cursor:pointer;
 	outline: 0;
}
</style>
</head>

<body>
<div id = "wrap" style = "height:auto">

	<!--page_header영역-->
<% String userId = (String)session.getAttribute("LOGIN"); %>
<c:set var = "userId" value = "<%=userId %>"/>


<c:if test="${userId eq 'admin'}">
	<jsp:include page="admin_header.jsp"/>
</c:if>

<c:if test="${userId ne 'admin' && userId ne null}">
	<jsp:include page="header_login.jsp"/>
</c:if>

<c:if test="${userId eq null}">
	<jsp:include page="page_header.jsp"/>
</c:if>

<!-- page_center영역 -->
  <div id="page_center" style="height:400px">
   <%
     			String Brand = request.getParameter("Brand");
     			String sorting = request.getParameter("sorting");
	  			Connection conn = ConnectionProvider.getConnection();//1. 커넥션을 만ㄷ름
	  			List<Watch> watches = null;//4. 저장할 배열 선언하기
	  			try{//2. try catch문 만듦
	  				WatchDao dao = new WatchDao();//3. dao객체 생성
	  				watches = dao.sortingList1(conn, sorting, Brand);//4. movies에 저장
	  			}catch(SQLException e){}
	 
	  %>
	  
	  <c:set var = "brand" value = "<%=Brand %>"/>
	  <div class = "title"><h2 style = "color: #810B0C">${brand}  ${type }</h2></div>
	  
    <div id="orderbyList"><form method = "post" action = "brandAll.jsp?Brand=<%=Brand%>"><!-- 재귀호출 -->
    <select name="sorting" class = "orderby">
  <option value="new">신상품순</option>
  <option value="fav">인기상품순</option>
  <option value="lowPrice">낮은가격순</option>
  <option value="highPrice">높은가격순</option>
</select><input type = "submit" value = " " class = "btn_submit"/></form></div>
    <div class="select">    
    
	  <c:set var = "list" value = "<%=watches %>"/><!-- el으로 watchs를 list로 바꿔줌 -->
	  <c:if test="${list != null }"><!-- if로 테스트 부터 해주어야함 -->
	  	<c:forEach var = "watch" items = "${list }">
	  		<div class="item">
      			<table width="200px" height="300px" cellspacing="0" cellpadding="1">
 		 			<tr>
  					  <td class = "watchImage" height = "300px">
  					  <a href = "/1118/debut/detail.jsp?watchId=${watch.watchId }">
  					  <img src = "watches/${watch.watchImage }" width = "250" height = "250"
  					   onmouseover="this.src='watches/${watch.watchImage1}'" onmouseout="this.src='watches/${watch.watchImage}'"/></a></td>
  					</tr>
  					<tr>
  					  <td class = "watchName"><strong>${watch.watchName }</strong></td>
  					</tr>
     			   <tr>
  					  <td class = "price">￦ ${watch.price }</td>
  					</tr>
				</table>
     		 </div>   
	  		
	  	</c:forEach>
	  </c:if>
      
      
    </div>
    

 <div id="quick_menu"><img src="images/fixed.png" width="137" height="80" usemap="#Map" border="0" />
   	 <map name="Map" id="Map">
        <area shape="rect" coords="7,13,132,36" href="likeList.jsp" />
        <area shape="rect" coords="5,53,134,75" href="#logo" />
      </map>
     </div>
          	<div style = "position:fixed;bottom:30px;right:50px;height:48px;width: 104px;" id="kakao-talk-channel-chat-button" data-channel-public-id="_IbZAxb" data-title="consult" data-size="small" data-color="mono" data-shape="pc" data-support-multiple-densities="true"></div>
</div><!-- end page_center영역 -->

<c:if test="${fn:length(list)%3 eq 0 }">
<c:set var = "height" value="${(fn:length(list)/3)*200+140 }"/>
</c:if>
<c:if test="${fn:length(list)%3 eq 1 }">
<c:set var = "height" value="${(fn:length(list)/3)*200+140+300 }"/>
</c:if>
<c:if test="${fn:length(list)%3 eq 2 }">
<c:set var = "height" value="${(fn:length(list)/3)*200+140+300 }"/>
</c:if>
<!--page_footer영역-->
  <div id="page_footer" style="margin-top:${height}px">
  	<div class="footer_list">
    	<ul>
        	<li class = "footerList"><a href = "bottomSet.jsp#OC">Our Company</a></li>
            <li class = "footerList"><a href = "bottomSet.jsp#FAQ">FAQ</a></li>
            <li class = "footerList"><a href = "bottomSet.jsp#SG">Shop Guide</a></li>
            <li class = "footerList"><a href = "bottomSet.jsp#PI">개인정보처리방침</a></li>
        </ul>
    </div>
    <div class="footer_info">
    상호. (주)Debut. 김나은 김영한 이수빈. po02026@kpu.ac.kr 전화. 010-9594-6165<br />
주소. 경기도 시흥시 정왕동 2121
사업자등록번호. 1418-314316(사업자정보확인) 개인정보 보호 책임자. 김나은 김영한 이수빈<br /><br />
(c) Debut. all rights reserved. designed by Debut.</div>
  </div><!-- page_footer -->

</div><!--end warp -->
</body>
<script>
  window.kakaoAsyncInit = function () {
    Kakao.init('b2ce284dd981e0141eb7df241f69ba71');
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button'
    });
  };

  (function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//developers.kakao.com/sdk/js/kakao.plusfriend.min.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'kakao-js-sdk'));
</script>
</html>
