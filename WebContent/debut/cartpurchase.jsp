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
<link href="layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#wrap{
	height:500px;
}
.viewlist{
	color:#000;
}
</style>
<link href="layout.css" rel="stylesheet" type="text/css" />
<script src="index_js.js" type="text/javascript"></script>


</head>

<body>
<!--wrap영역-->
<div id="wrap" style = "height:800px">

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
  <div id="page_center" style = "height:500px">
 	<div class="recommend">
 	<%   
	Integer watchCount=(Integer)session.getAttribute("watchCount");//인티저 타입 객체임

	Connection conn = ConnectionProvider.getConnection();
	WatchDao mDao = new WatchDao();
	PurchaseDao pDao = new PurchaseDao();
	String memberId = (String)session.getAttribute("LOGIN");//세션겟어트리뷰트로 사용자 정보를 가져옴
	int totalPrice=0;
	int allPrice=0;
	UserDao uDao = new UserDao();
	try{
		if(watchCount!=null){//뭔가 카트에 들어있다.
			Cart cart = null;
    		for(int i=1; i<= watchCount.intValue(); i++) {//여러개가 들어있다면 for문을 통해서 여러개 만큼 반복
   				 cart = (Cart)session.getAttribute("watch" + i);
   				 Watch watch = mDao.selectById(conn, Integer.parseInt(cart.getId()));//cart의 id값은 String이기때문에 int형변환 필요
   				 User user = uDao.selectById(conn, memberId);
   				 if(cart.getGift().equals("Y")){
   				 	totalPrice = watch.getPrice()*cart.getAmount()+5000*cart.getAmount();
   				 	allPrice += totalPrice;
   				 }else if(cart.getGift().equals("N")){
   					totalPrice = watch.getPrice()*cart.getAmount(); 
   					allPrice += totalPrice;
   				 }
   				 Purchase pur = new Purchase(memberId, watch.getWatchId(),totalPrice,cart.getAmount(),cart.getGift() ,new java.util.Date(),user.getAddress(),watch.getWatchStyle());//구매객체 만듦
   				 pDao.insert(conn, pur);//PurchaseDao의 insert를 활용하여 pur객체 집어넣음
   				mDao.updateClick(conn, watch.getWatchId(), 2);
   				uDao.updateVip(conn, userId, 1);
    		}
		}
	}catch(SQLException e){} 
	JdbcUtil.close(conn);//dao에서 close(conn)을 주석처리 했기때문에 닫아주는 시점을 여기서 닫아주기
%>
<br><br>
<hr><br><br>
<hr>
<br><br>
     </div>
     
     <div id="quick_menu"><img src="images/fixed.png" width="137" height="80" usemap="#Map" border="0" />
   	 <map name="Map" id="Map">
        <area shape="rect" coords="7,13,132,36" href="likeList.jsp" />
        <area shape="rect" coords="5,53,134,75" href="#logo" />
      </map>
     </div>
  </div>
  
  
  <!--page_footer영역-->
  <jsp:include page="page_footer.jsp" />

</div>
</body>
</html>
