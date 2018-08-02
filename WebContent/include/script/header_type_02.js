$(document).ready(function() {
	var eleWidth = parseInt(document.getElementById("sp_user").offsetWidth)+40;
	
	$("#img_home").css({
		"position":"absolute",
		"top":"50%",
		"right":eleWidth+"px"
	});
	
	$("#ic_search_bar").focusin(function(){
		$("#sc_search_container").css({
			"width":"70%",
			"border":"0.5px solid #cccccc"
		});
	});
	$("#ic_search_bar").focusout(function(){
		$("#sc_search_container").css({
			"width":"20%",
			"border":"0.5px solid #ffffff"
		});
	});
});