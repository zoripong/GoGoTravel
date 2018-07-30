<%@page import="java.io.File"%>
<%@page import="DB.DBExecutor"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String location = request.getParameter("location");
	

	
	out.println(id +"/"+password+"/"+location);
	
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	
	if(db.exec("INSERT INTO user VALUES ('"+id+"', '"+password+"', '"+location+"', 0);")){
		System.out.println("회원가입 성공");
	
	 	ServletContext scontext = getServletContext();
 		String realFolder = scontext.getRealPath("image/"+id);
		 File file = new File(realFolder);
		System.out.println(realFolder);
        if(!file.exists()){
            file.mkdirs();
            System.out.println("created directory successfully!");
        }%>

 	
	
		<jsp:forward page="signin.jsp"/>
		<%
	}else{
		System.out.println("회원가입 실패"); %>
		<jsp:forward page="signup.jsp"/>
		<%
	}
	
%>