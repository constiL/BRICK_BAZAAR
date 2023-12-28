$(document).ready(function () {
  $('.buy-request-form').submit(function (e) {
    e.preventDefault();

    // Submit the Buy Request form
    $.ajax({
      url: $(this).attr('action'),
      method: 'POST',
      data: $(this).serialize(),
      success: function () {
        // Buy Request form submitted successfully, now submit the Chatroom form
        $('.chatroom-form').submit();
      }
    });
  });
});
