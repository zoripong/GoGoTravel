<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="include/css/main.css">
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

			//Path 구하기
			String path = "image/"+rs.getString("user_id")+"/"+rs.getString("main_img");
		 	System.out.println("Path is "+path);
		 	
			//Date Format 변환
			final String OLD_FORMAT = "yyyy-MM-dd";
			final String NEW_FORMAT = "yyyy.MM.dd.";
			
			String oldStartDate= rs.getString("start_date");
			String oldEndDate = rs.getString("end_date");
			String period = "";
			
			SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
			Date d = sdf.parse(oldStartDate);
			sdf.applyPattern(NEW_FORMAT);
			period += sdf.format(d);
			
			period += " - ";
			
			sdf.applyPattern(OLD_FORMAT);
			d = sdf.parse(oldEndDate);
			sdf.applyPattern(NEW_FORMAT);
			period += sdf.format(d);
			
			sb.append("<a class=\"item_link\" href=\"travelDetail.jsp?index="+rs.getInt("travel_id")+"\">");
			sb.append("<section class=\"sc_item\">");
			sb.append("<div class=\"img_container\">");
			sb.append("<img class=\"main_img\" src=\""+path+"\">");
			sb.append("</div>");
			sb.append("<p class=\"p_title\">"+rs.getString("title")+"</p>");
			sb.append("<p class=\"p_date\">"+period+"</p>");
			sb.append("<p class=\"p_budget\">&#8361 "+rs.getInt("budget")+"</p>");
			sb.append("</section>");
			sb.append("</a>");

			count+=1;
		}

		// 8개 이상일 때는 그 줄만 마무리 될 수 있게
		// 8개 이하일 때는 8개를 채워서
		while(count % 4 != 0 || count < 8){
			System.out.println(count);
			if(count % 4 == 0 && count < 8){
				sb.append("</section><section class=\"sc_line\">");
			}
			if(count <= 8){
				sb.append("<a href=\"writeTravel.jsp\">");
				sb.append("<section class=\"sc_item\">");
			}else{
				sb.append("<section class=\"sc_item hidden\">");	
			}
			sb.append("<div class=\"img_container\">");
			sb.append("<img class=\"main_img image_opacity\" src=\"include/image/exsit.jpg\">");
			sb.append("</div>");
			sb.append("<p class=\"p_date hidden\">2018.07.30. - 2018.08.01.</p>");
			sb.append("<p class=\"p_title text_center guide_message\">당신의 이야기를 들려주세요.</p>");
			sb.append("<p class=\"p_budget hidden\">&#8361 50000</p>");
			sb.append("</section>");
			if(count <=8){
				sb.append("</a>");
			}
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
//	out.println(sb.toString());
%>
<section id="sc_travel_list">
<%= sb.toString() %>
</section>
<section id="sc_float_btn">
	<a href="writeTravel.jsp">
	    <img id="float_btn" src="include/image/ic_floating_add.svg" alt="">
	</a>
</section>