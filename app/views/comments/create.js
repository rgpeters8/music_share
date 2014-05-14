$('<%= escape_javascript(render(:partial => @comment))%>')
  .appendTo('#comments_<%= @comment.commentable_id %>')
  .hide()
  .fadeIn();