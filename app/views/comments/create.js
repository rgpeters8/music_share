$('<%= escape_javascript(render(:partial => @comment))%>')
  .appendTo('#comments-<%= @comment.commentable_id %>')
  .hide()
  .fadeIn();

  $('#new-comment-<%= @comment.commentable_id %>').val('');