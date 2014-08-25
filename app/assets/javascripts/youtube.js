function playResult(youtubeID) {
   var params = { allowScriptAccess: "always"};
   var div = "video_" + youtubeID;
   $("#video_" + youtubeID + "_container").slideDown(function(e) {
      swfobject.embedSWF("https://www.youtube.com/v/" + youtubeID + "?enablejsapi=1&playerapiid=ytplayer&version=3&autoplay=1",
            div, "640", "390", "8", null, null, params, null, function(e) {
         $('#play_' + youtubeID).fadeOut();
         $('#img_' + youtubeID).fadeOut();
      });
   });   
}