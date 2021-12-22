<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- 프레픽스 c를 쓰겠다고 선언함 -->
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Debut</title>
<link rel="shortcut icon" type="image⁄x-icon" href="images/webicon.png">
<link href="layout.css" rel="stylesheet" type="text/css" />
<link href="select.css" rel="stylesheet" type="text/css" />
<link href="likeList.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div id = "wrap" style = "height:400px">

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
<script>
		alert("로그인하셔야합니다. 로그인화면으로 이동합니다.");
		location.href="loginForm.jsp";
	</script>
</c:if>

<!-- page_center영역 -->
  <div id="page_center" style = "height:200px">
	  <div class = "title"><h2 style = "color: #810B0C"><%=session.getAttribute("LOGIN") %>님의 관심상품</h2></div>
    <div class="select">    
    
   <%
	String memberId = (String)session.getAttribute("LOGIN");
	Connection conn = ConnectionProvider.getConnection();
	List<Fav> favs = null;
		try{
			FavDao fDao = new FavDao();
			favs = fDao.selectListById(conn, memberId);
		}catch(SQLException e){}
		JdbcUtil.close(conn);
	%>

	  <c:set var = "list" value = "<%=favs %>"/><!-- el으로 watchs를 list로 바꿔줌 -->
	  <c:if test="${fn:length(list)/1 eq 0 }">
	
			<br/><br/><br/><br/><h2>관심상품이 없습니다.</h2><br/>
			<a href = "selectAll.jsp" style = "color: #810B0C"><h3>쇼핑하러가기</h3></a>
		</c:if>
	  <c:if test="${list ne null }"><!-- if로 테스트 부터 해주어야함 -->
	  	<c:forEach var = "fav" items = "${list }">
	  		<div class="item">
      			<table width="200px" height="300px" cellspacing="0" cellpadding="1">
	 			<tr>
				  <td class = "watchImage" height = "300px">
				  <a href = "detail.jsp?watchId=${fav.watchId }">
				  <img src = "watches/${fav.watchImage }" width = "250"
				   onmouseover="this.src='watches/${fav.watchImage1}'" onmouseout="this.src='watches/${fav.watchImage}'"/></a></td>
				</tr>
				<tr>
				  <td class = "watchName">
				  <a  style="color: #555" href = "detail.jsp?watchId=${fav.watchId }">
				  <strong>${fav.watchName }</strong></a></td>
				</tr>
			   <tr>
				  <td class = "price"><a  style="color: #810B0C" href = "detail.jsp?watchId=${fav.watchId }"> 
				  ￦${fav.price }
				  </a> </td>
				</tr>
				<tr>
				  <td class = "price"><a  style="color: #555" href = "deleteFav.jsp?favId=${fav.favId }"> 
				  관심목록에서 삭제
				  </a> </td>
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
<c:set var = "height" value="${(fn:length(list)/3)*300+500 }"/>
</c:if>
<c:if test="${fn:length(list)%3 eq 1 }">
<c:set var = "height" value="${(fn:length(list)/3)*300+140+300 }"/>
</c:if>
<c:if test="${fn:length(list)%3 eq 2 }">
<c:set var = "height" value="${(fn:length(list)/3)*300+140+300 }"/>
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
