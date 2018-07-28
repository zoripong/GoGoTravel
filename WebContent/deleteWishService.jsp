<%@page import="DB.DBExecutor"%>
<%@page import="DB.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
위시 삭제
<%

	String travel_id = request.getParameter("travel_id");
	String user_id = request.getParameter("user_id");
	
	out.println(travel_id +"/"+ user_id);

	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	
	if(db.exec("DELETE FROM wish_travel WHERE user_id = '"+user_id+"' AND travel_id = "+travel_id+";")){
		System.out.println("삭제 성공");%>
		<jsp:forward page="myPage.jsp?tab=2&isSuccess=true"/>
		<%
	}else{
		System.out.println("삭제 실패"); %>
		<jsp:forward page="myPage.jsp?tab=2&isSuccess=false"/>
		<%
	}

%>