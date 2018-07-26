<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="include/css/template.css">
<link rel="stylesheet" type="text/css" href="include/css/footer.css">
<title>Insert title here</title>
<%
	String contentPage = request.getParameter("CONTENTPAGE");
%>


</head>

<body>
	<jsp:include page="<%=contentPage%>" flush="false" />
</body>

</html>