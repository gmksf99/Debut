<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    </style>
</head>
<body>
	<div id="form">
    <div id="form2">
	<h2>아이디 찾기</h2><hr>
	<form action="searchId.jsp" method="post">
		<h3>등록된 회원님의 정보</h3>
		<table width="383" height="124">
			<tr>
				<th width="156" bgcolor="#810B0C">이름</th>
				<td width="232"><input type="text" name="userName" id="userName"></td>
			</tr>
			<tr>
				<th height="29" bgcolor="#810B0C">생년월일<br/>(ex.20190101)</th>
				<td ><input type="text" name="birth" id="birth">
			</tr>
			<tr>
				<th bgcolor="#810B0C">전화번호</th>
				<td><input type="text" name="phone" id="phone"></td>
			</tr>
			<tr>
				<th colspan="2" bgcolor="#FFFFFF"><input type="submit" value="조회"></th>
			</tr>
		</table>
	</form>
		<form action="searchId2.jsp" method="post">
	</form>
    </div>
	</div>
</body>
</html>