$(document).ready(function() {
	
	
	var windowHeight = screen.height;
	var html = document.documentElement;
	var docHeight = Math.max( html.clientHeight, html.scrollHeight, html.offsetHeight );
	var footerHeight = document.getElementById("custom_footer").offsetHeight;
	/*
	alert("window : "+  screen.height);
	alert("document : "+ docHeight);
	alert("footer : "+ footerHeight);
	alert("docHeight - footerHeight : "+ (parseInt(docHeight) - parseInt(footerHeight)));
	*/
	
	if(parseInt(windowHeight) < parseInt(docHeight) - parseInt(footerHeight)){
		$("#custom_footer").css("position", "static");
	}else{
		$("#custom_footer").css("position", "absolute");	
	}
	
});
