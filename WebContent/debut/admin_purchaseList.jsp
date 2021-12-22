<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Debut</title>
<link rel="shortcut icon" type="image⁄x-icon" href="images/webicon.png">
<link href="layout.css" rel="stylesheet" type="text/css" />
<link href="admin_purchaseList.css" rel="stylesheet" type="text/css" />
<link href="cart.css" rel="stylesheet" type="text/css" />
<script src="index_js.js" type="text/javascript"></script>
</head>

<body>
<!--wrap영역-->
<div id="wrap" style = "height:auto">

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
 
 
 <c:if test="${userId ne 'admin'}">
	<script>
		alert("권한이 없습니다");
		location.href="index.jsp";
	</script>
</c:if>
  
    <!--page_center영역-->
  <div id="page_center" style = "height:auto">
   <%   
	Connection conn = ConnectionProvider.getConnection();
   	List<Purchase> list = null;//4. 저장할 배열 선언하기
		try{//2. try catch문 만듦
			PurchaseDao pDao = new PurchaseDao();//3. dao객체 생성
			list = pDao.selectList(conn);
		}catch(SQLException e){}
	JdbcUtil.close(conn);//dao에서 close(conn)을 주석처리 했기때문에 닫아주는 시점을 여기서 닫아주기

%>
<c:set var = "list" value = "<%=list %>"/><!-- 스크립트릿에 들어있는 list변수를 el로 꺼내줌/변환/반환 -->
<c:set var = "sum" value = "0"/><!-- 총가격 합 -->
<c:set var = "totalAmount" value = "0"/><!-- 총 수량 합 -->
	
<div class="cartcenter" style = "height:auto;">
<h3 style = "color: #810B0C; margin-top:50px">주문 조회</h3>
  <div class="tableF">
<table width="90%" border="1" cellspacing="0" cellpadding="0" id ="table1">
  <tr height = "40px">
    <td width="5%" class = "menu">주문</td>
    <td width="10%" class = "menu">회원아이디</td>
    <td width="10%" class = "menu">시계아이디</td>
    <td width="10%" class = "menu">총가격</td>
    <td width="10%" class = "menu">수량</td>
    <td width="10%" class = "menu">포장(Y/N)</td>
    <td width="15%" class = "menu">주문일자</td>
    <td width="30%" class = "menu">주소</td>
    <!-- 가격, 갯수 -->
  </tr>
   <c:forEach var = "purchase" items = "${list }">
   
    <tr height = "40px">
      <td class = "content">${purchase.purchaseId}</td>
      <td class = "content">${purchase.userId }</td>
      <td class = "content">${purchase.watchId}</td>
      <td class = "content">${purchase.price}</td> 
      <c:set var= "sum" value="${sum + purchase.price}"/>
      <td class = "content">${purchase.amount }</td>
      <c:set var = "totalAmount" value = "${purchase.amount + totalAmount}"/>
      <td class = "content">${purchase.gift}</td>
      <td class = "content">${purchase.pDate}</td>
      <td class = "content">${purchase.address}</td>
    </tr>    
	</c:forEach>
	<tr height="60px">
	   <td colspan="8" class = "content" style="height:60px"><h4>누적 판매 개수 : ${totalAmount}개<br/>누적 판매 금액 : \ ${sum }</h4></td>
	</tr>
  </table>
  </div>
</div>
     </div>
  <c:set var = "height" value="${(fn:length(list)*35) }"/>
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
</html>