<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
회원가입들 하시죠 하하


<!-- include user js file -->
<script src="include/script/signup.js"></script>
<form id="form_signup" action="signupService.jsp" enctype="multipart/form-data" method="POST">
	<input  type="text" name="id"  placeholder="ID" required />
	<input id="input_id_check" type="button" value="ID체크"/>
	<input id="input_pw" type="password" name="password" placeholder="Password" required/> 
	<input id="input_re_pw"  type="password" name="retype-pw" placeholder="Please Retype the Password" required/>
	<input type="text" name="location" placeholder="거주지역" >
	<input type="submit" value="회원가입"/>
</form>