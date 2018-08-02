<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/footer.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<footer id="custom_footer">

<p>	&copy; 2018 Devuri404. All Rights Reserved. </p>
<p>	Connect to Developer <a id="link_mail" href="mailto:devuri404@gmail.com" target="_top">devuri404@gmail.com</a> </p>

<section id="sc_contact">
	<a href="https://www.facebook.com/rachel.han.581">
	<i class="fab fa-facebook-square fa-2x"></i>
	</a>
	<a href="https://github.com/zoripong">
	<i class="fab fa-github fa-2x"></i>
	</a>
	<a href="https://www.instagram.com/y.oo.l/?hl=ko">
	<i class="fab fa-instagram fa-2x"></i>
	</a>
</section>
<p> 
<a href="#">이용약관</a>
<a href="#">개인정보처리방침</a>
<%

	String id = (String)session.getAttribute("id");
	if(id!=null){
		out.println("<a href=\"signout.jsp\">로그아웃 </a>");
	}else{
		out.println("<a href=\"signin.jsp\">로그인</a>");
	}
	
%>
</p>
</footer>    
