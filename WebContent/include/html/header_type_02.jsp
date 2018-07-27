<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	String id = (String)session.getAttribute("id");
	Integer level = (Integer)session.getAttribute("level");
	if(id != null && level != null ){
		out.println("<a href=\"myPage.jsp?tab=1\">"+id+"님</a>");
	}else{
		out.println("<a href=\"signin.jsp\">로그인</a>");
		
	}
%>

<br>
<form action="main.jsp">
	<input type="text" name="search_keyword" placeholder="여행지를 검색해보세요." required>
	<input id="ic_signin" type="image" name="submit" src="include/image/ic_search.svg" border="0" alt="Submit" />
</form>
