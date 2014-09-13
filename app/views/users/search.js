$('#search-results')
   .html("<%= escape_javascript(render(:partial => 'search_results', :search_results => @search_results))%>")
   .hide()
   .slideDown();
