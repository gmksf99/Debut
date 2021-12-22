<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- 프레픽스 c를 쓰겠다고 선언함 -->
<%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Debut</title>
<link rel="shortcut icon" type="image⁄x-icon" href="images/webicon.png">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script> 
<script src="index_js.js" type="text/javascript"></script>
<script src="menu.js" type="text/javascript"></script>
<link href="layout.css" rel="stylesheet" type="text/css" />
<link href="userList.css" rel="stylesheet" type="text/css" />
<script>
    function watchDelete(deleteID){
               location.href = "deleteUser.jsp?userId=" + deleteID;                  
    }
    function watchUpdate(updateID){
        location.href = "updateUser.jsp?userId=" + updateID;                  
}
    function searchCheck(frm){
        if(frm.keyWord.value ==""){
            alert("검색 단어를 입력하세요.");
            frm.keyWord.focus();
            return;
        }
        frm.submit();      
    }
</script>
</head>

<body>
<div id = "wrap" style="height:400px">


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


<c:if test="${userId ne 'admin'}">
	<script>
		alert("권한이 없습니다");
		location.href="index.jsp";
	</script>
</c:if>

<%

    request.setCharacterEncoding("UTF-8");
    String keyField = request.getParameter("keyField");
    String keyWord = request.getParameter("keyWord");
    List<User> list = null;
    Connection conn = ConnectionProvider.getConnection();
    int userSum = 0;
    try{
    	UserDao dao = new UserDao();
    	list = dao.selectLike(conn, keyField, keyWord);
    }catch(SQLException e){	}
%>
<c:set var = "list" value = "<%=list %>"/><!-- 스크립트릿에 들어있는 list변수를 el로 꺼내줌/변환/반환 -->

<div id = "page_center" style="height:400px"><!-- page_center -->
<h3 style = "color: #810B0C; margin-top:50px">회원 정보 조회</h3>
  <table width="90%" border="1" cellspacing="0" cellpadding="0">
  
  <tr>
    <td width="11%" class = "menu">아이디</td>
    <td width="13%" class = "menu">이름</td>
    <td width="13%" class = "menu">생일</td>
    <td width="32%" class = "menu">주소</td>
    <td width="15%" class = "menu">연락처</td>
    <td width="6%" class = "menu">구매횟수</td>
    <td width="5%" class = "menu">&nbsp;</td>
    <td width="5%" class = "menu">&nbsp;</td>
  </tr>
  <c:forEach var = "user" items = "${list }">
        <tr style="height:40px">
    		<td class = "content">${user.userId }</td>
   			<td class = "content">${user.userName }</td>
    		<td class = "content">${user.userBirth }</td>
    		<td class = "content">${user.address }</td>
    		<td class = "content">${user.phone }</td>
    		<td class = "content">${user.vip }</td>
    		<td class = "content"><a style="color:#000" onclick="watchUpdate('${user.userId}')">수정</a></td>
    		<td class = "content"><a style="color:#000" onclick="watchDelete('${user.userId}')">삭제</a></td>
  		</tr>       
 	</c:forEach>
  <tr>
        <td colspan="8" class = "menu"><p align="right"><a href="userList.jsp" style="color:#000">[전체목록]</a> | <a href="userListOrderByVip.jsp" style="color:#000">[우수고객순정렬]</a> </p></td>
   </tr>
   
   <tr>  
        <td colspan="8" class = "menu"><br/>
            <form name="search" method ="post">
            <select name="keyField"><!-- 검색할 분야? -->
                <option value="0"> ----선택----</option>
                <option value="userId">아이디</option>
                <option value="userName">이름</option>
                <option value="userBirth">생일</option>
                <option value="address">주소</option>
                <option value="phone">연락처</option>
            </select>
            <input type="text" name="keyWord" />
  <input type="button" value="검색" onclick="searchCheck(form)" />
            </form><br/>
           </td>      
    </tr>
</table>

</div><!-- page_center -->


<c:set var = "height" value="${(fn:length(list))*40+140 }"/>
<!--page_footer영역-->
  <div id="page_footer" style="margin-top:${height}px">
  	<div class="footer_list">
    	<ul>
        	<li class = "footerList"><a href = "bottomSet.jsp#OC">Our Company</a></li>
            <li class = "footerList"><a href = "bottomSet.jsp#FAQ">FAQ</a></li>
            <li class = "footerList"><a href = "bottomSet.jsp#SG">Shop Guide</a></li>
            <li class = "footerList"><a href = "bottomSet.jsp#PI">개인정보처리방침</a></li>
        </ul>
    </div>
    <div class="footer_info">
    상호. (주)Debut. 김나은 김영한 이수빈. po02026@kpu.ac.kr 전화. 010-9594-6165<br />
주소. 경기도 시흥시 정왕동 2121
사업자등록번호. 1418-314316(사업자정보확인) 개인정보 보호 책임자. 김나은 김영한 이수빈<br /><br />
(c) Debut. all rights reserved. designed by Debut.</div>
  </div><!-- page_footer -->

</div><!-- wrap -->
</body>
</html>
