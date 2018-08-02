<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/signin.css">
<section id="sc_signin">
	<form action="signinService.jsp" method="POST">
		<input type="text" name="id" placeholder="id" required/>
		<input type="password" name="password" placeholder="password" required/>
		<input type="submit" value="로그인"/>
	</form>
</section>