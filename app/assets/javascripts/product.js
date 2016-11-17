$(function() {
  $('.product-rating').raty({
    readOnly: true,
    score: function(){
      return $(this).attr('data-score');
    },
    path: '/assets'
  });
});

$(document).ready(function() {
  $('#comment').on('click',function(e) {
    productId = $('#product-id').val();
    content = $('#content').val();
    console.log(productId + ' ' + content);
    $.ajax({
      type: "POST",
      url: "/comments",
      dataType: "json",
       data: {
          comment: {
            content: content,
            product_id: productId
          }
        },
      success: function(data) {
        console.log(data);
        var token = $('meta[name=csrf-token]').attr('content')
        display = "<div class='media response-info  first-comment-style'>" +
          "<div id='comment-"+data.comment.id+"'>"+
          "<div class='media-left response-text-left' style='float: left;'>" +
          "<img src='"  + data.avatar +
          "' class= 'img-responsive img-circle'/>" +
          "</div><div class='media-body response-text-right comment-style'> " +
          "<h4>"+data.user.name+"</h4>"+
          "<p>"+data.comment.content+"</p>"+
          "<p class='time_word'>"+
          "<i class='fa fa-clock-o'> Created 1 minutes ago</i>"+
          "</p>"+
          "</div><a id='edit-comment-"+ data.comment.id+"' class='edit-comment' href='javascript:;'>"+
          "<span>Edit</span></a>" +
          "<a href='/comments/"+data.comment.id+"' data-remote='true' data-method='delete' data-confirm='You sure?'>"+
          "<span> Delete</span></a></div>"+
          "<div class='edit-form' style='display: none;'>"+
          "<form id='edit_comment_"+data.comment.id+"' class='edit_comment'"+
          "method='post' action='/comments/"+data.comment.id+"'>"+
          "<input type='hidden' value='✓' name='utf8'>"+
          "<input type='hidden' value='patch' name='_method'>"+
          "<input type='hidden' value='"+token+"' name='authenticity_token'>"+
          "<label for='comment_content'>Content</label>"+
          "<textarea id='comment_content' class='form-control' name='comment[content]'>"+data.comment.content+"</textarea>"+
          "<input type='submit' data-disable-with='Update Comment' value='Update Comment' name='commit'>"+
          "</form></div>"
        $('#comments-container').append(display);
        $('#content').val('');
      },
      error: function(error_message) {
          alert('Error');
        }
    });
  });
});
