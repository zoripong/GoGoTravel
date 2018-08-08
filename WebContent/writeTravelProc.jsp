<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="include/script/writeTravel.js"></script>
 
 <%
 	if(request.getParameter("isFailed")!=null){
 		out.println("<script>alert('등록에 실패하였습니다. 다시 시도해주세요. =(')</script>");
 	}
 %>
 
<link rel="stylesheet" type="text/css" href="include/css/writeTravel.css">
<section id="sc_write">
	<form id="content_form"  enctype="multipart/form-data" action="writeTravelService.jsp" method="POST">
	 	<input type="hidden" name="user_id" value="<%=session.getAttribute("id")%>">
	 	<input type="hidden" name="board_time" value="<%= System.currentTimeMillis()%>">
	<%
		String travel_id = request.getParameter("travel_id");
		if(travel_id != null){
			out.println("<input type='hidden' name='travel_id' value='"+travel_id+"'>");
		}
	%>
	 
	 	<section id="sc_title">
	 		<section class="sub_title">
		 		<div class="sub_title_point"></div>
				<p>당신의 여행에 제목을 붙여주세요.</p>
	 		</section>
	 		
		 	<input id="input_title" type="text" name="title" placeholder="Please Fill in the Blank" required><br>
	 	</section>
	 	
		
		<section id="sc_detail">
		 	<section class="sub_title">
		 		<div class="sub_title_point"></div>
				<p>언제 여행을 떠나셨나요?</p>
	 		</section>
		 	<input id="input_start_date" type="date" name="start_date" required>-
		 	<input id="input_end_date" type="date" name="end_date" required><br>
		 	<section class="sub_title">
		 		<div class="sub_title_point"></div>
				<p>여행에 얼마를 사용하셨나요?</p>
	 		</section>
		 	<input id="input_budget" type="number" name="budget" placeholder="Please Fill in the Blank" required><br>
		</section>
		
	 	<section id="sc_tag">
		 	<section class="sub_title">
		 		<div class="sub_title_point"></div>
				<p>어울리는 태그를 지어주세요.</p>
	 		</section>
		 	<input id="input_tag" type="text" name="tags" placeholder="Please Fill in the Blank" required>
		</section> 
		
		<section id="sc_route">
			<section class="sub_title">
		 		<div class="sub_title_point"></div>
				<p>여행지 경로를 공유해주세요.</p>
	 		</section>
		 	<section id="sc_route_list">
			 	<section class="sc_route_item">
				 	<p>#1</p><input class="input_route" type="text" name="route" placeholder="여행지를 적어주세요." required>
			 	</section>
		 	</section>
		 	<i id="add_route_button" class="fas fa-plus fa-3x"></i>
		 </section> 	
		
		<section id="sc_main_image">
			<section class="sub_title">
		 		<div class="sub_title_point"></div>
				<p>여행의 메인 사진을 지정해주세요.</p>
	 		</section>
	 		<i id="main_image_clicker" class="far fa-image fa-10x"></i>
	 		<img id="preview">
		 	<input id="main_image" type="file" name="main_image" accept="image/*" required ><br>
		</section> 	
		
	
	 	<input id="submit_button" type="submit" value="다음단계로">
	 </form>
</section>