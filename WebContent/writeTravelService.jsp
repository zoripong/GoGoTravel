<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	request.setCharacterEncoding("UTF-8");
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	
	MultipartRequest multi = null;
	String realFolder = "";
	String filename1 = "";
	int maxSize = 1024*1024*5;
 	String encType = "UTF-8";
 	ServletContext scontext = getServletContext();
 	realFolder = scontext.getRealPath("image/"+String.valueOf(session.getAttribute("id")));
 	
 	try{
 		multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
 		Enumeration<?> files = multi.getFileNames();
    	String file1 = (String)files.nextElement();
		filename1 = multi.getFilesystemName(file1);
	} catch(Exception e) {
		e.printStackTrace();
	}

 	
 	
 	
	String user_id = multi.getParameter("user_id");
	String title = multi.getParameter("title");
	String board_time = multi.getParameter("board_time");
	String start_date = multi.getParameter("start_date");
	String end_date = multi.getParameter("end_date");
	String budget = multi.getParameter("budget");
	String main_image = multi.getParameter("hidden_main_img");
	
	int travel_id = -1;
	if(db.exec("INSERT INTO travel VALUES(null, '"+user_id+"', '"+title+"', '"+board_time+"', '"+start_date+"', '"+end_date+"', "+budget+", '"+main_image+"', 0 );")){
		ResultSet rs = db.execToSet("SELECT * FROM travel WHERE user_id = '"+user_id+"' AND board_time = '"+board_time+"';");
		if(rs.next()){
			travel_id = rs.getInt("travel_id");
		}
		if(travel_id == -1){
			%>
			<jsp:forward page="writeTravel.jsp?isFailed=true"/>
			<%
		}else{
			String rTags = multi.getParameter("tags");
			String tags[] = rTags.replace(" ", "").split("#");
			for(int i = 1; i<tags.length; i++){
				if(!db.exec("INSERT INTO travel_tag VALUES ("+travel_id+", '"+tags[i]+"');")){
					%>
					<jsp:forward page="writeTravel.jsp?isFailed=true"/>
					<%
				}
			}
			
			String routes[] = multi.getParameterValues("route");
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