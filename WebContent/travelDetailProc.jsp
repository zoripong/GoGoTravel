<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/travelDetail.css">
<%
	String success = request.getParameter("isSuccess");
	
	if(success != null){
		if(!Boolean.parseBoolean(success)){
			out.println("<script>alert('이미 돈을 모으고 있던걸요?');</script>");			
		}
	}
	
	
%>
<%
	String index = request.getParameter("index");
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());

	// 가져와야 하는 table - travel, 
	String sql = "SELECT * FROM travel WHERE travel_id = "+index+";";
	ResultSet travelSet = db.execToSet(sql);
	
	
	String title = "";
	String user_id = "";
	String period = "" ;
	String boardTime = "";
	int budget = -1;
	
	ArrayList<String> tags = new ArrayList<>();
	ArrayList<String> locs = new ArrayList<>();
	
	
	if(travelSet.next()){
		//out.println(travelSet.getString("user_id")+"/"+travelSet.getString("start_date")+"~"+travelSet.getString("end_date")+"/"+travelSet.getString("title")+"/"+travelSet.getString("main_img")+"/"+travelSet.getString("budget"));
		//out.println(new Timestamp(travelSet.getLong("board_time"))+"<br>");
		title = travelSet.getString("title");
		user_id = travelSet.getString("user_id");
		
		// get Period
		final String OLD_FORMAT = "yyyy-MM-dd";
		final String NEW_FORMAT = "yyyy.MM.dd.";
		
		String oldStartDate= travelSet.getString("start_date");
		String oldEndDate = travelSet.getString("end_date");
		
		SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
		Date d = sdf.parse(oldStartDate);
		sdf.applyPattern(NEW_FORMAT);
		period += sdf.format(d);
		
		period += " - ";
		
		sdf.applyPattern(OLD_FORMAT);
		d = sdf.parse(oldEndDate);
		sdf.applyPattern(NEW_FORMAT);
		period += sdf.format(d);
		
		boardTime = new SimpleDateFormat("yyyy.MM.dd. hh:mm").format(travelSet.getLong("board_time"));
		budget = Integer.parseInt(travelSet.getString("budget"));
		//System.out.println("time : "+str);
	}
	
	System.out.println(period);
	

	
	sql = "SELECT * FROM travel_tag WHERE travel_id = "+index+";";
	ResultSet tagSet = db.execToSet(sql);
	while(tagSet.next()){
		tags.add(tagSet.getString("tag"));
		System.out.println(tagSet.getString("tag")+"<br>");
	}	
	
	
	sql = "SELECT * "
		+ "FROM route "
		+ "WHERE travel_id = "+ index + " "
		+ "ORDER BY route_index;";
		
	ResultSet routeSet = db.execToSet(sql);
	System.out.println("<br><b>OVERVIEW</b><br>");
	while(routeSet.next()){
		locs.add(routeSet.getString("loc"));
		System.out.println(routeSet.getString("loc")+"<br>");		
	}
	
	sql = "SELECT loc, img_src, content "
		+ "FROM route "
		+ "RIGHT JOIN route_detail ON route.travel_id = route_detail.travel_id AND route.route_id = route_detail.route_id "
		+ "WHERE route.travel_id = "+ index + " "
		+ "ORDER BY route_index, detail_index;";
	
	ResultSet detailSet = db.execToSet(sql);
	
	while(detailSet.next()){
		System.out.println(detailSet.getString("loc")+"/"+detailSet.getString("img_src")+"/"+detailSet.getString("content")+"<br>");
	}
	
	

	sql = "SELECT * "
		+ "FROM comment "
		+ "WHERE travel_id = "+index+" "
		+ "ORDER BY time ASC;";
		
	ResultSet commentSet = db.execToSet(sql);
	
	while(commentSet.next()){
		System.out.println(commentSet.getString("user_id")+"/"+commentSet.getString("content")+"/"+new Timestamp(commentSet.getLong("time"))+"<br>");
	}
		

	
%>

<%
	
	String wishPage;
	String commentPage;
	if(session.getAttribute("id") == null){
		wishPage = "signin.jsp";
		commentPage = "signin.jsp";
	}else{
		wishPage = "wishService.jsp";
		commentPage = "commentService.jsp";
	}
%>

<form action="<%= wishPage %>">
	<input type="hidden" name="index" value="<%= index %>">
	한 달에 
	<input type="number" name="save_money" required>원 씩 모아서
	<input type="submit" value="가고싶어..">
</form>

<form action="<%= commentPage %>">
	<input type="hidden" name="index" value="<%= index %>">
	<input type="text" name="content" placeholder="댓글을 남겨주세요." required>
	<input type="submit" value="남기기">
</form>

