<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	int tab = Integer.parseInt(request.getParameter("tab"));
	String user_id = (String)session.getAttribute("id");
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	
	StringBuffer sb = new StringBuffer();
	sb.append("<br>");
	if(tab == 1){
		// 내가 작성한 글 목록 가져오기
		ResultSet rs = db.execToSet("select * from travel where user_id = '"+user_id+"' order by board_time desc;");
		while(rs.next()){
			sb.append("<a href=\"travelDetail.jsp?index="+rs.getInt("travel_id")+"\">");
			sb.append(rs.getString("title"));
			sb.append("</a>");
			sb.append("<a href=\"writeTravel.jsp?travel_id="+rs.getString("travel_id")+"\">수정하기</a>");
			sb.append("<a href=\"deleteTravelService.jsp?travel_id="+rs.getString("travel_id")+"\">삭제하기</a>");
			sb.append("<br>");
			System.out.println(rs.getString("title")+"/"+rs.getInt("budget")+"<br>");
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
			sb.append("<a href=\"travelDetail.jsp?index="+rs.getInt("travel_id")+"\">");
			sb.append(rs.getString("travel_id"));
			sb.append("</a>");
			sb.append("<a href=\"deleteWishService.jsp?travel_id="+rs.getString("travel_id")+"&user_id="+user_id+"\">삭제하기</a>");			
			sb.append("<br>");
		}
	}
	
	out.println(sb.toString());
%>