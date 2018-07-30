<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="include/css/writeTravelDetail.css">
<script src="include/script/writeTravelDetail.js"></script>
 
<%

	if(request.getParameter("isFailed")!=null){
		out.println("<script>alert('게시에 실패하였습니다. 다시 시도해주세요.');</script>");	
	}

	String travel_id = request.getParameter("travel_id");
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());

	ResultSet rs = db.execToSet("SELECT * FROM route WHERE travel_id = "+travel_id+" ORDER BY route_id;");
	ArrayList<String> routes = new ArrayList<>();
	int route_id = -1;

	
	while(rs.next()){
		if(rs.isFirst()){
			route_id = rs.getInt("route_id");
		}
		routes.add(rs.getString("loc"));
	}


%>

<form id="serviceForm" action="writeTravelDeatilService.jsp" enctype="multipart/form-data"  method="POST">
	<input type="hidden" name="travel_id" value="<%= travel_id%>">
	<input type="hidden" name="route_id" value="<%= route_id %>">
	<input id="route_size" type="hidden" name="count" value="<%= routes.size()%>">
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
	<input id="testBtn" type="button">
	<input type="submit" value="제출하기" >
</form>