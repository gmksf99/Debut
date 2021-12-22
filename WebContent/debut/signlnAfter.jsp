<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.dao.*,my.util.*,my.model.*,java.sql.*,java.util.*" %> 
<%@ page import="java.net.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Debut</title>
<link rel="shortcut icon" type="image⁄x-icon" href="images/webicon.png">
<link href="css/loginF.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.start {
   height: 40px;
   width: 250px;
   margin-right: auto;
   margin-left: auto;
   font-weight: bold;
   background-color: #810B0C;
   color: #FFF;
   font-size: 18px;
   vertical-align: middle;
   padding-top: 15px;
   text-align: center;
}
.login_te p {
   font-size: 16px;
   color: #810B0C;
   text-align: center;
}
</style>
</head>

<body>
<fmt:requestEncoding value = "utf-8"/>

<%
   request.setCharacterEncoding("utf-8");
   String userId = request.getParameter("userId");
   String pwd = request.getParameter("pwd");
   String userName = request.getParameter("userName"); 
   String userbirth1 = request.getParameter("userbirth1");
   String userbirth2 = request.getParameter("userbirth2");
   String userbirth3 = request.getParameter("userbirth3");
   String userBirth = userbirth1+userbirth2+userbirth3;
   String address = request.getParameter("address");
   String phone = request.getParameter("phone"); 
      
   Connection conn = ConnectionProvider.getConnection();
   try {
      User user = new User(userId, pwd, userName, userBirth, address, phone);
      UserDao dao = new UserDao();
      dao.insert(conn, user);
      }catch(SQLException e){}
%>
      
    <div id="wrap" style="height:600px">
   <!--page_header영역-->
   <div id="page_header">
   <jsp:include page="page_header.jsp" />
   </div>
   <!--page_center영역-->
  <div id="page_center" style="height:500px">
   <center>
           <h2><font color="#810B0C">환영합니다!!</font></h2></center>
            <!-- 회원가입 완료 -->
           <div class="login_te">
             <p> &quot; <%=userName %> &quot; 님 Debut 회원이 되신 것을 축하합니다.</font></p>
             <p>Debut의 새로운 아이디는 &quot; <%=userId %> &quot;</font> 입니다.</p><br>
             <p>시작페이지에서 로그인해주세요 :)</p>
             <div class="start">
            <a href="index.jsp">
            <font color="#FFF"/>시작하기</a>
            </div>
              </div>
              
         <p align="center">
         </p>
     </div>  
               	<div style = "position:fixed;bottom:30px;right:50px;height:48px;width: 104px;" id="kakao-talk-channel-chat-button" data-channel-public-id="_IbZAxb" data-title="consult" data-size="small" data-color="mono" data-shape="pc" data-support-multiple-densities="true"></div>
     
    </div>       
 <!--page_footer영역-->
    <div id="page_footer">
   <jsp:include page="page_footer.jsp" />
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