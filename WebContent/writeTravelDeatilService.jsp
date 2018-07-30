<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="DB.DBConnector"%>
<%@page import="DB.DBExecutor"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	MultipartRequest multi = null;
	String realFolder = "";
	String filename1 = "";
	int maxSize = 1024*1024*5;
		String encType = "UTF-8";
		ServletContext scontext = getServletContext();
		realFolder = scontext.getRealPath("image/"+String.valueOf(session.getAttribute("id")));
		
		try{
			multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			Enumeration<?> files = multi.getFileNames();
			String file1 = (String)files.nextElement();
			filename1 = multi.getFilesystemName(file1);
	} catch(Exception e) {
		e.printStackTrace();
	}

	int count = Integer.parseInt(multi.getParameter("count"));
	int route_id = Integer.parseInt(multi.getParameter("route_id"));
	String travel_id = multi.getParameter("travel_id");
	
	ArrayList<String []> images = new ArrayList<>();
	ArrayList<String []> contents = new ArrayList<>();
	
	for(int i = 0 ; i<count; i++){
		//img_src_
		System.out.println("img_src_"+i+"/content_"+i);
		
		if(multi.getParameterValues("img_src_hidden_"+i) == null){
			System.out.println("img"+i+"ดย null");
			images.add(i, new String[0]);
		}else{
			images.add(i, multi.getParameterValues("img_src_hidden_"+i));	
		}
		
		if(multi.getParameterValues("content_"+i) == null){
			System.out.println(i+"ดย null");
			contents.add(i, new String[0]);
		}else{
			contents.add(i, multi.getParameterValues("content_"+i));
		}
	}
	
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	
	
	System.out.println(count+"??");
	for(int i = 0; i<count; i++){
		System.out.println(i);
		for(int j = 0; j<images.get(i).length; j++){
			
			String image = (images.get(i)[j].equals(""))?"null":"'"+images.get(i)[j]+"'";
			String content = (contents.get(i)[j].equals(""))?"null":"'"+contents.get(i)[j]+"'";
			String sql = "INSERT INTO route_detail VALUES("+travel_id+", "+(route_id+i)+", "+(j+1)+", "+image+", "+content+");";
			System.out.println(sql);
			if(!db.exec(sql)){
				%>
				<jsp:forward page="writeTravelDetail.jsp?isFailed=true"/>
				<%
			}
		}
	}
	%>
<jsp:forward page="myPage.jsp?tab=1"/>

