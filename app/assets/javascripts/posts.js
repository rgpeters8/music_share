$(function () {
	$('.play_button').click(function() {
		var params = { allowScriptAccess: "always"};
		var id = "video_" + this.id;
	    var atts = { id: id };
	    swfobject.embedSWF("http://www.youtube.com/v/" + this.id + "?enablejsapi=1&playerapiid=ytplayer&version=3&autoplay=1",
	    		"ytapiplayer", "625", "356", "8", null, null, params, atts);
	});
});