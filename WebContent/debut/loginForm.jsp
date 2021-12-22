<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Debut</title>
<link href="css/loginF.css" rel="stylesheet" type="text/css" /><style type="text/css">
.click_login{
   font-size: 36px;
   font-family: 'Nanum Myeongjo', serif;
   margin-right: auto;
   margin-left: auto;
   width: 500px;
   background-color: #FFF;
}
.click_login input {
   background-color: #810B0C;
   color: #FFF;
font-family: 'Nanum Myeongjo', serif;
   font-size: 36px;
   width: 150px;
   text-align: center;
   margin-left: auto;
   margin-right: auto;
}
#page_center {
   font-size: 16px;
}
</style>

</head>

<body>
    <div id="wrap" style="height:600px">
   <!--page_header영역-->
   <div id="page_header">
    <jsp:include page="page_header.jsp" />
</div>
   <!--page_center영역-->
  <div id="page_center" style="height:450px">
         <center>
           <h2><font color="#810B0C">회원 로그인</font></h2></center>
                                                                                 <!--  아래 부분은 로그인 폼  -->
         <form action="loginCheck.jsp" method="post">
           <div class="login_te">
             <div class="id_area">
             <span>
                <input type="text" name = "userId" id="userId" class="input-text" placeholder="아이디" maxlength="20"/>
            </span>
            </div>
             <div class="pw_area"><input type="password" name = "pwd" id="pwd" class="input-text" placeholder="비밀번호" maxlength="20"/>
             </div>
                <div class="click_login"><input type = "submit" value = "login"/>
                </div>
           </div>    
            </form>
            
         <p align="center">
            <a href="#" onClick="sid()" style="color: #000;">ID 찾기</a> / <a href="#" onClick="spass()" style="color: #000;">비밀번호 찾기</a> / <a id= "join" href="agreement.jsp" style="color: #000;">회원가입</a>
         </p>
         
         
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
<script>
   function sid(){
      window.open("id_select.jsp","","height = 450, width = 460, resizable=no, location=no, resizable=no");
   }
   
   function spass(){
      window.open("pass_select.jsp","","height = 450, width = 460, resizable=no, location=no, resizable=no");
   }
   //아이디, 비번 미 입력시 오류
   function vaildjoin(){
      var userId = document.getElementById('userId').value.trim();
      var password = document.getElementById('pwd').value.trim();
      
      if(userId != 0 && password != 0) {
         location.href = 'loginCheck.jsp';
      }
      
      else if (userId == 0) {
         alert("아이디를 입력해주세요.");
         return false;
      }
      
      else if (password == 0) {
         alert("비밀번호를 입력해주세요.");
         return false;
      }
   }
</script>
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