<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Debut</title>
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
  <jsp:include page="admin_header.jsp" />
  
    <!--page_center영역-->
  <div id="page_center" style = "height:500px">
 	<div class="recommend">
 	<%
	int purId = Integer.parseInt(request.getParameter("purchaseId"));
	Connection conn = ConnectionProvider.getConnection();
	try{
		PurchaseDao dao = new PurchaseDao();
		dao.deleteById(conn, purId);//13행에 아이디로 받았으니까
	}catch(SQLException e){}
	JdbcUtil.close(conn);
	response.sendRedirect("purchaseList.jsp");
%>
     </div>
  </div>
  
  
  <!--page_footer영역-->
  <jsp:include page="page_footer.jsp" />

</div>
</body>
</html>
