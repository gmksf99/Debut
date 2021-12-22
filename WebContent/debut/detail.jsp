<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- 프레픽스 c를 쓰겠다고 선언함 -->
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="layout.css" rel="stylesheet" type="text/css" />
<link href="detail.css" rel="stylesheet" type="text/css" />
<script src="index_js.js" type="text/javascript"></script>
<title>Debut</title>
<link rel="shortcut icon" type="image⁄x-icon" href="images/webicon.png">
</head>

<body>
<div id = "wrap" style = "height:3400px">

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


<div id =  "page_center">
  <%
	int watchId = Integer.parseInt(request.getParameter("watchId"));
	Connection conn = ConnectionProvider.getConnection();
	Watch watch = null;
	try{
		WatchDao dao = new WatchDao();
		watch = dao.selectById(conn, watchId);
		dao.updateClick(conn, watchId, 1);//detail.jsp에 들어 올 때 마다 watchclick값을 1씩 증가
	}catch(SQLException e){}
%>

<c:set var = "watch" value = "<%=watch %>"/>
<c:set var = "watchId" value = "${watch.watchId }"/>
<c:set var = "price" value = "${watch.price }"/>

  <div class="detail_image">
  <img alt = "watch_Image" src="watches/${watch.watchImage }" width="400" height="400" /></div>
  <div class="datail_txt">
    <form action = "" method = "post">
  <table width="500" border="1" cellspacing="0" cellpadding="1">
  <tr>
    <td colspan="2" class = "watchName"> ${watch.watchName}</td>
    </tr>
  <tr>
    <td colspan="2" class = "price">￦ ${watch.price }</td>
    </tr>
  <tr>
    <td width="186" class = "title line">브랜드</td>
    <td width="304" class = "content line brandTable">${watch.brand }</td>
  </tr>
  <tr>
    <td class = "title">소재</td>
    <td class = "content">${watch.watchType }</td>
  </tr>
  <tr>
    <td class = "title memo">상세정보</td>
    <td class = "content memo">${watch.memo }</td>
  </tr>
  <tr>
    <td class = "title">상품등록일자</td>
    <td class = "content">${watch.watchTime }</td>
  </tr>
  <tr>
    <td class = "title">시계스타일</td>
    <td class = "content watchStyle"><c:forEach var = "styles" items = "${watch.watchStyle }"><span style = "background-color:#FFCCFF"># ${styles }</span>    </c:forEach></td>
  </tr>
  <tr>
    <td>추천연령대</td>
    
    <td class = "content">${watch.watchAge }</td>
  </tr>
  <tr>
    <td>옵션</td>
    <td class = "content">
    	수량
    	<select name="amount">
	      <option value="1">1개</option>
	      <option value="2">2개</option>
	      <option value="3">3개</option>
	      <option value="4">4개</option>
	    </select>&nbsp;&nbsp;
	        선물포장
	     <select name="gift">
	      <option value="N">포장안함</option>
	      <option value="Y">포장추가(+5000)</option>
	    </select>
    </td>
  </tr>
  <tr>
    <td colspan="2" class = "buttonBuy">
        <input type="button" onclick="purchase(form)" class = "btn_submit"/>
        <input type="button" onclick="putcart(form)" class = "btn_putcart"/>
        <input type="button" onclick="putfav(form)" class = "btn_putfav"/>
    </td>
    </tr>
</table>
</form>

</div>
  <div class="detail_image0">
    <div class="detail_image1"><img alt = "watch_Image" src="watches/${watch.watchImage1 }" width="800" height="800" /></div>
    <div class="detail_image1"><img alt = "watch_Image" src="watches/${watch.watchImage2 }" width="800" height="800" /></div>
    <div class="detail_image1"><img alt = "watch_Image" src="watches/${watch.watchImage3 }" width="800" height="800" /></div>
  </div>
  
  <div class="product_info">
    <div class="product_info"><img src="images/product_info.png" width="800" height="2480" /></div>
  </div>


	<div id="quick_menu"><img src="images/fixed.png" width="137" height="80" usemap="#Map" border="0" />
   	 <map name="Map" id="Map">
        <area shape="rect" coords="7,13,132,36" href="likeList.jsp" />
        <area shape="rect" coords="5,53,134,75" href="#logo" />
      </map>
     </div>
          	<div style = "position:fixed;bottom:30px;right:50px;height:48px;width: 104px;" id="kakao-talk-channel-chat-button" data-channel-public-id="_IbZAxb" data-title="consult" data-size="small" data-color="mono" data-shape="pc" data-support-multiple-densities="true"></div>
</div>



 <!--page_footer영역-->
  <div id="page_footer" style ="margin-top:4330px">
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
  
  
<script>
function purchase(frm){
	var amount = frm.amount.value.trim();
	var gift = frm.gift.value.trim();
	location.href = "purchase.jsp?watchId="+${watchId}+"&price="+${price}+"&amount="+amount+"&gift="+gift;
}

function putcart(frm){
	var amount = frm.amount.value.trim();
	var gift = frm.gift.value.trim();
	location.href = "putcart.jsp?watchId="+${watchId}+"&price="+${price}+"&amount="+amount+"&gift="+gift;
}

function putfav(frm){
	location.href = "putlike.jsp?watchId="+${watchId};
}

</script>
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
