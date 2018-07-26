var isPwValid = false;
$(document).ready(function() {
	$("#form_signup").submit(function(){
		alert("hello");	
		
	});
	
	$("#input_re_pw").change(function() {
        if ($("#input_pw").val() == "") {
        	isPwValid = false;
            return;
        }

        if ($("#input_pw").val() != $("#input_re_pw").val()) {
        	isPwValid = false;
        	$("#input_re_pw").css("border-color", "#91000e");
            $("#input_re_pw").focus();
        } else {
        	isPwValid = true;
        	$("#input_re_pw").css("border-color", "#cccccc");
        }
    });

    $("#input_pw").change(function() {
    	if ($("#input_re_pw").val() == "") {
    		isPwValid = false;
    		return;
        }

        if ($("#input_pw").val() == $("#input_re_pw").val()) {
        	isPwValid = true;
            $("#input_re_pw").css("border-color", "#cccccc");
        } else {
        	isPwValid = false;
            $("#input_re_pw").css("border-color", "#91000e");
            $("#input_re_pw").focus();
        }
    });

});