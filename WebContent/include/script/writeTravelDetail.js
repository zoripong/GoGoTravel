$(document).ready(function() {
	var num = [];
	for( var i = 0; i<$("#route_size").val(); i++){
		num[i] = 0;
	}
	
	
	$(".add_button").click(function(){
		var id = $(this).attr("id");
		
		$("#sc_detail_"+id).append("<input type='file' id='img_src_"+id+"_"+num[id]+"' name='img_src_"+id+"_"+num[id]+"' accept='image/*'><br><textarea name='content_"+id+"'></textarea>");
		num[id]+=1;
		alert(num[id]);
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
	
	$("#testBtn").click(function(){
		for(var i = 0; i<$("#route_size").val(); i++){
			for(var j = 0; j<num[i]; j++){
//				alert("<input type='hidden' name='img_src_hidden_"+i+"' value='"++"'>");
				
				//				$("#serviceForm").append("<input type='hidden' name='img_src_hidden_"+i+"' value='"+$("#img_src_"+i+"_"+j).val()+"'>");
			}
		}
	});
	
	
	
});