$( document ).ready(function() {
  $('#hamburger').click(function() {
    $('#mobile-navigation').slideToggle(300);
  });
  $('#mobile-navigation a').click(function() {
    $('#mobile-navigation').slideToggle(100);
  });
});
