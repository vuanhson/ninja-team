$(document).ready(function () {
  // when the load more link is clicked
  $('a.load-more').click(function (e) {
    // prevent the default click action
    e.preventDefault();
    // hide load more link
    $('.load-more').hide();
    // show loading gif
    $('.loading-gif').show();
    var last_id = $('.post-list').last().attr('data-id');

    $.ajax({
        // make a get request to the server
        type: "GET",
        // get the url from the href attribute of our link
        url: $(this).attr('href'),
        // send the last id to our rails app
        data: {
            id: last_id
        },
        // the response will be a script
        dataType: "script",
        // upon success
        success: function () {
            // hide the loading gif
            $('.loading-gif').hide();
            // show our load more link
            $('.load-more').show();
        }
    });
  });

  $('.user-file').change(function() {
    readURL(this, '.user-avatar');
  });

  function readURL(input, class_img) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $(class_img).attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $(document).on('click', '.user-signup-submit', function() {
    $('#edit_user').submit();
  });
});
