<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="DB.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet" type="text/css" href="include/css/index.css">
 
<jsp:useBean id="connector" class="DB.DBConnector" scope="page" />
 <%
 System.out.println("야호1");
 	
 Connection conn = connector.getMySqlConnection();

 out.println("DB연결 정보1 : "+conn);
 conn = null;
	System.out.println("야호mm");
	try {
			
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://119.205.221.104:3306/GoGoTravel?characterEncoding=UTF-8&serverTimezone=UTC";
		String user = "ggt2";
		String password = "Aggt2018@)!*";
		System.out.println("야호2"+user+"/"+password);
		
		conn = DriverManager.getConnection(url, user, password);
		System.out.println(conn);
	}catch(ClassNotFoundException | SQLException e) {
		e.printStackTrace();
		System.out.println(e.toString());
	}	


 out.println("DB연결 정보2 : "+conn);
 	
 	
 %>