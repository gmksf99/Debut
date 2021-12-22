<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title>
<style type="text/css">
      #form{
   width: 500px;
   height: 400px;
   background-image: url(Images/back.png);
   background-repeat: no-repeat;
      }
      
      #form2{
   width: 390px;
   height: 300px;
   margin-left: auto;
   margin-right: auto;
   padding-top: 20px;
   text-align: left;
      }
    #userName {
   border: 1px solid #FFF;
   text-decoration: blink;
}   
   #birth {
   border: 1px solid #FFF;
   text-decoration: blink;
}

   #phone {
   border: 1px solid #FFF;
   text-decoration: blink;
}
    table tr td {
   border: 1px solid #810B0C;
}

    table tr th {
   color: #FFF;
   text-align: center;
}
body a {
   text-align: right;
}
</style>
</head>
<body>
   <%
      request.setCharacterEncoding("utf-8");
      String userId = request.getParameter("userId");
      String userName = request.getParameter("userName");
      String userbirth = request.getParameter("birth");

      Connection conn = ConnectionProvider.getConnection();
      User user = new User();

      try {
         UserDao userDao = new UserDao();
         user = userDao.select2(conn, userId, userName, userbirth);
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn);
      }
      if (user != null) {
   %>
   <div id="form">
    <div id="form2">
    <h2>비밀번호 찾기</h2><hr>
   <h3>등록된 <%=userName%>님의 비밀번호</h3>
      <table width="330" height="60">
         <tr>
            <th width="150" bgcolor="#810B0C">아이디</th>
            <td width="232"><%=user.getUserId()%></td>
         </tr>
         <tr>
            <th width="150" bgcolor="#810B0C">비밀번호</th>
            <td width="232"><%=user.getPwd()%></td>
         </tr>
      </table>
   <a href="#" onClick="window.close()">[확인]</a>
   <%
      } else {
   %>
   <script>
      alert("검색결과가 없습니다.");
      history.go(-1);
   </script>
   <%
      }
   %>
        </div>
    </div>
</body>
