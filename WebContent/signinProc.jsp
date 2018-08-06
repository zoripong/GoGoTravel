<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/signin.css">
<section id="sc_signin">
	<section id="sc_overlay"></section>
	<section id="sc_signin_box">
			<section id="sc_container">
			<p id="p_title">Welcome</p>
			<p id="p_sub_title">you can just join us.</p>
			<hr id="separation">
			<form id="form_signin" action="signinService.jsp" method="POST">
				<input class="input_text" type="text" name="id" placeholder="id" required/>
				<input class="input_text" type="password" name="password" placeholder="password" required/>
				<input id="input_submit" type="submit" value="로그인"/>
			</form>
			</section>
			<section id="sc_link">
				<a href="#">Forgot your password?</a>
				<a href="signup.jsp">Create an account</a>
			</section>
	</section>
</section>

