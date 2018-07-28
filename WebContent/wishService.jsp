<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String index = request.getParameter("index");
	String save_money = request.getParameter("save_money");
	String user_id = (String)session.getAttribute("id");
	
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	
	if(db.exec("INSERT INTO wish_travel VALUES ('"+user_id+"', "+index+", "+save_money+");")){
		System.out.println("등록 성공");%>
		<jsp:forward page="myPage.jsp?tab=2"/>
		<%
	}else{
		System.out.println("등록 실패"); %>
		<jsp:forward page="travelDetail.jsp?index=<%= index %>&isSuccess=false"/>
	<%
	}
%>