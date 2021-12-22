<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.dao.*,my.util.*,my.model.*,java.sql.*,java.util.*" %> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link rel="shortcut icon" type="image⁄x-icon" href="images/webicon.png">
<link href="css/signF.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.button-area input {
   font-size: 24px;
   background-color: #810B0C;
   color: #FFFFFF;
   width: 150px;
   font-family: 'Nanum Myeongjo', serif;
}
div.container {
   margin-bottom: 100px;
}
</style>
</head>
<body>
   <div class="wrap">
    <jsp:include page="page_header.jsp" />
   <div class="container" style="margin-top:50px">
      <p class="title">join membership<A onclick="(function(el, obj) {if (obj) {obj.stop();obj.setEffect(el, 'on');obj.play('https://m.search.naver.com/p/csearch/ocontent/util/ttsProxy.nhn?service=nco_translate&from=pc_search&speech_fmt=mp3&speed=3&passportKey=dd52c7126750100ce462d010c6f1d44da3ced81d&speaker=clara&text=join%20membership');}})(this, nhn.common.audio_player); return goOtherTCR(this, 'a=nco_x4z*2.sound2&r=1&i=8014594b_000000000000');;" href="javascript:;" nocr=""></A></p>
      <div class="form-area">
         <!-- ID, PWD -->
      <form action="signlnAfter.jsp" method="post">
         <table>
            <tr>
               <td>
                  <span>
                     <input type="text" name = "userId" id="userId" class="input-text" placeholder="아이디" maxlength="20" onfocusout="validateId()">
                  </span>
                  <div id="id_alert" class="alert">필수 정보입니다.</div>
               </td>
            </tr>
            <tr>
               <td>
                  <span>
                     <input type="password" name = "pwd" id="pwd" class="input-text" placeholder="비밀번호" maxlength="20" onfocusout="validatePassword()">
                  </span>
                  <div id="password_alert" class="alert">필수 정보입니다.</div>
               </td>
            </tr>
            <tr>
               <td>
                  <span>
                     <input type="password" id="pwdChk" class="input-text" placeholder="비밀번호 재확인" maxlength="20" onfocusout="validatePassword()">
                  </span>
                  <div id="check_password_alert" class="alert">필수 정보입니다.</div>
               </td>
            </tr>
         </table>
         
         <!-- BASIC INFO -->
         <table>
            <tr>
               <td>
                  <span>
                     <input type="text" id="userName" name = "userName" class="input-text" placeholder="이름" maxlength="15" onfocusout="validateName()">
                  </span>
                  <div id="name_alert" class="alert">필수 정보입니다.</div>
               </td>
            </tr>
            <tr>
               <td>
                  <span>
                     <input type="text" name = "userbirth1" id="userbirth1" class="input-text birth" placeholder="년(4자)" maxlength="4" onfocusout="validateBirth()">
                  </span>
                  <span>
                     <select id="userbirth2" name = "userbirth2">
                        <option value="01">1월</option>
                        <option value="02">2월</option>
                        <option value="03">3월</option>
                        <option value="04">4월</option>
                        <option value="05">5월</option>
                        <option value="06">6월</option>
                        <option value="07">7월</option>
                        <option value="08">8월</option>
                        <option value="09">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                     </select>
                  </span>
                  <span>
                     <input type="text" name = "userbirth3" id="userbirth3" class="input-text birth" placeholder="일(2자)" maxlength="2" onfocusout="validateBirth()">
                  </span>
                  <div id="birth_alert" class="alert">태어난 년도 4자리를 정확하게 입력하세요.</div>
               </td>
            </tr>
         </table>
            <table>
            <tr>
               <td>
                  <span>
                     <input type="text" name = "address" id="address" class="input-text" placeholder="배송지('동' 까지만 입력해주세요)" maxlength="15" onfocusout="valiplace()">
                  </span>
                  <div id="pl_alert" class="alert">필수 정보입니다.</div>
               </td>
            </tr>
            <tr>
               <td>
                  <span>
                     <input type="text" name = "phone" id="phone" class="input-text" placeholder="전화번호" maxlength="11" onfocusout="valiphone()">
                  </span>
                  <div id="ph_alert" class="alert">필수 정보입니다.</div>
               </td>
            </tr>
            <tr>
            <td>
               <div class="button-area">
               <input type = "submit" value = "join"></input>
               </div>
            </td>
            </tr>
         </table>
         </form>
      </div>
                	<div style = "position:fixed;bottom:30px;right:50px;height:48px;width: 104px;" id="kakao-talk-channel-chat-button" data-channel-public-id="_IbZAxb" data-title="consult" data-size="small" data-color="mono" data-shape="pc" data-support-multiple-densities="true"></div>
      </div>
      <jsp:include page="page_footer.jsp" />
   </div>
</body>

