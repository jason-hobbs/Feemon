$('.entry-nav').click(function()
{
  $('.entry-nav').removeClass('active');
  $(this).removeClass('new');
  $(this).addClass('active');
});

jQuery.extend($.gritter.options,{time:1000,});

$(document).ready(
    function() {
      $("#middle").niceScroll({cursorcolor:"#505050", cursorwidth:"8", mousescrollstep:"20"});
      $("#right").niceScroll({cursorcolor:"#505050", cursorwidth:"8", mousescrollstep:"20"});
      $.extend($.gritter.options, {
            fade_in_speed: 100, // how fast notifications fade in (string or int)
            fade_out_speed: 100, // how fast the notices fade out
            time: 1500 // hang on the screen for...
          });

});

$(document).ready(
    function() {
var container = document.querySelector('.news-container');
var pckry;
imagesLoaded( container, function() {
  pckry = new Packery( container, {
    // options
    columnWidth: 300,
    itemSelector: '.news-story',
    gutter: 5
  } );
});
});
