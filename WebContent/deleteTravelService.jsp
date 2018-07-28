<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
여행 삭제
<%
	String travel_id = request.getParameter("travel_id");
	
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());

	if(db.exec("DELETE FROM comment WHERE travel_id = "+travel_id+";")
			&& db.exec("DELETE FROM route_detail WHERE travel_id = "+travel_id+";")
			&& db.exec("DELETE FROM route WHERE travel_id = "+travel_id+";")
			&& db.exec("DELETE FROM wish_travel WHERE travel_id = "+travel_id+";")
			&& db.exec("DELETE FROM travel_tag WHERE travel_id ="+travel_id+";")
			&& db.exec("DELETE FROM travel WHERE travel_id = "+travel_id+";")
			){
		System.out.println("삭제 성공");%>
		<jsp:forward page="myPage.jsp?tab=1&isSuccess=true"/>
		<%
	
	}else{
		System.out.println("삭제 실패"); %>
		<jsp:forward page="myPage.jsp?tab=1&isSuccess=false"/>
		<%
	}


%>