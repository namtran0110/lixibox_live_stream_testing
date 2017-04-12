//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tether
//= require bootstrap-sprockets
//= require jquery.flipster.min
//= require jquery.raty
//= require ratyrate
//= require_tree .


$(document).on('turbolinks:load', function(){
  $('.panel-toggle button').on('click', function(){
    $(this).closest($('.panel')).toggleClass('open closed');
    $('button i').toggleClass('icon-collapse icon-expand');
  });
});
