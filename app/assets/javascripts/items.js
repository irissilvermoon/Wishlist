// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/




$(document).ready(function() {
  $('.options-checkbox').on('click', function(event) {
    var $el = $(event.target);
    var url = $el.data('url');

    console.log(url);
    // $.post('ajax/test.html', function(data) {
    //   $('.result').html(data);
    // });
    $.post(url, function(data) {
      console.log('success');
    });

    $el.replaceWith('<span>Yes</span>');
  });
});