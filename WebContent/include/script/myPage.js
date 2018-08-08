$(document).ready(function() {
	if(tab==1){
		$("#menu_1").css({
			"border":"1px solid #cccccc",
			"border-bottom":"none"
		});
		$("#menu_2").css({
			"border":"none",
			"border-bottom":"1px solid #cccccc"
		});
	}else if(tab==2){
		$("#menu_1").css({
			"border":"none",
			"border-bottom":"1px solid #cccccc"
		});
		$("#menu_2").css({
			"border":"1px solid #cccccc",
			"border-bottom":"none"
		});
	}
	
});
