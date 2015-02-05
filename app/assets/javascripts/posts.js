function play(youtubeID, postID) {
	var params = {allowScriptAccess: 'always', allowfullscreen: 'true'};
	var div = "video_" + postID;

   $.post("posts/increment_play_count", 
      { 
         post_id: postID 
      }, 
      function(data) {
         $("#play_count_" + postID).text(data);
      }
   );

   var url = "https://www.youtube.com/v/" + youtubeID + "?enablejsapi=1&playerapiid=ytplayer&version=3";
   
   // If user is on mobiel device, do not autoplay video
   if(!(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent))) {
      alert("Desktop!");
      url += "&autoplay=1";        
   }
	
	$("#video_" + postID + "_container").slideDown(function(e) {
		swfobject.embedSWF(url,
	    		div, "640", "390", "8", null, null, params, null);
	});	
}

function vote(postID) {
   var url;
   if($("#like_" + postID).hasClass("liked")) {
      url = "/posts/unlike";
   }
   else {
      url = "/posts/like";
   }

   if(url == "/posts/like") {
      $("#like_" + postID).removeClass("unliked");      
      $("#like_" + postID).addClass("liked");      
   }
   else {
      $("#like_" + postID).removeClass("liked");
      $("#like_" + postID).addClass("unliked");      
   }
   $.post(url, 
      { 
         post_id: postID 
      }, 
      function(data) {
         $("#like_count_" + postID).text(data);
      }
   );   
}

function viewAllComments(trigger) {
   trigger.hide();
   trigger.siblings('.comment-preview').hide();
   trigger.siblings('.all-comments').slideDown();
}