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
	String memberId = (String)session.getAttribute("LOGIN");
	Connection conn = ConnectionProvider.getConnection();
	Watch watch = null;
		try{
			WatchDao wDao = new WatchDao();
			FavDao lDao = new FavDao();
			watch = wDao.selectById(conn, watchId);
			wDao.updateClick(conn, watchId, 1);
		}catch(SQLException e){}
		
		
	Connection conn1 = ConnectionProvider.getConnection();
		Fav fav = new Fav(memberId, watchId, watch.getWatchName(), watch.getPrice(), watch.getWatchImage(), watch.getWatchImage1());
		try{
			FavDao fDao = new FavDao();
			fDao.insert(conn, fav);
		}catch(SQLException e){}
		JdbcUtil.close(conn);
		JdbcUtil.close(conn1);
	%>
	<c:set var = "watch" value = "<%=watch %>"/>
     </div>
  </div>
  
  
  <!--page_footer영역-->
  <jsp:include page="page_footer.jsp" />

</div>
</body>
<script>
	var input = confirm("${watch.watchName} 관심상품 등록 하였습니다. 관심상품목록으로 가시겠습니까?");
	if(input){
		location.replace("likeList.jsp");
	}else{
		history.go(-1)
	}

</script>
</html>
