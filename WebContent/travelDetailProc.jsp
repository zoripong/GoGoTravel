<%@page import="model.RouteDetail"%>
<%@page import="model.Route"%>
<%@page import="model.Comment"%>
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
	
	sql = "SELECT route_index, loc, detail_index, travel.user_id, img_src, content "
		+ "FROM route "
		+ "RIGHT JOIN route_detail ON route.travel_id = route_detail.travel_id AND route.route_id = route_detail.route_id "
		+ "JOIN travel ON travel.travel_id = route.travel_id "
		+ "WHERE route.travel_id = "+ index + " "
		+ "ORDER BY route_index, detail_index;";
	
	ResultSet detailSet = db.execToSet(sql);
	ArrayList<Route> routes = new ArrayList<Route>();
	while(detailSet.next()){
		if(routes.size() != detailSet.getInt("route_index"))
			routes.add(new Route(detailSet.getInt("route_index"), detailSet.getString("loc")));
		routes.get(detailSet.getInt("route_index")-1).addDetail(detailSet.getInt("detail_index")-1, new RouteDetail(detailSet.getInt("detail_index"), detailSet.getString("user_id"), detailSet.getString("img_src"), detailSet.getString("content")));
	}
	
	StringBuffer detailSb = new StringBuffer();
	for(int i = 0; i<routes.size(); i++){
		Route route = routes.get(i);
		detailSb.append("<section class=\"sc_loc\">");
		detailSb.append("<div class=\"p_loc_point\"></div>");
		detailSb.append("<p class=\"p_loc\">");
		detailSb.append(route.getLoc());
		detailSb.append("</p>");
		detailSb.append("</section>");
		detailSb.append("<section class=\"sc_loc_detail\">");
		
		for(int j = 0; j<route.getRouteDetails().size(); j++){
			RouteDetail routeDetail = route.getRouteDetails().get(j);
			if(routeDetail.getImageSrc()!=null)
				detailSb.append("<img src=\"image/"+routeDetail.getUserId()+"/"+routeDetail.getImageSrc()+"\">");
			if(routeDetail.getContent() != null )
				detailSb.append("<p>"+routeDetail.getContent()+"</p>");
		}
		detailSb.append("</section>");
	}
	System.out.println("SIZE : "+routes.size());
	
	sql = "SELECT * "
		+ "FROM comment "
		+ "WHERE travel_id = "+index+" "
		+ "ORDER BY time ASC;";
		
	ResultSet commentSet = db.execToSet(sql);
	ArrayList<Comment> comments = new ArrayList<>();
	while(commentSet.next()){
		if(!commentSet.getString("content").equals("null"))
			comments.add(new Comment(commentSet.getInt("comment_id"), commentSet.getString("user_id"), commentSet.getString("content"), commentSet.getLong("time")));
//		System.out.println(commentSet.getString("user_id")+"/"+commentSet.getString("content")+"/"+new Timestamp(commentSet.getLong("time"))+"<br>");
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
<section id="sc_title">
	<p id="p_title">
		<%= title %>
		<p id="p_tags">
			<%
				for(String tag : tags){
					out.println("<a href=\"main.jsp?search_keyword="+tag+"\">#"+tag+"</a>");
				}
			%>
		</p>
		
	</p>
	<section id="sc_detail">
		<p>
			작성자: <%= user_id %>
		</p>
		<p>
			게시시간: <%= boardTime %>
		</p>
	</section>
</section>
<section id="sc_cotent">
	<section class="sc_sub_title">
		<div class="sub_title_point"></div>
		<p class="p_sub_title">
			overview
		</p>
	</section>
	<section id="sc_overview">
		<p><p class="p_overview_sub_title">예산 :</p> <%=budget%></p>
		<p><p class="p_overview_sub_title">기간 :</p> <%=period%></p>
		<p><p id="p_overview_sub_title_loc" class="p_overview_sub_title">여행지역</p>
			<%
				for(int i = 0; i<locs.size(); i++){
					out.println("<p class=\"p_loc_item\">"+locs.get(i)+"</p>");
				}
			%>
		</p>
	</section>
	<section class="sc_sub_title">
		<div class="sub_title_point"></div>
		<p class="p_sub_title">
			detail
		</p>
	</section>
	<section id="sc_content_detail">
		<%= detailSb.toString() %>
	</section>

	<section id="sc_comment">
		<i class="fas fa-comment-alt"></i>
		<p>comment</p>	
		<hr id="comment_seperation">
		<%
			if(comments.size() == 0){
				out.println("<p id=\"p_guide_message\">아직 등록된 댓글이 없네요!</p>");
			}
			for(Comment comment : comments){
				out.println("<section class=\"sc_comment_item\">");
				out.println("<p class=\"p_comment_user\">");
				out.println(comment.getUserId());
				out.println("</p>");
				out.println("<p class=\"p_comment_time\">");
				out.println(comment.getTime());
				out.println("</p>");
				out.println("<p class=\"p_comment_content\">");
				out.println(comment.getContent());
				out.println("</p>");
				out.println("</section>");
			}
		%>
	</section>
	
	<section id="sc_comment_input">
		<form action="<%= commentPage %>">
			<input type="hidden" name="index" value="<%= index %>">
			
			<input id="input_comment" type="text" name="content" placeholder="댓글을 남겨주세요." required>
			
		</form>
	</section>
</section>
	
<section id="sc_wish">
	<form action="<%= wishPage %>">
		<input type="hidden" name="index" value="<%= index %>">
		<p id="p_month">한 달에 </p>
		<input id="input_money" type="number" name="save_money" required><p id="p_money">원 씩 모아서</p>
		<input id="submit_text" type="submit" value="가고싶어..">
	</form>
</section>
