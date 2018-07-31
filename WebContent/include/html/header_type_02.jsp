<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/header_type_02.css">
<header>
<% 
	String id = (String)session.getAttribute("id");
	Integer level = (Integer)session.getAttribute("level");
	out.println("<section id=\"sc_user\"><span id=\"sp_user\">");
	if(id != null && level != null ){
		out.println("<a href=\"myPage.jsp?tab=1\">"+id+"님</a>");
	}else{
		out.println("<a href=\"signin.jsp\">로그인</a>");
	}
	out.println("</span></section>");
%>
	<section id="sc_search">
		<form action="main.jsp">
			<input id="ic_search_bar" type="text" name="search_keyword" placeholder="여행지를 검색해보세요." required>
			<input id="ic_search_btn" type="image" name="submit" src="include/image/ic_search.svg" alt="Submit" />
		</form>
	</section>
</header>
