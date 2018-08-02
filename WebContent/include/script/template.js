$(document).ready(function() {
	
	
	var windowHeight = screen.height;
	var html = document.documentElement;
	var docHeight = Math.max( html.clientHeight, html.scrollHeight, html.offsetHeight );
	var footerHeight = Math.max(document.getElementById("custom_footer").clientHeight, document.getElementById("custom_footer").scrollHeight, document.getElementById("custom_footer").offsetHeight);
	/*
	alert("window : "+ windowHeight);
	alert("document : "+ docHeight);
	alert("footer : "+ footerHeight);
	//alert("docHeight - footerHeight : "+ (parseInt(docHeight) - parseInt(footerHeight)));
	 * */
	
	if(parseInt(windowHeight) < parseInt(docHeight)+100){
		$("#custom_footer").css("position", "static");
	}else{
		$("#custom_footer").css("position", "absolute");	
	}
	
});
