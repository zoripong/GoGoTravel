<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<a href="main.jsp"><img src="include/image/ic_logo.svg"/></a>
<%
	String id = (String)session.getAttribute("id");
	Integer level = (Integer)session.getAttribute("level");
	
	out.println(id+"님 아직 "+level+"여행객 이시네요!");
	
%>
<a href="myPage.jsp?tab=1">나의 여행</a>
<a href="myPage.jsp?tab=2">가자 여행</a>