$(function () {
	$('.play_button').click(function() {
		var params = { allowScriptAccess: "always"};
		var div = $(this).closest('li').find('.video_div').attr('id');
	    swfobject.embedSWF("http://www.youtube.com/v/" + this.id + "?enablejsapi=1&playerapiid=ytplayer&version=3&autoplay=1",
	    		div, "640", "390", "8", null, null, params);
	});
});