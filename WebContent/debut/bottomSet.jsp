<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- 프레픽스 c를 쓰겠다고 선언함 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Debut</title>
<link href="layout.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image⁄x-icon" href="images/webicon.png">
<script src="index_js.js" type="text/javascript"></script>
<link href="bottomset_layout.css" rel="stylesheet" type="text/css" />
<link href="spry/SpryAccordion.css" rel="stylesheet" type="text/css" />
<script src="spry/SpryAccordion.js" type="text/javascript"></script>
</head>
<body>
<!--wrap영역-->
<div id="wrap">

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
  
  
    <!--page_center영역-->
  <div id="page_center" style = "margin-top:40px">
    <div class="brands">
      <div class="info"> 
        <div class="info1">
          <p><a href="#OC">◆Our Company</a></p>
        </div>
        <div class="info2">
          <p><a href="#FAQ">◆FAQ</a></p>
        </div>
        <div class="info3">
          <p><a href="#SG">◆Shop Guide</a></p>
        </div>
        <div class="info4">
          <p><a href="#PI">◆Privacy Policy</a></p>
        </div>
      </div>
      <div class="anchor"><a name="OC" class="info1" id="OC"></a></div>
      <p>&nbsp;</p>
      <p class = "black">■ Our Company</p>
      <div class="OC black">
        <div class="map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3172.0939300792015!2d126.73131891544779!3d37.34028487984089!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b71084954ce5f%3A0xb676df1bd97c059!2z7ZWc6rWt7IKw7JeF6riw7Iig64yA7ZWZ6rWQ!5e0!3m2!1sko!2skr!4v1574417598925!5m2!1sko!2skr" width="328" height="398" frameborder="0" style="border:0;" allowfullscreen=""></iframe></div>
        <div class="OCinfo"> <p>(주)Debut 은 중개서비스 제공 또는 통신판매중개시스템의 제공자로서 상품의 주문 및 배송 환불 등에 대해서는 각 판매자에게 확인하셔야 빠른 답변을 받으실 수 있습니다.</p>
          <p>(주)Debut│공동대표 김나은, 김영한, 이수빈</p>
            <p>사업자등록번호 : 1418-314316</p>
            <p>통신판매업신고 : 2019-경기시흥-00316</p>
            <p> 개인정보관리책임 : 김나은 김영한 이수빈</p>
            <p> e-mail : po02026@kpu.ac.kr </p>
            <p>주소 : 경기도 시흥시 산기대학로 237 </p>
            <p>고객센터 :  010-9594-6165 </p>
        </div>
      </div>
      <div class="anchor"><a name="FAQ" class="info2" id="FAQ2"></a>
      </div>
      <p>&nbsp;</p>
      <p class = "black">■ FAQ</p>
      <div class="OC">* 많은 고객님들께서 문의 주신 내용 입니다. *     
        <div id="Accordion1" class="Accordion" tabindex="0">
          <div class="AccordionPanel">
            <div class="AccordionPanelTab">교환 반품 안내</div>
            <div class="AccordionPanelContent">
              <p>* 직접 <strong>우체국택배(1588-1300)</strong>에 반품접수(<strong>착불</strong>)를 신청해주세요<br />음성안내에 따라 받아보신 운송장번호를 입력하시면, 간단하게 접수가능합니다<br /> 타택배 / 편의점택배 이용시 반드시 <strong>선불</strong>로 보내주셔야 합니다.
              </p>
              <p>받으신 그대로 탭 손상없이 재포장하여 7일 이내에 착불로 상품을 보내주셔야 검품 후 이상이 없을 시 처리완료됩니다.</p>
              <p>불량/오배송으로 인한 배송비는 전액 데뷔가 부담합니다.</p>불량/오배송의 경우 동일한 사이즈과 컬러로만 무상교환이지만 다른상품/컬러로 교환시에는 2500원이 부과됩니다.
              
            </div>
          </div>
          <div class="AccordionPanel">
            <div class="AccordionPanelTab">배송 전 주문 취소</div>
            <div class="AccordionPanelContent">
              <p><strong>2019년 11월 25일 기준 안내드립니다 :)</strong></p>
              <p><strong>배송 전 주문취소의 경우</strong></p>
              <p><strong>출고시간 2시 이전</strong>에 취소문의를 주셔야 출고가 되지않습니다.</p>
              <p>출고시간 2시 이후로 출고된 경우 취소요청시 반품처리로 처리되니 참고부탁드립니다.</p>
              <p>*핸드메이드,수제화,주문제작상품의 경우 결제완료 후 주문취소/교환/환불이 불가능합니다</p>
              <p>미리 고지되어있는 부분입니다. 꼭 참고하여 신중하게 구매해주시길바랍니다.</p>
            </div>
          </div>
          <div class="AccordionPanel">
            <div class="AccordionPanelTab">구매 전 기재사항</div>
            <div class="AccordionPanelContent">
              <p><strong>구매 전 기재사항 관련</strong></p>
              <p>구매 전 번호, 주소 미기재 혹은 잘못 기재 하셨을 경우 판매자인 데뷔에서 책임지지 않습니다.<br />
              저희는 기재된 번호와 주소로 택배발송을 도와드리고 있으며, 구매자께서 구매 시 꼼꼼히 확인해주셔야 하는 부분입니다.</p>
              <p>구매 전 꼭 참고하신 후 구매에 불편이 없으시길 바랍니다  :)</p>
            </div>
          </div>
        </div>
      </div>
      <div class="anchor"><a name="SG" class="info3" id="SG"></a></div>
      <p>&nbsp;</p>
      <p class = "black">■ Shop Guide</p>
      <div class="SG">
      
        <div class="square">회원가입 안내</div>
        <div class="sq_">[회원가입] 메뉴를 통해 이용약관, 개인정보보호정책 동의 및 일정 양식의 가입항목을 기입함으로써 회원에 가입되며, 가입 즉시 서비스를 무료로 이용하실 수 있습니다.<br />
        주문하실 때에 입력해야하는 각종 정보들을 일일이 입력하지 않으셔도 됩니다. 공동구매, 경매행사에 항상 참여하실 수 있습니다. 회원을 위한 이벤트 및 각종 할인행사에 참여하실 수 있습니다.
        </div>
        <div class="square">주문 안내</div>
        <div class="sq_">
          <p>상품주문은 다음단계로 이루어집니다.</p>
          <p>            상품검색 →  장바구니에 담기 → 주문 → 
            주문서 작성  →
          결제방법선택 및 결제 →  주문 성공 화면 (주문번호)</p>
        </div>
        <div class="square">배송 안내</div>
        <div class="sq_0">
          <p> · 배송 방법 : 택배 </p>
          <p> · 배송 지역 : 전국지역 </p>
          <p>· 배송 비용 : 조건부 무료 : 주문 금액 50,000 won 미만일 때 배송비 2,500 won을 추가합니다.</p>
          <p>· 배송 기간 : 3일 ~ 7일</p>
          <p>· 배송 안내 : 우체국택배를 이용하고 있으며, 50,000원 이상 무료배송이며 그외는 2500원이 부과됩니다. </p>
          <p>(제주도와 산간지역의 경우 추가배송비가 발생합니다. 배송은 기본 2-5일(주말제외) 소요됩니다. )</p>
        </div>
      </div>
      <div class="anchor"><a name="PI" class="info4" id="PI"></a></div>
      <p>&nbsp;</p>
      <p class = "black">■ 개인정보처리방침</p>
      <div class="OC black">
        <p><strong>(주)Debut(이하 &quot;데뷔&quot;라 함)이 취급하는 모든 개인정보는 관련법령에 근거하거나 정보주체의 동의에 의하여 수집·보유 및 처리되고 있습니다.</strong></p>
        <p>본 방침은 2019년 5월 8일부터 시행됩니다.</p>
        <p>데뷔는 법령의 규정에 따라 수집·보유 및 처리하는 개인정보를 공공업무의 적절한 수행과 정보주체의 권익을 보호하기 위하여 적법하고 적정하게 취급할 것입니다. 또한, 데뷔는 관련 법령에서 규정한 바에 따라 데뷔에서 보유하고 있는 개인정보에 대한 열람청구권 및 정정청구권 등 이용자의 권익을 존중하며, 여러분은 이러한 법령상 권익의 침해 등에 대하여 행정심판법에서 정하는바에 따라 행정심판을 청구할 수 있으며, 개인정보분쟁조정위원회, 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 데뷔의 개인정보 처리방침은 현행 「개인정보보호법」에 근거를 두고 있습니다. 개인정보를 처리하는 우리원 소관 홈페이지의 경우 해당 홈페이지에 별도의 개인정보처리방침을 정하여 운영하고 있습니다.</p>
      </div>
      <p>&nbsp;</p>
    </div>
    
    
    <div id="quick_menu"><img src="images/fixed.png" width="137" height="80" usemap="#Map" border="0" />
   	 <map name="Map" id="Map">
        <area shape="rect" coords="7,13,132,36" href="likeList.jsp" />
        <area shape="rect" coords="5,53,134,75" href="#logo" />
      </map>
     </div>
          	<div style = "position:fixed;bottom:30px;right:50px;height:48px;width: 104px;" id="kakao-talk-channel-chat-button" data-channel-public-id="_IbZAxb" data-title="consult" data-size="small" data-color="mono" data-shape="pc" data-support-multiple-densities="true"></div>
  </div>
    
    
    

     <!--page_footer영역-->
<div id="page_footer" style ="margin-top:1450px">
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
  </div>
  </div>
  
  
 
</div>

<script type="text/javascript">
var Accordion1 = new Spry.Widget.Accordion("Accordion1");
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
