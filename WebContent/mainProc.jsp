<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="include/css/main.css">
 
<%
	String keyword = request.getParameter("search_keyword");
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	if(keyword == null){
		// 전체 출력 (최신 순으로)
		ResultSet rs = db.execToSet("select * from travel order by board_time desc;");
		while(rs.next()){
			out.println(rs.getString("title")+"/"+rs.getInt("budget")+"<br>");
		}
	}else{
		// 검색이 포함된 순으로 !
		out.println(keyword);
	}
%>
    <section id="sc_float_btn">
    <a href="writeTravel.jsp">
        <img id="float_btn" src="include/image/ic_floating_add.svg" alt="">
    </a>
    </section>