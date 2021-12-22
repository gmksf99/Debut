<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Integer watchCount=(Integer)session.getAttribute("watchCount");//인티저 타입 객체임
	if(watchCount!=null){
   		 for(int i=1; i<= watchCount.intValue(); i++) 
   			 session.removeAttribute("watch"+i);
   		session.removeAttribute("watchCount");
  		 
 	}     
%>
<script>
	var input = confirm('카트를 비웠습니다.'); 
	if(input){
		location.href = "index.jsp";
	}else{
		location.href = "index.jsp";
	}
</script>

<a href= "index.jsp"> 처음으로 돌아가기 </a>

</body>
</html>
