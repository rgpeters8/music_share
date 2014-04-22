function play(youtubeID, feedItemID) {
	var params = { allowScriptAccess: "always"};
	var div = "video_" + feedItemID;
	
	$("#video_" + feedItemID + "_container").slideDown(function(e) {
		swfobject.embedSWF("https://www.youtube.com/v/" + youtubeID + "?enablejsapi=1&playerapiid=ytplayer&version=3&autoplay=1",
	    		div, "640", "390", "8", null, null, params, null, function(e) {
			$('#' + youtubeID).fadeOut();
		});
	});	
}