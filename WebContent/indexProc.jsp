
<%@page import="java.sql.Timestamp"%>
<%@page import="DB.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet" type="text/css" href="include/css/index.css">
 
 여행은 그런거죠 하하
 <a href="main.jsp">체험하기</a> <br>
 <a href="signup.jsp">함께하기</a> <br>
 <a href="signin.jsp">로그인</a> <br>
<jsp:useBean id="connector" class="DB.DBConnector" scope="page" />
 <%
	 
	 Connection conn = DBConnector.getMySqlConnection();
	 //System.out.println("DB연결 정보!!!!!!!!!? : "+conn);
 
	 Timestamp ts=new Timestamp(System.currentTimeMillis());
	 //System.out.println("TimeStamp:"+ ts);
	 //System.out.println("currentTimeMillis:"+ System.currentTimeMillis());
	 
 %>