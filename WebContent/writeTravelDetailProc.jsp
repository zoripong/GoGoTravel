<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="include/css/writeTravelDetail.css">
<script src="include/script/writeTravelDetail.js"></script>
 
<%

	String travel_id = request.getParameter("travel_id");
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());

	ResultSet rs = db.execToSet("SELECT * FROM route WHERE travel_id = "+travel_id+";");
	ArrayList<String> routes = new ArrayList<>();
	while(rs.next()){
		routes.add(rs.getString("loc"));
	}


%>

<form action="writeTravelDeatilService.jsp">
<%
	StringBuffer sb = new StringBuffer();
	for(int i = 0; i<routes.size(); i++){
		sb.append("<section id=\"sc_detail_"+i+"\">");
		sb.append(routes.get(i)+"<br>");
		sb.append("<img id=\""+i+"\" class=\"add_button\" src=\"include/image/ic_add.svg\">");
		sb.append("</section>");
	}
	
	out.println(sb.toString());


%>
	

</form>