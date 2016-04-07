/*
 * Articles listeners
 */

// Text area
$(document).on('keyup', '.article-editor .article-text', function (){
  // Count number of words
  var words = this.value.match(/\S+/g).length,
      count = this.value.length,
      time = Math.ceil(words / 310),
      last_element = this.value[count - 1];
  $('.word-count-value').text(words);
  $('.article-number').val(words);
  $('.read-time-value').text(time);

  if (this.selectionEnd === count) {
    window.scrollTo(0, document.body.scrollHeight);
  }
});

// Save
$(document).on('click', '.article-save', function(e){
  e.preventDefault();
  if ($('.articles-form').validate()){
    $('.articles-form').submit();
  }
});
