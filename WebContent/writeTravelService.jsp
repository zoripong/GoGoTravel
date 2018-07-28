<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
		<input type="hidden" name="user_id" value="<%=session.getAttribute("id")%>">
 		<input type="hidden" name="board_time" value="<%= System.currentTimeMillis()%>">
 
	 	<input type="text" name="title" required><br>
 	
	 	<input type="file" name="main_image" accept="image/*" ><br>
	 	<input type="date" name="start_date" required>-
	 	<input type="date" name="end_date" required><br>
	 	<input type="number" name="budget" required><br>
	
	 	<input type="text" name="tag">
	
	 	<input type="text" name="route">
	
 

<%
	request.setCharacterEncoding("UTF-8");
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	
	String user_id = request.getParameter("user_id");
	String title = request.getParameter("title");
	String board_time = request.getParameter("board_time");
	String start_date = request.getParameter("start_date");
	String end_date = request.getParameter("end_date");
	String budget = request.getParameter("budget");
	String main_image = request.getParameter("main_image");
	
//	INSERT INTO travel VALUES (null, 'test001', '떠나요, 제주도', '1532616268488', '2018-07-24', '2018-07-26', 500000, '/test001/0001.jpg' );
	
	int travel_id = -1;
	if(db.exec("INSERT INTO travel VALUES(null, '"+user_id+"', '"+title+"', '"+board_time+"', '"+start_date+"', '"+end_date+"', "+budget+", '"+main_image+"' );")){
		System.out.println("등록 성공");
		
		ResultSet rs = db.execToSet("SELECT * FROM travel WHERE user_id = '"+user_id+"' AND board_time = '"+board_time+"';");
		if(rs.next()){
			travel_id = rs.getInt("travel_id");
		}
		
		if(travel_id == -1){
			%>
			<jsp:forward page="writeTravel.jsp?isFailed=true"/>
			<%
		}else{
			String rTags = request.getParameter("tags");
			String tags[] = rTags.replace(" ", "").split("#");
			
			for(String tag : tags){
				if(!db.exec("INSERT INTO travel_tag VALUES ("+travel_id+", '"+tag+"');")){
					%>
					<jsp:forward page="writeTravel.jsp?isFailed=true"/>
					<%
				}
			}
			
			String routes[] = request.getParameterValues("route");
			for(int i = 0; i<routes.length; i++){
				if(!db.exec("INSERT INTO route VALUES (null, "+travel_id+", "+(i+1)+", '"+routes[i]+"');")){
					%>
					<jsp:forward page="writeTravel.jsp?isFailed=true"/>
					<%
				}
			}
			response.sendRedirect("writeTravelDetail.jsp?travel_id="+travel_id);
			
		}
		
	}else{
		System.out.println("등록 실패"); %>
		<jsp:forward page="writeTravel.jsp?isFailed=true"/>
		<%
	}

%>