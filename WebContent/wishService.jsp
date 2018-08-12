<%@page import="java.sql.ResultSet"%>
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
		System.out.println("등록 성공");
		
		// wish_count 증가
		ResultSet rs = db.execToSet("SELECT * FROM travel WHERE travel_id="+index+";");
		int wishCount = 0;
		if(rs.next()){
			wishCount = rs.getInt("wish_count");
		}
		
		db.exec("UPDATE travel SET wish_count="+(wishCount+1)+" WHERE travel_id = "+index+";");
		
		
		
		%>
		<jsp:forward page="myPage.jsp?tab=2"/>
		<%
	}else{
		System.out.println("등록 실패"); %>
		<jsp:forward page="travelDetail.jsp?index=<%= index %>&isSuccess=false"/>
	<%
	}
%>