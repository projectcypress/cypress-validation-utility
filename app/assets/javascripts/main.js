function scrollToElement(element){
  var offsetFromTop = 200;
  if ($(element).length) {
    try {
       $(element).animate({ scrollTop: $(element).scrollTop() - $(element).offset().top }, { duration: 'slow', easing: 'swing'});
       $('html,body').animate({ scrollTop: $(element).offset().top - offsetFromTop }, { duration: 1000, easing: 'swing'});
       window.location.hash = element;
     } catch(e) {}
  }
}

// Faster version of scrollToElement,
function jumpToElement(element){
  var jumpThreshold = 5000;
  var offsetFromTop = 200;

  if ($(element).length) {
    try {
      var ot = $(element).offset().top;
      var st = $('body').scrollTop();
      if (Math.abs(ot - st) > jumpThreshold) {
        $('html,body').scrollTop(ot > st ? ot - 400 : ot + 200);
      }
      $(element).animate({ scrollTop: $(element).scrollTop() - $(element).offset().top }, { duration: 'slow', easing: 'swing'});
      if (Math.abs(ot - st) > offsetFromTop) {
        $('html,body').animate({ scrollTop: $(element).offset().top - offsetFromTop }, { duration: 1000, easing: 'swing'});
      } else {
        return;
      }
     window.location.hash = element;
     } catch(e) {}
  }
}
