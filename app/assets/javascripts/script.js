$(document).ready(function() {

  var doNotEmail = $('#user_do_not_email');
  var email = $('.email');

  doNotEmail.change(function(){
    if (this.checked) {
        email.attr('checked', false);
    }
  });

  email.change(function(){
    if (this.checked) {
        doNotEmail.attr('checked', false);
    }
  });
});
