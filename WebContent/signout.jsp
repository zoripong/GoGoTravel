<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.removeAttribute("id");	
	session.removeAttribute("level");
%>
<jsp:forward page="main.jsp"/>