<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
<%@ page import="create.QuestionDTO" %>
<%@ page import="create.QuestionDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%
	request.setCharacterEncoding("UTF-8");

	int surveyID = 0;
	int questionID = 0;
	int optionID = 0;
	String adminID = null;
	String inputData = null;
	
	if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
		adminID = (String) session.getAttribute("userID");
	}
	if(request.getParameter("surveyID") != null){
		surveyID = Integer.parseInt(request.getParameter("surveyID"));
	}
	if(request.getParameter("questionID") != null){
		questionID = Integer.parseInt(request.getParameter("questionID"));
	}
	if(request.getParameter("optionID") != null){
		optionID = Integer.parseInt(request.getParameter("optionID"));
	}
	if(request.getParameter("inputData") != null){
		inputData = request.getParameter("inputData");
	}
	
	if(adminID == null){
		System.out.println("로그아웃 상태입니다.");
		
		return;
	}
	
	System.out.print("Survey ID : ");
	System.out.println(surveyID);
	System.out.print("questionID : ");
	System.out.println(questionID);
	System.out.print("Admin ID : ");
	System.out.println(adminID);
	System.out.print("inputData : ");
	System.out.println(inputData);
	
	CreateDAO createDAO = new CreateDAO();
	
	int result = createDAO.updateOptionContent(surveyID, questionID, optionID, inputData);
	if(result == -1){
		System.out.println("sql error -1");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		// script.println("location.href = 'create.jsp';");
		script.println("</script>");
		script.close();
		
		// return;
	} else{
		session.setAttribute("userID", adminID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		// script.println("location.href = 'home.jsp';");
		script.println("</script>");
		script.close();
		// return;
	}
	
	QuestionDAO resultDAO = new QuestionDAO();
	int result2 = resultDAO.updateOptionContent_resultContent(surveyID, questionID, optionID, inputData);
	if(result2 == -1){
		System.out.println("sql error -1");
	} else{
		System.out.println("Success to update optionContent");
	}
%>