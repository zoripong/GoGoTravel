var route_num = 1;
var delete_num = 0;
$(document).ready(function() {
	$("#add_route_button").click(function(){
		route_num++;
		$("#sc_route_list").append("<section id=\"item_"+route_num+"\" class=\"sc_route_item\"><p id=\"p_"+route_num+"\">#"+route_num+"</p><input class=\"input_route\" type=\"text\" name=\"route\" placeholder=\"여행지를 적어주세요.\" required><i id=\"delete_"+route_num+"\" class=\"ic_delete fas fa-minus\"></i></section>");
		$("#delete_"+route_num).click(function(){
			//TODO : Debugging
			var id = $(this).attr("id").substring(7,$(this).attr("id").length);
			$("#item_"+id).remove();
			
			for(var i = parseInt(id)+1; i<=route_num; i++){
				$("#p_"+i).text("#"+(i-1));
			}
			route_num--;
			alert(route_num);
			
		});
	
	});
	
	
	
	$("#content_form").submit(function(){
		var path = $("#main_image").val();
		var fileName = path.substr(path.lastIndexOf("\\")+1, path.length);
		$("#content_form").append("<input type='hidden' name='hidden_main_img' value='"+fileName+"'>");
	});
	$("#main_image_clicker").click(function(){
		$("#main_image").trigger("click");
	});
	
	$("#preview").click(function(){
		$("#main_image").trigger("click");	
	});
	
	$("input[type=file]").on("click", function(e) {
        e.stopPropagation();
    });
    $("#main_image").on("change", function(e) {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
            	$("#preview").css("visibility", "visible");
            	$("#main_image_clicker").css("display", "none");
            	
                $("#preview").attr("src", e.target.result);
                $("#preview").css({
                    "width": "100%",
                    "height": "auto",
                });
            };
            reader.readAsDataURL(this.files[0]);
        }
    });
});