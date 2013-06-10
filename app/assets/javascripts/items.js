// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/




$(document).ready(function() {
  $('.options-checkbox').on('click', function(event) {
    var checkbox = $(event.target);
    var url = checkbox.data('url');

    console.log(url, checkbox.is(':checked'));
    // $.post('ajax/test.html', function(data) {
    //   $('.result').html(data);
    // });
    if (checkbox.is(':checked')) {
      $.post(url, function(data) {
          console.log('success');
        });
    }
    else {
      $.ajax({
        url: url,
        type: 'DELETE',
        complete: function(){
          console.log('deleted');
        }
      });
    }
  });
});

// $('body').qtip({
//   content: {
//     text: "Loading...",
//     ajax: {
//       url: 'http://localhost:3000/wish_lists/14/items/22/image/new'
//     },
//   },
//   style: {
//     classes: 'qtip-bootstrap'
//   },
//   position: {
//     at: "center",
//     my: "center"
//   },
//   show: {
//     modal: true
//   },
//   hide: {
//     event: false
//   }
// }).qtip('show');

//search for javascript conditional syntax

