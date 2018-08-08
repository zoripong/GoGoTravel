$(document).ready(function() {
	var num = [];
	for( var i = 0; i<$("#route_size").val(); i++){
		num[i] = 0;
	}
	
	$("input[type=file]").on("click", function(e) {
        e.stopPropagation();
    });

	$(".add_button").click(function(){
		var id = $(this).attr("id");
		$("#sc_detail_"+id).append("<div class=\"image_clicker\"><i id=\""+id+"_"+num[id]+"\" class=\"far fa-image fa-10x\"></i><img class=\"preview\" id=\"preview_"+id+"_"+num[id]+"\"></div><input type='file' id='img_src_"+id+"_"+num[id]+"' class='input_image_file' name='img_src_"+id+"_"+num[id]+"' accept='image/*'><br><textarea class=\"ta_text_detail\" name='content_"+id+"' placeholder=\"당신의 후기를 남겨주세요.\"></textarea>");
		num[id]+=1;
		alert(num[id]);
		$("#sc_detail_"+id).find(".guide_message").css("display", "none");
		
		$("#custom_footer").css("position", "static");


		$(".image_clicker").click(function(){
			var id = $(this).find("i").attr("id");
			//alert(id);
			$("#img_src_"+id).trigger("click");
					
		});

	    $(".input_image_file").on("change", function(e) {
	    	var id = $(this).attr("id").substring(8, $(this).attr("id").length);
//			alert(id);

			if (this.files && this.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	            	$("#preview_"+id).css("visibility", "visible");
	            	$("#"+id).css("display", "none");
	            	
	                $("#preview_"+id).attr("src", e.target.result);
	                $("#preview_"+id).css({
	                    "width": "100%",
	                    "height": "auto",
	                });
	            };
	            reader.readAsDataURL(this.files[0]);
	        }
	
	    });
	    
	});
	

	
	$("#serviceForm").submit(function(){
		//alert($("#route_size").val());
		for(var i = 0; i<$("#route_size").val(); i++){
			for(var j = 0; j<num[i]; j++){
				alert("<input type='hidden' name='img_src_hidden_"+i+"' value='"+$("#img_src_"+i+"_"+j).val()+"'>");
				var path = $("#img_src_"+i+"_"+j).val();
				alert(path);
				var fileName = path.substr(path.lastIndexOf("\\")+1, path.length);
				alert(fileName);
				$("#serviceForm").append("<input type='hidden' name='img_src_hidden_"+i+"' value='"+fileName+"'>");
			}
		}
		return true;
	});
	
});