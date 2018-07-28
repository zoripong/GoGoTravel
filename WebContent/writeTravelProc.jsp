<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 여기는 글을 작성해야하는 페이지이지요..
 <script src="include/script/writeTravel.js"></script>
 
 <%
 	if(request.getParameter("isFailed")!=null){
 		out.println("<script>alert('등록에 실패하였습니다. 다시 시도해주세요. =(')</script>");
 	}
 
 %>
<link rel="stylesheet" type="text/css" href="include/css/writeTravel.css">
<form id="content_form" action="writeTravelService.jsp" method="POST">
 	<input type="hidden" name="user_id" value="<%=session.getAttribute("id")%>">
 	<input type="hidden" name="board_time" value="<%= System.currentTimeMillis()%>">
 
 	<section id="sc_title">
	 	<input type="text" name="title" required><br>
 	</section>
 	
	<section id="sc_main_image">
	 	<input type="file" name="main_image" accept="image/*" required ><br>
	</section> 	
	
	<section id="sc_detail">
	 	<input type="date" name="start_date" required>-
	 	<input type="date" name="end_date" required><br>
	 	<input type="number" name="budget" required><br>
	</section>
	
 	<section id="sc_tag">
	 	<input type="text" name="tags" required>
	</section> 
	
	<section id="sc_route">
	 	<section id="sc_route_list">
		 	<input type="text" name="route" required>
	 	</section>
	 	
	 	<img id="add_route_button" src="include/image/ic_add.svg" ><br>
	</section> 	

 	<input type="submit" value="등록">
 </form>
