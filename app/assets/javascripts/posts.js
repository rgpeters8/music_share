function play(youtubeID, postID) {
	var params = { allowScriptAccess: "always"};
	var div = "video_" + postID;

   $.post("posts/increment_play_count", 
      { 
         post_id: postID 
      }, 
      function(data) {
         $("#play_count_" + postID).text(data);
      }
   );
	
	$("#video_" + postID + "_container").slideDown(function(e) {
		swfobject.embedSWF("https://www.youtube.com/v/" + youtubeID + "?enablejsapi=1&playerapiid=ytplayer&version=3&autoplay=1",
	    		div, "640", "390", "8", null, null, params, null, function(e) {
			$('#' + youtubeID).fadeOut();
		});
	});	
}

function vote(postID) {
   var url;
   if($("#like_" + postID).hasClass("liked")) {
      url = "posts/unlike"
   }
   else {
      url = "posts/like"
   }
   $.post(url, 
      { 
         post_id: postID 
      }, 
      function(data) {
         if(url == "posts/like") {
            $("#like_" + postID).addClass("liked");      
         }
         else {
            $("#like_" + postID).removeClass("liked");   
         }
         $("#like_count_" + postID).text(data);
      }
   );   
}
