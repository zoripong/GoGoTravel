<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- include jQeury -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>GoGoTravel</title>
<%
	String headerType = request.getParameter("HEADERTYPE");
	
	String contentPage = request.getParameter("CONTENTPAGE");
%>


</head>

<body>
	<jsp:include page="<%= headerType %>" flush="false" />
	<jsp:include page="<%=contentPage%>" flush="false" />
	<jsp:include page="/include/html/footer.jsp" flush="false" />

</body>

</html>