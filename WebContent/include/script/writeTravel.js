$(document).ready(function() {
	$("#add_route_button").click(function(){
		$("#sc_route_list").append("<input type=\"text\" name=\"route\" required>");
	});
});