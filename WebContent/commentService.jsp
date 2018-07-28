<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	
	String user_id = (String)session.getAttribute("id");
	String travel_id = request.getParameter("index");
	String content = request.getParameter("content");
	String time = String.valueOf(System.currentTimeMillis());  

	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	
	if(db.exec("INSERT INTO comment VALUES (null, '"+user_id+"', '"+travel_id+"', '"+content+"', '"+time+"');")){
		System.out.println("등록 성공");%>
		<jsp:forward page="travelDetail.jsp?index=<%= travel_id %>"/>
		<%
	}else{
		System.out.println("등록 실패"); %>
		<jsp:forward page="travelDetail.jsp?index=<%= travel_id %>"/>
	<%
	}
%>