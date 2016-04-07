/*
 * Form validation
 */

// Validate
$.fn.validate = function() {
  var error = false,
      focused = false;

  $(this).find('input, textarea').each(function(){
    var validate = $(this).data('validate');

    if (validate === undefined || validate === '') { return; }

    if(validate === 'presence' && this.value.length === 0){
      error = true;
      $(this).addClass('error');

      if (!focused) {
        $(this).focus();
        focused = true;
      }
    }

  });

  return !error;
};

// Listener to delete validation errors
$(document).on('input', 'input.error, textarea.error', function(){
  $(this).removeClass('error');
});
