document.addEventListener('turbolinks:load', function() {
  $('.post-file').change(function() {
    readURL(this, '.post-image');
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
});
