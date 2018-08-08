<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/myPage.css"> 
<%
%>
<script src="include/script/myPage.js"></script>   
<section id="sc_sub_header">
<section id="sc_user_info">
<%
	
	String id = (String)session.getAttribute("id");
	Integer level = (Integer)session.getAttribute("level");
	String levelName[] = {"뚜벅이", "자전거", "기차", "자가용", "비행기" };
	StringBuffer sb = new StringBuffer();
	sb.append("<p id=\"p_user_id\">");
	sb.append("<span class=\"sp_point\">");
	sb.append(id);
	sb.append("</span>");
	sb.append("님");
	sb.append("</p>");
	sb.append("<p id=\"p_user_level\">");
	sb.append("<span class=\"sp_point\">");
	sb.append(levelName[level]+"여행객");
	sb.append("</span>");
	sb.append("이시네요!");
	sb.append("</p>");
	// TODO : 올린 글 개수 / 좋아요 개수
	out.println(sb.toString());
%>
</section>
</section>
<nav>
	<section id="menu_1" class="menu_item">
	<a href="myPage.jsp?tab=1">나의 여행</a>
	</section>
	<section id="menu_2" class="menu_item">
	<a href="myPage.jsp?tab=2">가자 여행</a>
	</section>
</nav>
<section id="sc_list">
<%
	String tabRe[] = {"내 여행 삭제", "가자 여행 삭제"};
	String isSuccess = request.getParameter("isSuccess");
	

	String user_id = (String)session.getAttribute("id");
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	int tab = Integer.parseInt(request.getParameter("tab"));
	out.println("<script>var tab = "+tab+";</script>");

	sb = new StringBuffer();
	if(tab == 1){
		// 내가 작성한 글 목록 가져오기
		ResultSet rs = db.execToSet("select * from travel where user_id = '"+user_id+"' order by board_time desc;");
		while(rs.next()){
			DBExecutor subDb = new DBExecutor(DBConnector.getMySqlConnection());
			ResultSet routeSet = subDb.execToSet("select * from route where travel_id = "+rs.getInt("travel_id")+";");
			StringBuffer routeBuffer = new StringBuffer();
			while(routeSet.next()){
				routeBuffer.append(routeSet.getString("loc"));
				if(!routeSet.last()){
					routeBuffer.append("-");
				}
			}
			sb.append("<section id=\"sc_item\">");
			
			sb.append("<section id=\"sc_photo\">");
			//sb.append("이미지");

			sb.append("<a href=\"travelDetail.jsp?index="+rs.getInt("travel_id")+"\">");
			String path = "image/"+rs.getString("user_id")+"/"+rs.getString("main_img");
			sb.append("<img class=\"main_img\" src=\""+path+"\">");
			sb.append("</a>");
			sb.append("</section>");
			
			sb.append("<section id=\"sc_content\">");		
			sb.append("<a href=\"travelDetail.jsp?index="+rs.getInt("travel_id")+"\">");
			sb.append("<p id=\"p_title\">");
			sb.append(rs.getString("title"));
			sb.append("</p>");
			sb.append("<p id=\"p_loc\">");
			sb.append(routeBuffer.toString());
			sb.append("</p>");
			sb.append("</a>");
			sb.append("</section>");
			
			sb.append("<section id=\"sc_method\">");
			sb.append("<a href=\"writeTravel.jsp?travel_id="+rs.getString("travel_id")+"\">");
			sb.append("<i class=\"fas fa-pen-nib\"></i>");
			sb.append("</a>");
			sb.append("<a href=\"deleteTravelService.jsp?travel_id="+rs.getString("travel_id")+"\">");
			sb.append("<i class=\"far fa-trash-alt\"></i>");
			sb.append("</a>");
			sb.append("</section>");
			
			sb.append("</section>");
		}
	}else if(tab == 2){
		
		
		
		// wish list 가져오기
		String sql = "SELECT travel.travel_id as travel_id, travel.user_id as writer, title,  board_time, start_date, end_date, budget, main_img, wish_travel.user_id as user_id, save_money "
					+ "FROM travel "
					+ "JOIN wish_travel "
					+ "ON travel.travel_id = wish_travel.travel_id "
					+ "WHERE wish_travel.user_id = '"+user_id+"';";
				
		ResultSet rs = db.execToSet(sql);
		while(rs.next()){
			DBExecutor subDb = new DBExecutor(DBConnector.getMySqlConnection());
			ResultSet routeSet = subDb.execToSet("select * from route where travel_id = "+rs.getInt("travel_id")+";");
			StringBuffer routeBuffer = new StringBuffer();
			while(routeSet.next()){
				routeBuffer.append(routeSet.getString("loc"));
				if(!routeSet.last()){
					routeBuffer.append("-");
				}
			}
			sb.append("<section id=\"sc_item\">");
			
			sb.append("<section id=\"sc_photo\">");
			//sb.append("이미지");

			sb.append("<a href=\"travelDetail.jsp?index="+rs.getInt("travel_id")+"\">");
			String path = "image/"+rs.getString("writer")+"/"+rs.getString("main_img");
			sb.append("<img class=\"main_img\" src=\""+path+"\">");
			sb.append("</a>");
			sb.append("</section>");
			
			sb.append("<section id=\"sc_content\">");		
			sb.append("<a href=\"travelDetail.jsp?index="+rs.getInt("travel_id")+"\">");
			sb.append("<p id=\"p_title\">");
			sb.append(rs.getString("title"));
			sb.append("</p>");
			sb.append("<p id=\"p_loc\">");
			sb.append(routeBuffer.toString());
			sb.append("</p>");
			sb.append("</a>");
			sb.append("</section>");
			
			sb.append("<section id=\"sc_wish_method\">");
			sb.append("<a href=\"deleteWishService.jsp?travel_id="+rs.getString("travel_id")+"&user_id="+user_id+"\">");			
			sb.append("<i class=\"far fa-trash-alt\"></i>");
			sb.append("</a>");
			sb.append("</section>");
			
			sb.append("</section>");

		}

	}
	
	if(isSuccess != null){
		if(Boolean.parseBoolean(isSuccess)){
			out.println("<script>alert('"+tabRe[tab-1]+" 성공')</script>");
		}else{
			out.println("<script>alert('"+tabRe[tab-1]+" 실패')</script>");
		}	
	}
	
	out.println(sb.toString());
%>
</section>