<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/header_type_03.css">
<header>
	<section id="sc_main_link">
		<a href="main.jsp"><img id="img_main" src="include/image/ic_logo.svg"/></a>
	</section>
	<section id="sc_user_info">
	<%
		
		String id = (String)session.getAttribute("id");
		Integer level = (Integer)session.getAttribute("level");
		String levelName[] = {"뚜벅이", "자전거", "기차", "자가용", "비행기" };
		StringBuffer sb = new StringBuffer();
		sb.append("<p id=\"p_user_id\">");
		sb.append("<span class=\"sp_point\">");
		sb.append(id);
		sb.append("</span>");
		sb.append("님");
		sb.append("</p>");
		sb.append("<p id=\"p_user_level\">");
		sb.append("<span class=\"sp_point\">");
		sb.append(levelName[level]+"여행객");
		sb.append("</span>");
		sb.append("이시네요!");
		sb.append("</p>");
		// TODO : 올린 글 개수 / 좋아요 개수
		out.println(sb.toString());
	%>
	</section>
</header>	
<nav>
	<section class="menu_item">
	<a href="myPage.jsp?tab=1">나의 여행</a>
	</section>
	<section class="menu_item">
	<a href="myPage.jsp?tab=2">가자 여행</a>
	</section>
</nav>