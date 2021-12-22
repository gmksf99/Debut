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