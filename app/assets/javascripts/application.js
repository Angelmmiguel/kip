// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require autosize.min
//= require highlight.pack
//= require_tree .

// Highligh Code
ready = function(){
  hljs.initHighlighting.called = false;
  hljs.initHighlighting();
}

// Ready callbacks
$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('page:restore', ready);

// Search functionality for index view
$(document).on('input', '.main-search', function(e) {
  var value = this.value,
      $articleList = $('.article-list'),
      $articleSearch = $('.article-search');

  if (value.length < 3) {
    $articleSearch.hide();
    $articleList.fadeIn(150);
  } else {
    $articleList.fadeOut(150);

    $.ajax({
      url: '/articles/search',
      method: 'GET',
      data: {
        q: value
      }
    }).done(function(data) {
      var html = '';
      if (data.results.length === 0){
        html = '<div class="article-search-empty">' +
                 '<p>No match for the word <b>' + value + '</b></p>' +
                 '<a class="btn btn-light" href="/articles/new?title=' + encodeURIComponent(value) + '">' +
                 'Start an article about <b>' + value + '</b> <i class="material-icons small">mode_edit</i></a>' +
               '</div>';
      } else {
        $.each(data.results, function(index, result){
          html += '<div class="article-result">' +
                    '<h1><a href="/articles/' + result._id.$oid + '">' + result.title + '</a></h1>' +
                    '<p><span class="time"><i class="material-icons small">timer</i> ' + result.read_time + ' min,</span>' +
                    ' <span>' + result.author + '</span> in <span>' + result.category + '</span></p>' +
                  '</div>';
        });
        // Add a call to action in the bottom
        var txt;
        if (data.results.length > 12) {
          txt = 'Is not enough for you? Share your knowledge';
        } else {
          txt = 'Do you know more about <b>' + value + '</b>? Share it';
        }

        html += '<div class="article-search-empty article-search-more">' +
                  '<p>'+ txt +'</p>' +
                  '<a class="btn btn-light" href="/articles/new?title=' + encodeURIComponent(value) + '">' +
                  'Start an article about <b>' + value + '</b> <i class="material-icons small">mode_edit</i></a>' +
                '</div>';
      }
      $articleSearch.html(html);
      $articleSearch.show();
    }).fail(function() {
      console.warn("Error when search for: " + value);
    })
  }
});
