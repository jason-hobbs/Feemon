// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

//$(function(){ $(document).foundation(); });
window.onload = function() {
        $(document).foundation();
};
$('.entry-nav').click(function()
{
  $('.entry-nav').removeClass('active');
  $(this).removeClass('new');
  $(this).addClass('active');
});

$(document).ready(
    function() {
      $("#middle").niceScroll({cursorcolor:"#505050", cursorwidth:"8", mousescrollstep:"20"});
      $("#right").niceScroll({cursorcolor:"#505050", cursorwidth:"8", mousescrollstep:"20"});
});

var container = document.querySelector('.news-container');
var msnry;

imagesLoaded( container, function() {
  msnry = new Masonry( container, {
   // options
   columnWidth: 300,
   itemSelector: '.news-story',
   gutter: 5
 } );
});

 
