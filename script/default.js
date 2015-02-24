(function() {
  $(function() {
    if ($(".js-typed").length) {
      return $(".js-typed").typed({
        strings: ["hudie feibuguo", "蝴蝶飞不过沧海，谁忍心责怪？"],
        typeSpeed: 100,
        callback: function() {
          return $(".typed-cursor").fadeOut(function() {
            return $(this).remove();
          });
        }
      });
    }
  });

}).call(this);
