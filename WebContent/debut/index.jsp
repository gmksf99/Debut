<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Debut</title>
<link rel="shortcut icon" type="image⁄x-icon" href="images/webicon.png">
<link href="select1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script> 
<link href="layout.css" rel="stylesheet" type="text/css" />
<script src="index_js.js" type="text/javascript"/>
<script src="menu.js" type="text/javascript"/>
<script src="kakao.js" type="text/javascript"/>
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

    <!--page_center영역-->
  <div id="page_center" style = "height:1900px">
  
  
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
    
 <!-- 비회원시 인기 추천 시계 3개 -->
  <c:if test="${userId eq null || userId eq 'admin'}">
  	<div class = "watchtop3" style ="height: 420px;width:auto;">
    <%
	  			Connection conn1 = ConnectionProvider.getConnection();//1. 커넥션을 만ㄷ름
	  			List<Watch> watchs = null;//4. 저장할 배열 선언하기
	  			try{//2. try catch문 만듦
	  				WatchDao wDao = new WatchDao();//3. dao객체 생성
	  				watchs = wDao.selectListNew(conn1);//4. watchs에 저장
	  			}catch(SQLException e){}
	  
	  %>
	  <c:set var = "list" value = "<%=watchs %>"/>
	  	<hr/>
	  		<h3>인기상품 TOP3</h3> 
	  	<hr/>
	  	<c:forEach var = "watch" items = "${list }">
	  	  <c:if test="${list != null }">
	  			 <div class="item">
      			<table width="200px" height="300px" cellspacing="0" cellpadding="1">
 		 			<tr>
  					  <td class = "watchImage" height = "300px">
  					  <a href = "/1118/debut/detail.jsp?watchId=${watch.watchId }">
  					  <img src = "watches/${watch.watchImage }" width = "250"
  					   onmouseover="this.src='watches/${watch.watchImage1}'" onmouseout="this.src='watches/${watch.watchImage}'"/></a></td>
  					</tr>
  					<tr>
  					  <td class = "watchName">
  					  <a  style="color: #555" href = "detail.jsp?watchId=${watch.watchId }">
  					  <strong>${watch.watchName }</strong></a></td>
  					</tr>
     			   <tr>
  					  <td class = "price">
  					 <a  style="color: #810B0C" href = "detail.jsp?watchId=${watch.watchId }"> 
  					  ￦ ${watch.price }</a></td>
  					</tr>
				</table>				
     		 </div>   
	  		</c:if>
	  	</c:forEach>
  </div>
  
  
  
  </c:if>
  
  
  <!-- 로그인시 시계스타일별 추천 시계 3개 -->
    <c:if test="${userId ne 'admin' && userId ne null}">
	<div class="watchtop3" style ="height: 400px;width:auto;">
    <%
	  			String memberId = (String)session.getAttribute("LOGIN");
	  			Connection conn = ConnectionProvider.getConnection();//1. 커넥션을 만ㄷ름
	  			List<Watch> watchs = null;//4. 저장할 배열 선언하기
	  			String myWatchStyle = "";
	  			try{//2. try catch문 만듦
	  				WatchDao wDao = new WatchDao();//3. dao객체 생성
	  				PurchaseDao pDao = new PurchaseDao();
	  				myWatchStyle = pDao.myFavWatch(conn, userId);
	  				watchs = wDao.selectListMyWatchStyle(conn, myWatchStyle);//4. watchs에 저장
	  			}catch(SQLException e){}
	  
	  %>
	  <c:set var = "list" value = "<%=watchs %>"/>
	  	<hr/>
	  		<h3><a style = "color : #810B0C">${userId }</a>님을 위한 
	  		<a style = "color : #810B0C"><%=myWatchStyle %></a> 스타일의 시계 
	  		<a style = "color : #810B0C">TOP3</a></h3>
	  	<hr/>
	  	<c:forEach var = "watch" items = "${list }">
	  	  <c:if test="${list != null }">
	  			 <div class="item">
      			<table width="200px" height="300px" cellspacing="0" cellpadding="1">
 		 			<tr>
  					  <td class = "watchImage" height = "300px">
  					  <a href = "/1118/debut/detail.jsp?watchId=${watch.watchId }">
  					  <img src = "watches/${watch.watchImage }" width = "250"
  					   onmouseover="this.src='watches/${watch.watchImage1}'" onmouseout="this.src='watches/${watch.watchImage}'"/></a></td>
  					</tr>
  					<tr>
  					  <td class = "watchName">
  					  <a  style="color: #555" href = "detail.jsp?watchId=${watch.watchId }">
  					  <strong>${watch.watchName }</strong></a></td>
  					</tr>
     			   <tr>
  					  <td class = "price">
  					 <a  style="color: #810B0C" href = "detail.jsp?watchId=${watch.watchId }"> 
  					  ￦ ${watch.price }</a></td>
  					</tr>
				</table>				
     		 </div>   
	  		</c:if>
	  	</c:forEach>
  </div>
	</c:if>    
    
    <!-- 사이드 퀵 메뉴 -->
 	<div id="quick_menu"><img src="images/fixed.png" width="137" height="80" usemap="#Map" border="0" />
   	 <map name="Map" id="Map">
        <area shape="rect" coords="7,13,132,36" href="likeList.jsp" />
        <area shape="rect" coords="5,53,134,75" href="#logo" />
      </map>
     </div>
     <c:if test="${userId ne 'admin' }">
     	<div style = "position:fixed;bottom:30px;right:50px;height:48px;width: 104px;" id="kakao-talk-channel-chat-button" data-channel-public-id="_IbZAxb" data-title="consult" data-size="small" data-color="mono" data-shape="pc" data-support-multiple-densities="true"></div>
      </c:if>
      <c:if test="${userId eq 'admin' }">
      	<div style = "position:fixed;bottom:30px;right:50px;height:48px;width: 104px;"><img src = "images/kakao_logo.png" onclick = "javascript:location.href='https://center-pf.kakao.com/';"/></div>
  	  </c:if>


  </div><!-- end page_center -->

<!--page_footer영역-->
  <div id="page_footer" >
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
  </div>
</div><!-- end wrap -->

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
