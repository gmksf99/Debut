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
	int watchId = Integer.parseInt(request.getParameter("watchId"));
	int price = Integer.parseInt(request.getParameter("price"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	String memberId = (String)session.getAttribute("LOGIN");
	int totalPrice = 0;
	String gift = request.getParameter("gift");
	if(gift.equals("Y")){
		totalPrice = price*amount+(5000*amount);
	}
	else if(gift.equals("N")){
		totalPrice = price*amount;
	}
		Connection conn = ConnectionProvider.getConnection();
		Watch watch = null;//글로벌 변수 선언
		User user = null;
		try{
			WatchDao dao = new WatchDao();
			watch = dao.selectById(conn, watchId);//selectById 메소드로 movie객체 가져옴
			dao.updateClick(conn, watchId, 2);
			UserDao dao1 = new UserDao();
			user = dao1.selectById(conn, memberId);
			dao1.updateVip(conn, userId, 1);
		}catch(SQLException e){}
	%>
	<c:set var= "watch" value = "<%=watch %>"></c:set>
	 
	 <c:if test = "${LOGIN != null }"><!-- 세션 로그인이 되어있으면 -->
	 	<c:if test="${param.watchId != null }"><!-- 사용자가 뭔가 선택을 했다면 -->
<%
	Connection conn1 = ConnectionProvider.getConnection();
	Purchase purchase = new Purchase(userId, watchId, totalPrice, amount, gift , new java.util.Date(),user.getAddress(),watch.getWatchStyle());
	try{
		PurchaseDao dao = new PurchaseDao();
		dao.insert(conn1, purchase);//selectById 메소드로 watch객체 가져옴
	}catch(SQLException e){}
	JdbcUtil.close(conn);
	JdbcUtil.close(conn1);

%>
	 	</c:if>
	 </c:if> 	
     </div>
  </div>
  <script>
  var input = confirm("주문이 완료되었습니다. 확인하시겠습니까?");
	if(input){
		location.replace("purchaseList.jsp");
	}else{
		history.go(-1);
	}
  </script>
  
  <!--page_footer영역-->
  <jsp:include page="page_footer.jsp" />

</div>
</body>
</html>
