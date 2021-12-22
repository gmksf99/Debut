<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Debut</title>
</head>
<body>
<% String userId = (String)session.getAttribute("LOGIN"); %>
<%
	Connection conn = ConnectionProvider.getConnection();
	try{
		UserDao dao = new UserDao();
		dao.deleteById(conn, userId);//13행에 아이디로 받았으니까
	}catch(SQLException e){}
%>
<%
		session.invalidate();
	%>
<script>
alert("탈퇴되었습니다!");
location.href="index.jsp";
</script>
</body>
</html>