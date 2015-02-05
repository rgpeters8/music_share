// 2. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

function play(youtubeID, postID) {
	/*var params = {allowScriptAccess: 'always', allowfullscreen: 'true'};
	var div = "video_" + postID;

   $.post("/posts/increment_play_count", 
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
      url += "&autoplay=1";        
   }
	
	$("#video_" + postID + "_container").slideDown(function(e) {
		swfobject.embedSWF(url,
	    		div, "640", "390", "8", null, null, params, null);
	});*/


   var divID = "video_" + postID;
   $('#' + divID).slideDown();

   // 3. This function creates an <iframe> (and YouTube player)
   var player = new YT.Player(divID, {
                        height: '390',
                        width: '640',
                        videoId: youtubeID,
                        events: {
                           'onReady': onPlayerReady
                        }
                    });

}

// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
   event.target.playVideo();   
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