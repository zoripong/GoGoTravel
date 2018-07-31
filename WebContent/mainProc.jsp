<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="include/css/main.css">
<section id="sc_travel_list">
<%

	String keyword = request.getParameter("search_keyword");
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	
	StringBuffer sb = new StringBuffer();
	boolean isExsit = false;
	if(keyword == null){
		// 전체 출력 (최신 순으로)
		ResultSet rs = db.execToSet("select * from travel order by board_time desc;");
		
		int count = 0;
		while(rs.next()){
			
			if(count % 4 == 0){
				if(count!=0){
					sb.append("</section>");
				}
				sb.append("<section class=\"sc_line\">");
			}
			
			sb.append("<section class=\"sc_item\">");
			sb.append("<div class=\"img_container\">");
			sb.append("<img class=\"main_img\" src=\"include/image/test.jpg\">");
			sb.append("</div>");
			sb.append("<p class=\"p_title\">제주도 이야기</p>");
			sb.append("<p class=\"p_date\">2018-07-08~2018-07-15</p>");
			sb.append("<p class=\"p_budget\">500,000</p>");
			sb.append("</section>");
			//sb.append("<a href=\"travelDetail.jsp?index="+rs.getInt("travel_id")+"\">");
			//sb.append(rs.getString("title"));
			//sb.append("</a><br>");
			//System.out.println(rs.getString("title")+"/"+rs.getInt("budget")+"<br>");
			count+=1;
		}
		
		while(count % 4 != 0){
			sb.append("<section class=\"sc_item\">");
			sb.append("<img class=\"main_img\" src=\"include/image/test.jpg\">");
			sb.append("<p class=\"p_title\">제주도 이야기</p>");
			sb.append("<p class=\"p_date\">2018-07-08~2018-07-15</p>");
			sb.append("<p class=\"p_budget\">500,000</p>");
			sb.append("</section>");
			count +=1;
		}
		if(count==0){
			sb.append("<p id=\"p_info\">아직 데이터가 없습니다!<br>첫번째 여행객이 되어주세요!</p>");
		}else{
			sb.append("</section>");
		}
	}else{
		// 검색이 포함된 순으로 !
		System.out.println(keyword);
		sb.append("<p id=\"p_info\">아직 데이터가 없습니다!<br>첫번째 여행객이 되어주세요!</p>");
	}
	out.println(sb.toString());
%>
	
</section>
<section id="sc_float_btn">
	<a href="writeTravel.jsp">
	    <img id="float_btn" src="include/image/ic_floating_add.svg" alt="">
	</a>
</section>