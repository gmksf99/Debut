<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
.item {
	float: left;
	height: 370px;
	width: 250px;
	margin-right: 25px;
	margin-left: 25px;
	margin-top: 0px;
}
.watchName{
	color: #555;
	border-top-style: solid;
	border-top-width: 1.1px;
	border-top-color: #810B0C;
	font-size: 18px;
	text-align: center;
	padding-top:10px;
}
.price{
	color: #810B0C;
	border-top-style: none;
	font-size: 14px;
	text-align:center;
	padding-top:10px;
}
table {
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
	width:250px;
}
#orderbyList {
	float: right;
	height: 20px;
	width: 200px;
	margin-top: 20px;
	margin-right: 90px;
}
.select {
	clear: both;
	float: left;
	height: 1250px;
	width: 1200px;
	margin-top:20px;
	padding-left:140px;
}
.watchImage{
	height:250px;
}

#page_center{
	height:5000px;
}
#page_footer{
	margin-top:1000px;
}
form{display:inline}
.title{
	float:left;
	width :300px;
	height:30px;
	text-align: center;
    margin-left: 450px;
    margin-top:10px;
    margin-bottom:20px;
}
</style>
</head>

<body>
<div id = "wrap">

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
  <div id="page_center">
	  <div class = "title"><h2 style = "color: #810B0C"><%=session.getAttribute("LOGIN") %>님의 관심상품</h2></div>
    <div class="select">    
    
   <%
   String cp = request.getContextPath();
   request.setCharacterEncoding("utf-8");
   
   Cookie[] ck = request.getCookies();
   Connection conn = ConnectionProvider.getConnection();
   for(Cookie c:ck){
	   String watchId = c.getName();
		List<Watch> list = null;
			try{
				WatchDao wDao = new WatchDao();
				list = wDao.selectListById(conn, Integer.parseInt(watchId));%>
				<c:set var ="watch" value ="<%=list %>"></c:set>
	  		<div class="item">
      			<table width="200px" height="300px" cellspacing="0" cellpadding="1">
	 			<tr>
				  <td class = "watchImage" height = "300px">
				  <a href = "detail.jsp?watchId=">
				  <img src = "watches/" width = "250"
				   onmouseover="this.src='watches/'" onmouseout="this.src='watches/'"/></a></td>
				</tr>
				<tr>
				  <td class = "watchName">
				  <a  style="color: #555" href = "detail.jsp?watchId=">
				  <strong>${watch.watchName }</strong></a></td>
				</tr>
			   <tr>
				  <td class = "price"><a  style="color: #810B0C" href = "detail.jsp?watchId="> 
				  ￦
				  </a> </td>
				</tr>
				<tr>
				  <td class = "price"><a  style="color: #555" href = "deleteFav.jsp?favId="> 
				  관심목록에서 삭제
				  </a> </td>
				</tr>
				</table>
     		 </div>  

<%
			}catch(SQLException e){}
			JdbcUtil.close(conn);
   }
%>
    </div>
    

 <div id="quick_menu"><img src="images/fixed.png" width="107" height="94" /></div>
</div><!-- end page_center영역 -->

<!-- footer -->
	<jsp:include page="page_footer.jsp" />
	
</div><!--end warp -->
</body>
</html>
