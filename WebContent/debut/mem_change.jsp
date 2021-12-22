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
<%	request.setCharacterEncoding("utf-8"); %>
<% String userId = (String)session.getAttribute("LOGIN"); %>
<%

	Connection conn = ConnectionProvider.getConnection(); 
	String pwd="";
	String userName="";
	String address = "";
	String phone="";
	try {
		pwd = request.getParameter("pwd");
		userName = request.getParameter("name");
		address = request.getParameter("add");
		phone = request.getParameter("PN");
		UserDao dao = new UserDao();
		User user = dao.selectById(conn, userId);
		User user1 = new User(userId, pwd, userName, user.getUserBirth(), user.getAddress(), phone);
		dao.update(conn, user1); 
	}catch(SQLException e){
		e.printStackTrace();
	}
	JdbcUtil.close(conn);
%>
<jsp:forward page="memberInfo.jsp"></jsp:forward>
</body>
</html>