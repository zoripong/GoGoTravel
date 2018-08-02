<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/signup.css">
<script src="include/script/signup.js"></script>
<section id="sc_signup">
	<section id="sc_overlay"></section>
	<section id="sc_signup_box">
		<form id="form_signup" action="signupService.jsp" method="POST">
			<input  type="text" name="id"  placeholder="ID" required />
			<input id="input_id_check" type="button" value="ID체크"/>
			<input id="input_pw" type="password" name="password" placeholder="Password" required/> 
			<input id="input_re_pw"  type="password" name="retype-pw" placeholder="Please Retype the Password" required/>
			<input type="text" name="location" placeholder="거주지역" >
			<input type="submit" value="회원가입"/>
		</form>
	</section>
</section>