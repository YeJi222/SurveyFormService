<!-- surveyID 구해주는 action page -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%
	request.setCharacterEncoding("UTF-8");

	int surveyID = 0;
	String adminID = null;
	
	if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
		adminID = (String) session.getAttribute("userID");
	}
	
	CreateDAO createDAO = new CreateDAO();
	
	int result = createDAO.loadSurveyID(adminID);
	if(result == -1){
		System.out.println("sql error -1");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'create.jsp';");
		script.println("</script>");
		script.close();
		
		return;
	} else{
		session.setAttribute("userID", adminID);
		System.out.println("Success to load surveyID");
		System.out.print("SurveyID MAX : ");
		System.out.println(result + 1);
		
		PrintWriter script = response.getWriter();
		script.print(result + 1); // ajax success로 data 보내주기 
		script.close();
		
		return;
	}
%>