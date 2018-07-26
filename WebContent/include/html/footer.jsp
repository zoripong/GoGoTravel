<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
footer<br>
<%
	String id = (String)session.getAttribute("id");
	if(id!=null){
		out.println("<a href=\"signout.jsp\"> 로그아웃 </a>");
	}else{
		out.println("<a href=\"signin.jsp\">로그인</a>");
	}
	
%>