<script type="text/javascript">
   
   function validateId() {
      var userId = document.getElementById('userId').value.trim();
      var alertEl = document.getElementById('id_alert');
      
      // 입력 여부 검증
      if (userId.length == 0) {
         alertEl.innerHTML = '필수 정보입니다.';
         alertEl.style.display = 'block';
         
         return false;
      }
      
      // 길이 검증
      if (userId.length < 5) {
         alertEl.innerHTML = '아이디는 5글자 이상 입력해주세요.';
         alertEl.style.display = 'block';
         
         return false;
      }
      
      // 대소문자, 숫자 입력 검증
      if (!/^[A-Za-z0-9]*$/.test(userId)) {
         alertEl.innerHTML = '아이디는 영문 대문자,소문자, 숫자만 입력 가능합니다.';
         alertEl.style.display = 'block';
         
         return false;
      }
      
      alertEl.style.display = 'none';
   }
   
   function validatePassword() {
      var password = document.getElementById('pwd').value.trim();
      var cPassword = document.getElementById('pwdChk').value.trim();
      var alertEl = document.getElementById('password_alert');
      var cAlertEl = document.getElementById('check_password_alert');
      
      // 비밀번호 입력 여부 검증
      if (password.length == 0) {
         alertEl.innerHTML = '필수 정보입니다.';
         alertEl.style.display = 'block';
         
         return false;
      }
      
      // 비밀번호 길이 검증
      if (password.length < 5) {
         alertEl.innerHTML = '비밀번호는 5글자 이상 입력해주세요.';
         alertEl.style.display = 'block';
         
         return false;
      }
      
      // 비밀번호 대소문자, 숫자 입력 검증
      if (!/^[A-Za-z0-9]*$/.test(password)) {
         alertEl.innerHTML = '비밀번호는 영문 대문자,소문자, 숫자만 입력 가능합니다.';
         alertEl.style.display = 'block';
         
         return false;
      }
      
      // 비밀번호 확인 입력 여부 검증
      if (cPassword.length == 0) {
         cAlertEl.innerHTML = '필수 정보입니다.';
         cAlertEl.style.display = 'block';
         
         return false;
      }
      
      // 비밀번호 확인 길이 검증
      if (cPassword.length < 5) {
         cAlertEl.innerHTML = '비밀번호는 5글자 이상 입력해주세요.';
         cAlertEl.style.display = 'block';
         
         return false;
      }
      
      // 비밀번호 확인 대소문자, 숫자 입력 검증
      if (!/^[A-Za-z0-9]*$/.test(cPassword)) {
         cAlertEl.innerHTML = '비밀번호는 영문 대문자,소문자, 숫자만 입력 가능합니다.';
         cAlertEl.style.display = 'block';
         
         return false;
      }
      
      // 비밀번호, 비밀번호 확인 검증
      if (password != cPassword) {
         cAlertEl.innerHTML = '비밀번호가 일치하지 않습니다.';
         cAlertEl.style.display = 'block';
         
         return false;
      }
      
      alertEl.style.display = 'none';
      cAlertEl.style.display = 'none';
   }
   
   function validateName() {
      var name = document.getElementById('userName').value.trim();
      var alertEl = document.getElementById('name_alert');
      
      // 입력 여부 검증
      if (name.length == 0) {
         alertEl.innerHTML = '필수 정보입니다.';
         alertEl.style.display = 'block';
         
         return false;
      }
      
      alertEl.style.display = 'none';
   }
   
   function validateBirth() {
      var birthYear = document.getElementById('userbirth1').value.trim();
      var birthDay = document.getElementById('userbirth3').value.trim();
      var alertEl = document.getElementById('birth_alert');
      
      if (birthYear.length == 0) {
         alertEl.innerHTML = '태어난 년도 4자리를 입력해주세요.';
         alertEl.style.display = 'block';
         
         return false;
      }
      
      if (birthDay.length == 0) {
         alertEl.innerHTML = '태어난 일자를 입력해주세요.';
         alertEl.style.display = 'block';
         
         return false;
      }
      
      if (!/^[0-9]*$/.test(birthYear)) {
         birth_alert.innerHTML = '태어난 년도는 숫자만 입력 가능합니다.';
         birth_alert.style.display = 'block';
         
         return false;
      }
      
      if (!/^[0-9]*$/.test(birthDay)) {
         birth_alert.innerHTML = '태어난 일자는 숫자만 입력 가능합니다.';
         birth_alert.style.display = 'block';
         
         return false;
      }
      
      alertEl.style.display = 'none';
   }
   //배송지
   function valiplace() {
      var pl = document.getElementById('address').value.trim();
      var alertEl = document.getElementById('pl_alert');
      
      // 입력 여부 검증
      if (pl.length == 0) {
         alertEl.innerHTML = '필수 정보입니다.';
         alertEl.style.display = 'block';
         
         return false;
      }
      
      alertEl.style.display = 'none';
   }
   //전화번호
   function valiphone() {
      var ph = document.getElementById('phone').value.trim();
      var alertEl = document.getElementById('ph_alert');
      
      // 입력 여부 검증
      if (ph.length == 0) {
         alertEl.innerHTML = '필수 정보입니다.';
         alertEl.style.display = 'block';
         
         return false;
      }
      //전화번호 길이 오류
      if (ph.length < 11) {
         alertEl.innerHTML = '전화번호를 다시 확인해주세요.';
         alertEl.style.display = 'block';
         
         return false;
      }
      
      // 숫자 입력 검증
      if (!/^[0-9]*$/.test(ph)) {
         alertEl.innerHTML = '숫자만 입력 가능합니다.';
         alertEl.style.display = 'block';
         
         return false;
      }
      
      alertEl.style.display = 'none';
   }
   /*function validJoin() {
      var password = document.getElementById('pwd').value.trim();
      var cPassword = document.getElementById('pwdChk').value.trim();
      var userId = document.getElementById('userId').value.trim();
      var pl = document.getElementById('address').value.trim();
      var ph = document.getElementById('phone').value.trim();
      var birthYear = document.getElementById('userbirth1').value.trim();
      var birthDay = document.getElementById('userbirth3').value.trim();
      
      if(password != 0 && cPassword != 0 && userId != 0 && pl != 0 && ph != 0 && birthYear != 0 && birthDay != 0){
          
      }
      else{
         alert("빈 칸을 모두 채워주세요.");
      }
   }
   */
</script>
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