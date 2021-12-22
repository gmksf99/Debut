<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- 프레픽스 c를 쓰겠다고 선언함 -->
<%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
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
<link href="admincrud.css" rel="stylesheet" type="text/css" />
<script>
    function watchDelete(deleteID){
               location.href = "deleteWatch.jsp?watchId=" + deleteID;                  
    }
    function watchUpdate(updateID){
        location.href = "updateWatch.jsp?watchId=" + updateID;                  
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
<div id = "wrap">


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
    List<Watch> list = null;
    Connection conn = ConnectionProvider.getConnection();
    try{
    	WatchDao dao = new WatchDao();
    	list = dao.selectLike(conn, keyField, keyWord);//검색된 결과를 list에 저장함
    }catch(SQLException e){	}
%>
<c:set var = "list" value = "<%=list %>"/><!-- 스크립트릿에 들어있는 list변수를 el로 꺼내줌/변환/반환 -->


<div id = "page_center"><!-- page_center -->

<h3 style = "color: #810B0C; margin-top:50px">상품 관리</h3>

  <table width="90%" border="1" cellspacing="0" cellpadding="0">
  <tr style = "height:30px">
    <td width="9%" class = "menu">아이디</td>
    <td width="13%" class = "menu">시계품명</td>
    <td width="13%" class = "menu">브랜드</td>
    <td width="40%" class = "menu">상세정보</td>
    <td width="15%" class = "menu">이미지</td>
    <td width="5%" class = "menu">&nbsp;</td>
    <td width="5%" class = "menu">&nbsp;</td>
  </tr>
  <c:forEach var = "watch" items = "${list }">
        <tr>
    		<td class = "content">${watch.watchId }</td>
   			<td class = "content">${watch.watchName }</td>
    		<td class = "content">${watch.brand }</td>
    		<td class = "content">${watch.memo }</td>
    		<td class = "content"><img src="watches/${watch.watchImage }" width="50" height="50" /></td>
    		<td class = "content"><a style="color:#000" onclick="watchUpdate('${watch.watchId}')">수정</a></td>
    		<td class = "content"><a style="color:#000" onclick="watchDelete('${watch.watchId}')">삭제</a></td>
  		</tr>       
 	</c:forEach>
  <tr>
        <td colspan="7" class = "menu"><p align="right"><a href="selectAll.jsp" style="color:#000">[전체목록]</a> | <a href="insertForm.jsp" style="color:#000">[시계등록]</a> </p></td>
   </tr>
   
   <tr>  
        <td colspan="7" class = "menu"><br/>
            <form name="search" method ="post">
            <select name="keyField"><!-- 검색할 분야? -->
                <option value="0"> ----선택----</option>
                <option value="watchId">아이디</option>
                <option value="brand">브랜드</option>
                <option value="memo">상세정보</option>
            </select>
            <input type="text" name="keyWord" />
  <input type="button" value="검색" onclick="searchCheck(form)" />
            </form><br/>
           </td>      
    </tr>
</table>

</div><!-- page_center -->

<c:set var = "height" value="${(fn:length(list))*50+140 }"/>
<!--page_footer영역-->
  <div id="page_footer" style="margin-top:${height}">
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
