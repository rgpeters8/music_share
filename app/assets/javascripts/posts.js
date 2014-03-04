$(function () {
	$('.play_button').click(function() {
		var params = { allowScriptAccess: "always"};
		var video_id = this.id;
		var div = $(this).closest('li').find('.video_div').attr('id');
		
		$('#' + div).slideDown(function(e) {
			swfobject.embedSWF("http://www.youtube.com/v/" + video_id + "?enablejsapi=1&playerapiid=ytplayer&version=3&autoplay=1",
		    		div, "640", "390", "8", null, null, params, null, function(e) {
				$('#' + video_id).fadeOut();
			});
		});
	});
});