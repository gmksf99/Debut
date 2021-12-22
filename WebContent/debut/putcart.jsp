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
<style type="text/css">
#wrap{
	height:500px;
}
.viewlist{
	color:#000;
}
table {
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
	margin-top:30px;
	margin-left:60px;
}
tr{
	border-top-style: none;
	border-right-style: none;
	border-left-style: none;
}
td{
	border-top-style: none;
	border-right-style: none;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #6D1B05;
	border-left-style: none;
}
</style>

<link href="layout.css" rel="stylesheet" type="text/css" />
<link href="cart.css" rel="stylesheet" type="text/css" />
<script src="index_js.js" type="text/javascript"></script>


</head>

<body>
<!--wrap영역-->
<div id="wrap" style = "height:400px">

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
 	<%
 Integer watchCount=(Integer)session.getAttribute("watchCount");//인티저 타입 객체임

if(watchCount==null)
 {
  watchCount = new Integer(0);//movieCount에 정수형 객체 초기값을 0으로 객체를 만든다 세션기본객체를 설정할때 반드시 변수가 아닌 객체로 저장해야함
 }     
 
 String watchId = request.getParameter("watchId");//movieId를 받아옴
 int amount = Integer.parseInt(request.getParameter("amount"));//amount를 integer형으로 받아옴
 String gift = request.getParameter("gift");
 
 if(watchId != null) {
	 //책 id와 amount를 저장하는 Cart 객체를 만든다.
	 Cart cart = new Cart(watchId, amount, gift);
      watchCount = new Integer(watchCount.intValue() +1);//가시킴
 
    session.setAttribute("watch"+watchCount, cart);//객체를 session에넣어준다 객체속성명을 카트에 입력 속성명, 카트(영화아이디, 어마운트)->price는 없음
    session.setAttribute("watchCount", watchCount);//속성에 숫자형을 넣기위해서는 객체로 넣어야함
    
  }
%>   

<div class="cartcenter">
<h2 style = "color: #810B0C; margin-top:50px">Cart</h2>
  <div class="tableF">
  <form action="buy_page" method = "post">
<table width="90%" border="1" cellspacing="0" cellpadding="0" id ="table1">
  <tr style = "height:40px">
    <td width="15%" class = "menu">제품이미지</td>
    <td width="13%" class = "menu">제품명</td>
    <td width="13%" class = "menu">브랜드</td>
    <td width="13%" class = "menu">수량</td>
    <td width="13%" class = "menu">가격</td>
    <td width="13%" class = "menu">포장(Y/N)</td>
    <!-- 가격, 갯수 -->
  </tr>
  
	<c:set var = "totalAmount" value = "0"/><!-- 총 수량 합 -->
	<c:set var = "totalPrice" value = "0"/><!-- 총 가격 합 -->
	<c:set var = "giftAmount" value = "0"/><!-- 총 선물갯수 합 -->
  <%    
	Connection conn = ConnectionProvider.getConnection();
	String watches = "";
	Cart cart = null;
	Watch watch = null;
	try{
		for(int i=1; i<= watchCount.intValue(); i++) {
	   		 cart = (Cart)session.getAttribute("watch" + i);
	   		 watches += cart.getId()+" : "+cart.getAmount()+"\\n";
	   		 WatchDao wDao = new WatchDao();
	   		 watch = wDao.selectById(conn, Integer.parseInt(cart.getId()));
%>

	<c:set var = "watch" value = "<%=watch %>"/><!-- el으로 watchs를 list로 바꿔줌 -->
  <tr>
    <td class = "content"><img src = "watches/${watch.watchImage }" width = "50px" height = "50px"/></td>
    <td class = "content">${watch.watchName }</td>
    <td class = "content">${watch.brand }</td>
    <td class = "content"><%=cart.getAmount() %></td>
    	<c:set var = "amount" value = "<%=cart.getAmount() %>"/>
    	<c:set var = "totalAmount" value = "${totalAmount + amount}"/>
    <td class = "content">${watch.price }</td>
    	<c:set var = "totalPrice" value = "${totalPrice+ watch.price * amount}"/>
    <td class = "content"><%=cart.getGift() %></td>
    	<c:set var = "gift" value = "<%=cart.getGift() %>"/>
    	<c:if test="${gift eq 'Y' }">
    		<c:set var = "giftAmount" value = "${giftAmount+1 }"/>
    	</c:if>
   </tr>     

<%	   }
	}catch(SQLException e){}
	finally{
		JdbcUtil.close(conn);
		}
    
%>
	<tr style = "height:150px; font-size:16px">
		<td colspan = "6">총 구매 수량 : <strong>${totalAmount }</strong>개<br/>
		포장비(\5000): <strong>${giftAmount*5000}</strong>(${giftAmount}x5000)원<br/>
		상품가격: <strong>${totalPrice }</strong>원<br/>
		결제금액: <strong>${totalPrice+giftAmount*5000 }</strong>원(상품가격+포장비)</td>
	</tr>

	<tr style = "height:50px;">
		<td colspan = "6"><a href = "cartpurchase.jsp" style = "color:#000; font-size:18px">전체구매</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
       <a href= "index.jsp" style = "color:#000; font-size:18px"> 처음으로 돌아가기 </a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
		<a href= "cartdelete.jsp" style = "color:#000; font-size:18px"> 카트 비우기 </a></td>
	</tr>
  </table>
</form>
  </div>
</div><div id="quick_menu"><img src="images/fixed.png" width="137" height="80" usemap="#Map" border="0" />
   	 <map name="Map" id="Map">
        <area shape="rect" coords="7,13,132,36" href="likeList.jsp" />
        <area shape="rect" coords="5,53,134,75" href="#logo" />
      </map>
     </div>
          	<div style = "position:fixed;bottom:30px;right:50px;height:48px;width: 104px;" id="kakao-talk-channel-chat-button" data-channel-public-id="_IbZAxb" data-title="consult" data-size="small" data-color="mono" data-shape="pc" data-support-multiple-densities="true"></div>
     </div>

<!--page_footer영역-->
  <div id="page_footer" style="margin-top:700px">
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