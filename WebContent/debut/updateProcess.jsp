<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
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
  <jsp:include page="page_header.jsp" />
  
    <!--page_center영역-->
  <div id="page_center" style = "height:500px">
 	<div class="recommend">
 	 <%  
					//String uploadPath = request.getRealPath("/movies");//만든 movies폴더 이름 쓰기
 				String uploadPath = "C:\\Users\\kimna\\workspace\\1118\\WebContent\\debut\\watches";
  				int maxSize =1024 *1024 *10;
 				Connection conn = ConnectionProvider.getConnection();//데이터베이스 처리하는 애니까 일단 주석처리
 				String watchName = "";
 				String brand = "";
 				int price=0;
 				String fileName = "";//글로벌 변수로 선언
 				String memo = "";
 				String watchStyle="";
 				String watchAge="";
 				String watchType = "";
 				String watchImage1="";
 				String watchImage2="";
 				String watchImage3="";
 				try{
 	  				MultipartRequest multi =new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
 	  				int watchId = Integer.parseInt(multi.getParameter("watchId"));
         			watchName = multi.getParameter("watchName");
       				brand = multi.getParameter("brand");
       				price = Integer.parseInt(multi.getParameter("price"));
        			fileName = multi.getFilesystemName("watchImage");
        			memo = multi.getParameter("memo");
        			watchStyle = multi.getParameter("watchStyle");
        			watchAge = multi.getParameter("watchAge");
        			watchType = multi.getParameter("watchType");
        			watchImage1 = multi.getFilesystemName("watchImage1");
        			watchImage2 = multi.getFilesystemName("watchImage2");
        			watchImage3 = multi.getFilesystemName("watchImage3");
        			Watch watch = new Watch(watchName,brand,price,fileName,memo, new java.util.Date() ,watchStyle, watchAge,watchType,watchImage1,watchImage2,watchImage3);
 					watch.setWatchId(watchId);
 					WatchDao dao = new WatchDao();
 					
 					dao.update(conn, watch);
 				}catch(SQLException e){}
 				  
				%>
 	
 	
         <%=watchName %> 시계 수정 완료
         <a style = "color:#000" href = "selectAll.jsp">상품 목록 보기</a>
     </div>
  </div>
  
  
  <!--page_footer영역-->
  <jsp:include page="page_footer.jsp" />

</div>
</body>
</html>
