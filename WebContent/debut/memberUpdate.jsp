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
<link href="layout.css" rel="stylesheet" type="text/css" />
<link href="MyPage.css" rel="stylesheet" type="text/css" />
<script src="index_js.js" type="text/javascript"></script>
<style type="">
#ID {
	height: 50px;
	width: 400px;
	border: 1px solid #FFF;
	font-size: 32px;
	color: #810A0B;
	text-align: center;
}
#PW {
	height: 50px;
	width: 400px;
	border: 1px solid #FFF;
	font-size: 32px;
	color: #810A0B;
	text-align: center;
}
#PWO {
	height: 50px;
	width: 400px;
	border: 1px solid #FFF;
	font-size: 32px;
	color: #810A0B;
	text-align: center;
}
#name {
	height: 50px;
	width: 400px;
	border: 1px solid #FFF;
	font-size: 32px;
	color: #810A0B;
	text-align: center;
}
#add {
	height: 50px;
	width: 400px;
	border: 1px solid #FFF;
	font-size: 32px;
	color: #810A0B;
	text-align: center;
}
#PN {
	height: 50px;
	width: 400px;
	border: 1px solid #FFF;
	font-size: 32px;
	color: #810A0B;
	text-align: center;
}
#OK {
	font-size: 18px;
	background-color: #810B0C;
	color: #FFF;
	border: 1px solid #000;
	margin-right: 5px;
	margin-top : 10px;
}
#out {
	font-size: 18px;
	background-color: #810B0C;
	color: #FFF;
	border: 1px solid #000;
	margin-top : 10px;
}
</style>
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

<%
	Connection conn = ConnectionProvider.getConnection();
	User user = null;
	try{
		UserDao dao = new UserDao();
		user = dao.selectById(conn, userId);
	}catch(SQLException e){}
	JdbcUtil.close(conn);
%>

<c:set var = "user" value = "<%=user%>"/>
  
    <!--page_center영역-->
  <div id="page_center" style = "height:800px; margin-top:50px">
    <div class="brands">
      <div class="front">
        <div class="MP">My page
        </div>
      </div>
      <div class="MPtable" style = "height:500px; width :800px">
        <form id="form1" name="form1" method="post" action="mem_change.jsp">
          <table width="800" height="500" border="5" cellspacing="5" margin-top="20" margin-left="20">
            <tr>
              <td width="90">ID</td>
              <td width="292">
              <label for="ID"><%=userId %></label>
             </td>
            </tr>
            <tr>
              <td>PW재설정</td>
              <td><label for="PW"></label>
              <input type="password" name="pwd" id="PW" value="${user.pwd}"/></td>
            </tr>
            <tr>
              <td>이름</td>
              <td><input type="text" name="name" id="name" value="${user.userName}" /></td>
            </tr>
            <tr>
              <td>주소</td>
              <td><input type="text" name="add" id="add" value="${user.address}" /></td>
            </tr>
            <tr>
              <td>연락처</td>
              <td><input type="text" name="PN" id="PN" value="${user.phone}" /></td>
            </tr>
          </table>
          <input type="submit" name="OK" id="OK" value="저장" /> 
          <input type="button" onClick="delectMem()" name="out" id="out" value="회원 탈퇴" />
      </form>
      </div>
    </div>
     <!-- 사이드 퀵 메뉴 -->
 	<div id="quick_menu"><img src="images/fixed.png" width="137" height="80" usemap="#Map" border="0" />
   	 <map name="Map" id="Map">
        <area shape="rect" coords="7,13,132,36" href="likeList.jsp" />
        <area shape="rect" coords="5,53,134,75" href="#logo" />
      </map>
     </div>
               	<div style = "position:fixed;bottom:30px;right:50px;height:48px;width: 104px;" id="kakao-talk-channel-chat-button" data-channel-public-id="_IbZAxb" data-title="consult" data-size="small" data-color="mono" data-shape="pc" data-support-multiple-densities="true"></div>
</div>
  
<!--page_footer영역-->
  <jsp:include page="page_footer.jsp" />

</div>
</body>
<script>
function delectMem(){
		location.href = 'mem_delect.jsp';
}
</script>
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
    