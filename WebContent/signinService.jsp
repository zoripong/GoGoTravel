<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	
	ResultSet rs = db.execToSet("SELECT COUNT(*) FROM user WHERE user_id = '"+id+"' and password = '"+password+"' ;");
	 int rowCnt = 0;
     
	if(rs.next()) rowCnt = rs.getInt(1);
	
	if(rowCnt == 1){
		System.out.println("로그인 성공");
		session.setAttribute("id", id);
		%>
		<jsp:forward page="main.jsp"/>
		<%
	}else{
		System.out.println("로그인 실패");%>
		<jsp:forward page="signin.jsp"/>
		<%
	}
	
	System.out.println("size : "+rowCnt);
	
	
%>