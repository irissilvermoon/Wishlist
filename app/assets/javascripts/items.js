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

  $("#item_link").on('change', function (event) {
    var $input = $(event.target);
    var imagePath = $input.data('new-image-url') + "?url=" + $input.val();

    console.log("You changed the url to", $input.val());
    console.log("Submitting to", imagePath);

    // Get rid of any existing modals
    $input.qtip('destroy');

    $input.qtip({
      //id: 'image-picker',
      content: {
        text: "Loading...",
        ajax: {
          url: imagePath
        },
      },
      style: {
        classes: 'qtip-bootstrap'
      },
      position: {
        my: "left center",
        at: "right"
      },
      show: {
        event: false,
        modal: false
      },
      hide: {
        event: false
      }
    }).qtip('show');
  });

  $('body').on('click', '.qtip-modal a', function (event) {
    var $link = $(event.target);
    var imageUrl = $link.attr('href');

    event.preventDefault();
    event.stopPropagation();

    console.log("You chose", imageUrl);

    $('#item_image').val(imageUrl);
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

