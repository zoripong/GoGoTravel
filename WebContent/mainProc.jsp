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
	
	if(keyword == null){
		// 전체 출력 (최신 순으로)
		ResultSet rs = db.execToSet("select * from travel order by board_time desc;");
		
		while(rs.next()){
			sb.append("<a href=\"travelDetail.jsp?index="+rs.getInt("travel_id")+"\">");
			sb.append(rs.getString("title"));
			sb.append("</a><br>");
			System.out.println(rs.getString("title")+"/"+rs.getInt("budget")+"<br>");
		}
	}else{
		// 검색이 포함된 순으로 !
		System.out.println(keyword);
		sb.append("검색 기능이 준비 중입니다.");
	}
	out.println(sb.toString());
%>
    <section id="sc_float_btn">
    <a href="writeTravel.jsp">
        <img id="float_btn" src="include/image/ic_floating_add.svg" alt="">
    </a>
    </section>