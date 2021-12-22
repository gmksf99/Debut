<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="my.model.*"%>
<%@ page import="my.dao.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="my.util.JdbcUtil"%>
<%@ page import="my.util.ConnectionProvider"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userId = request.getParameter("userId");//아이디 파라미터 받기
		String pwd = request.getParameter("pwd"); // 패스워드 체크를 위한 파라미터 받아오기
		Connection conn = ConnectionProvider.getConnection();
		boolean login = false;
		try {
			User user = new User();
			UserDao dao = new UserDao(); // Dao 생성
			login = dao.checkPassword(conn, userId, pwd); // user 모델 변수 생성(userId의 값과 동일한 튜플을 찾는 쿼리 실행 : select)
		}catch(SQLException e){}	
			if (login) {//로그인 값이 true면
				session.setAttribute("LOGIN", userId);
				if(userId.equals("admin")){//관리자 계정이면
				response.sendRedirect("/1118/debut/index.jsp");//관리자 페이지로 이동 파라미터가 필요하다면 get방식으로 넣기
				}else{
				response.sendRedirect("/1118/debut/index.jsp");	//일반 회원 페이지로 ㄱㄱ
				}
			
	%>
	<%= session.getAttribute("LOGIN") %>
	<%
			}else{	%>
			<script>
				alert("아이디와 비밀번호를 확인하세요");
				history.go(-1); <!--다시 입력을 받게 돌아감-->
			</script>
	<%		} %>
</body>
</html>