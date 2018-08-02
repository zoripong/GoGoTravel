<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/header_type_02.css">
<script src="include/script/header_type_02.js"></script>
<header>
<!--  
	<video autoplay muted loop id="myVideo">
	  <source src="include/video/search.mp4" type="video/mp4">
	</video>
-->
	<img src="include/image/main.jpg" id="myVideo">
<% 
	String id = (String)session.getAttribute("id");
	Integer level = (Integer)session.getAttribute("level");
	out.println("<section id=\"sc_user\">");
	if(id != null && level != null ){
		out.println("<a id=\"home_link\" href=\"myPage.jsp?tab=1\"><img id=\"img_home\" src=\"include/image/ic_home.svg\"><span id=\"sp_user\">"+id+"</span></a>");
	}else{
		out.println("<a id=\"home_link\" href=\"myPage.jsp?tab=1\"><img class=\"hidden\"  id=\"img_home\" src=\"include/image/ic_home.svg\"><span class=\"hidden\" id=\"sp_user\">"+id+"</span></a>");
		out.println("<a id=\"home_link\" href=\"signin.jsp\">로그인</a>");
	}
	out.println("</section>");
%>

	
	<section id="sc_search">
		<form action="main.jsp">
			<section id="sc_search_container">
				<input id="ic_search_bar" type="text" name="search_keyword" placeholder="여행지를 검색해보세요." required>
				<input id="ic_search_btn" type="image" name="submit" src="include/image/ic_search.svg" alt="Submit" />
			</section>
		</form>
	</section>

</header>

<div id="title">
Just keep going your travel.
</div>

<hr id="separation">