<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/footer.css">

<footer id="custom_footer">
<p>	&copy; 2018 Devuri404. All Rights Reserved. </p>
<p>	Connect to Developer <a id="link_mail" href="mailto:devuri404@gmail.com" target="_top">devuri404@gmail.com</a> </p>
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
