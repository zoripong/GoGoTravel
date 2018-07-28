$(document).ready(function() {
	$(".add_button").click(function(){
		var id = $(this).attr("id");
		
		$("#sc_detail_"+id).append("<input type='file' name='img_src' accept='image/*'><br><textarea name='content'></textarea>");
		
		
	});
});