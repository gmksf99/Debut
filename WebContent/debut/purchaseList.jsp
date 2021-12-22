<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
<link href="layout.css" rel="stylesheet" type="text/css" />
<link href="cart.css" rel="stylesheet" type="text/css" />
<link href="purchaseList.css" rel="stylesheet" type="text/css" />
<script src="index_js.js" type="text/javascript"></script>


</head>

<body>
<!--wrap영역-->
<div id="wrap" style = "height:4px">

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
  <div id="page_center" style = "height:400px">
  <div class="cartcenter" style = "margin-top:10px">
  
<h3 style = "color: #810B0C; margin-top:50px">${userId }님이 주문하신 상품 리스트입니다</h3>
<hr>
<br/>
  <div class="tableF">
  <table width="20%" border="1" cellspacing="0" cellpadding="0"
  	style="float:left; clear:none;"
  >
  <tr>
    <td width="40%" >상품이미지</td>
    <td width="60%">상품명</td>
    <!-- 가격, 갯수 -->
  </tr>
   <%   
	Connection conn = ConnectionProvider.getConnection();
   	List<Purchase> purchases = null;
   	String memberId = (String)session.getAttribute("LOGIN");
		try{//2. try catch문 만듦
			PurchaseDao pDao = new PurchaseDao();//3. dao객체 생성
			purchases = pDao.selectListById(conn, memberId);
		}catch(SQLException e){}
 
	Connection conn1 = ConnectionProvider.getConnection();
          List<Watch> watch = null;
          Purchase purchase = null;

         	String mId = (String)session.getAttribute("LOGIN");
		try{//2. try catch문 만듦
			WatchDao wDao = new WatchDao();
			PurchaseDao pDao = new PurchaseDao();
			purchases = pDao.selectListById(conn, mId);
			for(int i=0; i<purchases.size();i++){
			watch = wDao.selectListById(conn, purchases.get(i).getWatchId());
			%>
<c:set var = "list" value = "<%=watch %>"/>	
<c:forEach var = "w" items = "<%=watch %>">
		<tr>
      <td height = "50px"><img src = "watches/${w.watchImage }" width = "50px" height = "50px"/></td>
      <td height = "52px">${w.watchName }</td>
    </tr> 
	</c:forEach>
			<%}
		}catch(SQLException e){}
	JdbcUtil.close(conn1);//dao에서 close(conn)을 주석처리 했기때문에 닫아주는 시점을 여기서 닫아주기
	JdbcUtil.close(conn);//dao에서 close(conn)을 주석처리 했기때문에 닫아주는 시점을 여기서 닫아주기

%>

  <tr height = "61px">
  	<td></td>
  	<td></td>
  </tr>
	</table>	
<table class = "purchase" width="80%" border="1" cellspacing="0" cellpadding="0"
style="float:left; clear:none;"
>
  <tr>
    <td>주문자</td>
    <td>수량</td>
    <td width="350px">배송지주소</td>
    <td width = "200px">주문일자</td>
    <td>포장여부</td>
    <td>가격</td>
    <td></td>
  </tr>
<c:set var = "sum" value = "0"/><!-- 총가격 합 -->
  <c:set var = "purchase" value = "<%=purchases %>"/>
   <c:forEach var = "p" items = "${purchase }" varStatus="status">
   
    <tr  style="height:53px">
      <td>${p.userId }</td>
      <td>${p.amount }</td>
      <td>${p.address} </td>
      <td>${p.pDate}</td>
      <td>${p.gift}</td>
      <td>￦ ${p.price}</td>
<c:set var= "sum" value="${sum + p.price}"/>
      <td><a  style="color: #555" href = "deletePurchase.jsp?purchaseId=${p.purchaseId }">주문취소</a></td>
    </tr>     
	</c:forEach>
	<tr>
	   <td colspan="7" style="height:60px; text-align:left;padding-left:280px">
	   <h4>누적 구매금액 : \ ${sum }</h4></td>
	</tr>
  </table>
</div>
  </div> <div id="quick_menu" style = "right:20px"><img src="images/fixed.png" width="137" height="80" usemap="#Map" border="0" />
   	 <map name="Map" id="Map">
        <area shape="rect" coords="7,13,132,36" href="likeList.jsp" />
        <area shape="rect" coords="5,53,134,75" href="#logo" />
      </map>
     </div>
            	<div style = "position:fixed;bottom:30px;right:50px;height:48px;width: 104px;" id="kakao-talk-channel-chat-button" data-channel-public-id="_IbZAxb" data-title="consult" data-size="small" data-color="mono" data-shape="pc" data-support-multiple-densities="true"></div>
   
</div>

  <c:set var = "height" value="${(fn:length(list)*60)+140+300 }"/>
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
</div>

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