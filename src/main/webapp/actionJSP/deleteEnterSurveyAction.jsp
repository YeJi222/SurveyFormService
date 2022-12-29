<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="create.EnterDTO" %>
<%@ page import="create.EnterDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%
	request.setCharacterEncoding("UTF-8");

	String surveyID = null;
	String enterID = null;
	
	if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
		enterID = (String) session.getAttribute("userID");
	}
	if(request.getParameter("surveyID") != null){
		surveyID = request.getParameter("surveyID");
	}
	
	if(enterID == null){
		System.out.println("로그아웃 상태입니다.");
		
		return;
	}
	
	System.out.print("Survey ID : ");
	System.out.println(surveyID);
	System.out.print("Admin ID : ");
	System.out.println(enterID);
	
	EnterDAO createDAO = new EnterDAO();
	
	int result = createDAO.deleteEnterList(surveyID, enterID);
	if(result == -1){
		System.out.println("sql error -1");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'create.jsp';");
		script.println("</script>");
		script.close();
		
		// return;
	} else{
		/* System.out.print("Result : ");
		System.out.println(result); */
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'home.jsp';");
		script.println("</script>");
		script.close();
		// return;
	}
%>