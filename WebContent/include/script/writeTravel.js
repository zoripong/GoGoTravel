$(document).ready(function() {
	$("#add_route_button").click(function(){
		$("#sc_route_list").append("<input type=\"text\" name=\"route\" required>");
	});

	$("#content_form").submit(function(){
		var path = $("#main_image").val();
		var fileName = path.substr(path.lastIndexOf("\\")+1, path.length);
		$("#content_form").append("<input type='hidden' name='hidden_main_img' value='"+fileName+"'>");
	});
});